open Treelib
open Utils

exception RegallocException of string

type info = { live_in : SSet.t; live_out : SSet.t }

let use (i : Asm.instr) : SSet.t =
  match i with
  | Oper { dst; src; _ } ->
      let base = SSet.of_list src in
      base
  | Move { src; _ } -> SSet.singleton src
  | Label _ -> SSet.empty

let def (i : Asm.instr) : SSet.t =
  match i with
  | Oper { dst; _ } -> SSet.of_list dst
  | Move { dst; _ } -> SSet.singleton dst
  | Label _ -> SSet.empty

(* ---- Liveness analysis (backward dataflow) ---- *)
(* Computes live_in and live_out sets for each instruction using
   backward dataflow iteration until a fixed point.

   For each instruction i:
     live_out[i] = ⋃ live_in[s] for all successors s of i
     live_in[i]  = use[i] ∪ (live_out[i] − def[i])

   Algorithm:
   1. Initialize all live_in/live_out sets to empty.
   2. Repeatedly iterate backward over instructions:
        - Recompute live_out from successors.
        - Recompute live_in from use/def equations.
   3. Stop when no set changes (fixed point reached).
*)
let analyze (instrs : Asm.instr list) : info array =
  let len_instrs = List.length instrs in
  let res = Array.init len_instrs (fun _ -> { live_in = SSet.empty; live_out = SSet.empty }) in
  let succ = Asm.build_succ instrs in
  (*let label_map =
    let tbl = Hashtbl.create 16 in
    List.iteri (fun i instr ->
      match instr with
      | Asm.Label { lab; _ } -> Hashtbl.add tbl lab i
      | _ -> ()
    ) instrs;
    tbl in
  let succ = 
    let tbl = Array.init len_instrs (fun _ -> []) in
    List.iteri
      (fun i instr ->
        if i < len_instrs - 1 then tbl.(i) <- [i+1] else ();
        (match instr with
        | Asm.Oper { jump = Some labels; _ } ->
            List.iter 
            (fun l ->
              match Hashtbl.find_opt label_map l with
              | Some lab_i -> tbl.(i) <- lab_i :: tbl.(i)
              | None -> ()) 
            labels
        | _ -> ()))
      instrs;
    tbl in*)
  let rec aux ins n changed = 
    (match ins with 
    | [] -> changed
    | x :: xs ->  let use1 = use x in
                  let def1 = def x in
                  let lo = List.fold_left (fun acc i -> SSet.union acc res.(i).live_in) SSet.empty succ.(n) in
                  let li = SSet.union use1 (SSet.diff lo def1) in 
                  let ch = changed || not (SSet.equal li res.(n).live_in) || not (SSet.equal lo res.(n).live_out) in
                  let () = res.(n) <- { live_in = li; live_out = lo } in 
                  aux xs (n-1) ch) in 
  let rec loop () =
    let ch = aux (List.rev(instrs)) (len_instrs-1) false in
    if ch then loop () else res
  in loop ()

(* ---- Interference graph construction ---- *)
(* Builds the integer and float interference graphs from liveness info.
   Temps in 'ignore' are skipped.
   Returns (integer_graph, float_graph).
*)
let build_interference (instrs : Asm.instr list) (live : info array) :
    Graph.t * Graph.t =
  let int_graph = Graph.empty () in
  let float_graph = Graph.empty () in
  let tmps = List.fold_left 
              (fun acc instr -> SSet.union acc (SSet.union (use instr) (def instr))) 
              SSet.empty instrs in
  let () =  SSet.iter (fun t ->
              if Tree_helper.is_float_temp t then
                Graph.add_node float_graph t
              else
                Graph.add_node int_graph t
            ) tmps in 
  let () = List.iteri
          (fun i instr ->
            let live_out = live.(i).live_out in
            let lst_live = SSet.elements live_out in
            let rec aux = function
              | [] -> ()
              | x :: xs ->
                  List.iter
                    (fun y -> let x_is_float = Tree_helper.is_float_temp x in
                              let y_is_float = Tree_helper.is_float_temp y in
                              if x_is_float && y_is_float then
                                Graph.add_edge float_graph x y
                              else if not x_is_float && not y_is_float then
                                Graph.add_edge int_graph x y
                              else ())
                    xs;
                  aux xs
            in aux lst_live)
          instrs
  in (int_graph, float_graph)

(* ---- Simplify phase (graph reduction) ---- *)
(* Implements the simplify phase of graph coloring.

   Repeatedly:
     - Pick a node with degree < k if possible.
     - If none exists, pick an arbitrary node (potential spill).
     - Remove it from the graph and push it onto a stack.

   The resulting stack gives a reverse elimination order
   for coloring (low-degree nodes first when popping).

   A copy of the graph is used so the original is preserved.
*)
let simplify ~(k : int) (g : Graph.t) : Asm.temp list =
  let graph = Hashtbl.copy g in
  let pick_node gr = 
    let chosen =  Seq.find_map 
                  (fun node -> if Graph.degree gr node < k then Some node else None) 
                  (Hashtbl.to_seq_keys gr) in 
    (match chosen with
    | Some node -> Some node
    | None -> (match Seq.uncons (Hashtbl.to_seq_keys gr) with
              | Some (x, _) -> Some x
              | None -> None)) in
  let rec aux gr res = 
    match pick_node gr with 
    | Some node ->  let ress = node :: res in
                    let () = Graph.remove_node gr node in
                    aux gr ress
    | None -> res
  in aux graph []

(* ---- Select phase (assign colors) ---- *)
(* Pops nodes from the simplify stack and assigns registers.

   For each temp t:
     - Collect the set of colors already assigned to its neighbors.
     - Choose a register from 'registers' not in that set.
     - If one exists, assign it.
     - Otherwise, mark t as spilled.

   Returns:
     - A mapping temp -> assigned register.
     - A list of spilled temps.
*)
let select ~(registers : Asm.temp list) (g : Graph.t) (stack : Asm.temp list) :
    Asm.temp SMap.t * Asm.temp list =
  let rec aux st assigned spilled = 
    match st with
    | [] -> (assigned, spilled)
    | t :: ts ->
        let neighbors = Graph.neighbors g t in
        let used_colors = SSet.fold (fun n acc -> match SMap.find_opt n assigned with Some r -> SSet.add r acc | None -> acc) neighbors SSet.empty in
        let available = List.filter (fun r -> not (SSet.mem r used_colors)) registers in
        (match available with 
        | [] -> let sp = t :: spilled in aux ts assigned sp
        | x :: xs -> let ass = SMap.add t x assigned in aux ts ass spilled)
  in aux stack SMap.empty []

(* ---- Full graph coloring driver ---- *)
type colorization = {
  physical_bindings : Asm.temp SMap.t;
  spills : Asm.temp list;
}

(* Steps:
   1. Run simplify to compute elimination stack.
   2. Run select to assign registers and detect spills.
   3. Add precolored temps (fixed hardware registers) to the map.

   k = number of available registers.
   registers = list of allocatable registers.
   precolored = fixed temp -> register bindings.

   Returns:
     - Final temp -> register mapping.
     - List of spills (if any).
 *)
let color ~(registers : Asm.temp list) ~(precolored : (string * string) list)
    (g : Graph.t) : colorization =
  let k = List.length registers in
  let stack = simplify ~k g in
  let colormap, spills = select ~registers g stack in
  let colormap =
    List.fold_left
      (fun acc (ir_arg, assembly_arg) -> SMap.add ir_arg assembly_arg acc)
      colormap precolored
  in
  { physical_bindings = colormap; spills }
