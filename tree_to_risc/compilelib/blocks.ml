open Treelib
open! Tree
open! Tree_helper
open! Utils

(* Basic block formation with fall-through insertion *)
(* ================================================= *)

(*
- Separate literals from code
  Keep string/data labels (Litteral) apart from control-flow code.
  This preserves .data vs .text separation for later passes.

- Identify routines
  Each routine starts at a Label <name> and ends at Label "end".
  This allows later passes to process functions individually.

- Decompose routines into basic blocks
  Each basic block Starts at a Label
  Ends at a Jump, Cjump, or routine end
  Has a body of sequential instructions
  Fall-throughs (implicit next-block execution) are made explicit via jumps.

- Normalize control flow
  Ensure every Cjump is immediately followed by its false label.
  Simplifies later analyses: liveness, CFG, optimization, or code generation.

- Reassemble
  After reordering, rebuild a valid linear program.
*)


(* Right now, basic block reordering is not implemented. CJUMP
   normalization (which is necessary) is made in Linearization. You
   can implement here the basic block reordering, with correct
   handling of CJUMP normalization, in which case the normalize_cjump
   function of linearization will have no effect *)

let split_literals_routines (p : program) : program * program list =
  let rec aux acc1 acc2 current = function
    | [] -> (match current with
            | [] -> (List.rev acc1, List.rev acc2)
            | _ -> (List.rev acc1, List.rev (List.rev current :: acc2)))
    | x :: xs -> (
        match x.payload with
        | Litteral _ -> aux (x :: acc1) acc2 current xs
        | Label "end" -> aux acc1 ((List.rev (x :: current)) :: acc2) [] xs
        | _ -> aux acc1 acc2 (x :: current) xs) 
  in aux [] [] [] p

let split_blocks (label_gen : unit -> string) (routine : program) : program list =
  let rec aux acc current = function
    | [] -> (match current with
            | [] -> List.rev acc
            | _ -> List.rev (List.rev current :: acc))
    | x :: xs -> 
        (match x.payload with
        | Label "end" -> (match current with
                        | [] -> failwith "Error split_blocks aux Label end"
                        | _ ->  aux (List.rev (x :: current) :: acc) [] xs)
        | Label l -> (match current with
                      | [] -> aux acc [x] xs
                      | _ ->  let jump = (loc (Jump (loc (Name l), []))) in 
                              aux (List.rev (jump :: current) :: acc) [x] xs)
        | Jump _ | Cjump _ -> 
                (match current with
                | [] -> let lab = label_gen () in 
                        aux ((loc (Label lab) :: [x]) :: acc) [] xs
                | _ -> aux (List.rev (x :: current) :: acc) [] xs)
        | _ ->  (match current with
                | [] -> let lab = label_gen () in 
                        aux acc (x :: [loc (Label lab)]) xs
                | _ -> aux acc (x :: current) xs))
  in aux [] [] routine

let isLastBlk (blk : program) : bool = 
  match List.rev blk with
  | { payload = Label "end"; _ } :: _ -> true
  | _ -> false

let build_trace (label_gen : unit -> string) (routine : program) : program =
 (*print_prog Format.std_formatter routine;
  print_endline "\n";
  print_endline "Routine before reordering:@\n";
  (List.iter (fun b -> (print_prog Format.std_formatter b;
              print_endline "\n";)) (split_blocks label_gen routine));*)
  let blocks = split_blocks label_gen routine in
  let rec aux acc = function
      | [] -> List.rev acc
      | xx :: [] -> List.rev (xx :: acc)
      | xx :: bs -> 
            (match List.rev xx with
            | [] -> failwith "Error build_trace aux xx"
            | x :: xs -> 
                (match x.payload with
                | Label "end" -> aux (xx :: acc) bs
                | Jump (n, _) -> (match n.payload with 
                                  | Name lab -> let (find, rest) = List.partition (fun b -> match b with
                                                                    | ({ payload = Label l; _ } :: _) when l = lab -> 
                                                                      if isLastBlk b then false else true
                                                                    | _ -> false) bs
                                                in  (match find with
                                                    | b :: _ -> aux (xx :: acc) (b :: rest)
                                                    | [] -> aux (xx :: acc) bs)
                                  | _ -> failwith "Error build_trace aux jump")
                | Cjump (relop, e1, e2, l1, l2) ->
                      let (findF, rest) = List.partition (fun b -> match b with
                                          | ({ payload = Label l; _ } :: _) when l = l2 -> if isLastBlk b then false else true
                                          | _ -> false) bs
                      in  (match findF with
                          | b :: _ -> aux (xx :: acc) (b :: rest)
                          | [] -> let (findT, rest) = List.partition (fun b -> match b with
                                                      | ({ payload = Label l; _ } :: _) when l = l1 -> 
                                                        if isLastBlk b then false else true
                                                      | _ -> false) bs
                                  in  (match findT with
                                      | b :: _ -> let cjump = { x with payload = (Cjump (relop, e1, e2, l2, l1)) } 
                                                  in aux (List.rev (cjump :: xs) :: acc) (b :: rest)
                                      | [] -> let lab = label_gen () in
                                              let label = loc (Label lab) in 
                                              let jump = loc (Jump (loc (Name l2), [])) in
                                              let cjump = { x with payload = (Cjump (relop, e1, e2, l1, lab)) } in
                                              aux (List.rev (cjump :: xs) :: acc) ((label :: [jump]) :: bs)))
                | _ -> failwith "Error build_trace aux"))
  in List.concat (aux [] blocks)

let reordering label_gen p = p (*
  print_prog Format.std_formatter p;
  print_endline "\n";
  let (literals, routines) = split_literals_routines p in
  (List.iter (fun b -> (print_prog Format.std_formatter b;
              print_endline "\n";)) (routines));
  let (literals, routines) = split_literals_routines p in
  literals @ List.concat (List.map (build_trace label_gen) routines)*)
