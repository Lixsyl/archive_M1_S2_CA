open Treelib
open Tree
open Tree_helper

exception LinearizationException of string


(* Rewrites the program by putting calls into explicit call by value *)
let normalize_call (temp_gen : typ -> string) (p : program) : program =
  let rec expr_call2 e = 
    match e with 
    | Call (expr, args, typ) -> let (assigns, tmps) = 
                                    List.fold_right 
                                    (fun (typ2, e2) (assigns, tmps)-> let tmp = loc (Temp (temp_gen typ2)) in (loc (Move (tmp, e2))::assigns, (typ2, tmp)::tmps)) 
                                    args ([], [])
                                in let s = loc (Seq (assigns))
                                in let c = loc (Call (expr, tmps, typ))
                                in Eseq (s, c)
    | Binop (op, e1, e2) -> Binop (op, expr_call e1, expr_call e2) 
    | Mem (expr) -> Mem (expr_call expr)
    | Eseq (stmt, expr) -> Eseq (stmt_call stmt, expr_call expr)
    | _ -> e
  and expr_call { payload; loc } = { payload = expr_call2 payload; loc }
  and stmt_call2 s = 
    match s with 
    | Move (e1, e2) -> Move (expr_call e1, expr_call e2)
    | Sxp (expr) -> Sxp (expr_call expr)
    | Jump (expr, labels) -> Jump (expr_call expr, labels)
    | Cjump (relop, e1, e2, l1, l2) -> Cjump (relop, expr_call e1, expr_call e2, l1, l2)
    | Seq (stmts) -> Seq (List.map stmt_call stmts)
    | _ -> s
  and stmt_call { payload; loc } = { payload = stmt_call2 payload; loc }
  in List.map stmt_call p 

(* Rewrites the program by linearizing it. At the end, no seq or eseq must remain *)
let linearize (temp_gen : typ -> string) (p : program) : program =
  let rec expr_lin2 e = 
    match e with 
    | Binop (op, e1, e2) -> Binop (op, expr_lin e1, expr_lin e2) 
    | Mem (expr) -> Mem (expr_lin expr)
    | Call (expr, args, typ) -> Call (expr_lin expr, args, typ)
    | Eseq (stmt, expr) -> Eseq (stmt_lin stmt, expr_lin expr)
    | _ -> e
  and expr_lin { payload; loc } = { payload = expr_lin2 payload; loc }
  and stmt_lin2 s = 
    match s with 
    | Move (e1, e2) -> Move (expr_lin e1, expr_lin e2)
    | Sxp (expr) -> Sxp (expr_lin expr)
    | Jump (expr, labels) -> Jump (expr_lin expr, labels)
    | Cjump (relop, e1, e2, l1, l2) -> Cjump (relop, expr_lin e1, expr_lin e2, l1, l2)
    | Seq (stmts) -> Seq (List.concat_map (fun s -> let stmt = s.payload in match stmt with | Seq (stmts2) -> List.map stmt_lin stmts2 | _ -> [loc (stmt_lin2 stmt)]) stmts)
    | _ -> s
  and stmt_lin { payload; loc } = { payload = stmt_lin2 payload; loc }
  in List.map stmt_lin p 

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
