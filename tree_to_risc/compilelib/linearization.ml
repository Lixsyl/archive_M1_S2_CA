open Treelib
open Tree
open Tree_helper

exception LinearizationException of string


(* Rewrites the program by putting calls into explicit call by value *)
let normalize_call (temp_gen : typ -> string) (p : program) : program =
  raise (LinearizationException "normalize_call not implemented yet")

(* Rewrites the program by linearizing it. At the end, no seq or eseq must remain *)
let linearize (temp_gen : typ -> string) (p : program) : program =
  raise (LinearizationException "linearize not implemented yet")

(* CJUMP normalization: ensures that every CJUMP is immediately followed by its
   false label. *)
let rec normalize_cjump (label_gen : unit -> string) (p : program) : program =
  raise (LinearizationException "normalize_cjump not implemented yet")

(** This function performs the transformation to LIR and generate the .lir file.
    operation made are:
    - call by value transformation
    - flattening of the sequences and eseq lift until a fixpoint is reached
    - It calls basic block reordering
    - naive CJump normalization (label insertion if needed) *)
let linearize (p : program) (filename : string) : program =
  let temp_gen = fresh_temp p in
  let label_gen = fresh_label p in
  let normalized_calls = normalize_call temp_gen p in
  let linearized = linearize temp_gen normalized_calls in
  let reordered = Blocks.reordering linearized in
  let normalized_cjump = normalize_cjump label_gen reordered in
  let oc = open_out filename in
  let fmt = Format.formatter_of_out_channel oc in
  Format.fprintf fmt "%a%!" print_prog normalized_cjump;
  normalized_cjump
