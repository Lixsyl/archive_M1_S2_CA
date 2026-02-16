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
  raise (RegallocException (__FUNCTION__^" not implemented yet"))

(* ---- Interference graph construction ---- *)
(* Builds the integer and float interference graphs from liveness info.
   Temps in 'ignore' are skipped.
   Returns (integer_graph, float_graph).
*)
let build_interference (instrs : Asm.instr list) (live : info array) :
    Graph.t * Graph.t =
  raise (RegallocException (__FUNCTION__^" not implemented yet"))

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
  raise (RegallocException (__FUNCTION__ ^" not implemented yet"))

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
  raise (RegallocException (__FUNCTION__ ^" not implemented yet"))

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
