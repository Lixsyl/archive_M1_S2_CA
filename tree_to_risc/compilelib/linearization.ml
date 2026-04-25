open Treelib
open Tree
open Tree_helper

exception LinearizationException of string


(* Rewrites the program by putting calls into explicit call by value *)
let normalize_call (temp_gen : typ -> string) (p : program) : program =
  let rec callexpr_temp typ expr = 
      let temp = loc (Temp (temp_gen typ)) in
      let expr_norm = expr_call expr in
      (temp, (loc (Move (temp, expr_norm))))
  and expr_call2 e = 
      match e with 
      | Call (expr, args, typ) -> 
          let (assigns, tmps) = List.fold_right 
                                (fun (typ2, e2) (assigns, tmps)-> 
                                    (match e2.payload with 
                                    | Temp t -> (assigns, (typ2, e2)::tmps)
                                    | _ ->  let (temp, move) = callexpr_temp typ2 e2
                                            in (move::assigns, (typ2, temp)::tmps)))
                                args ([], [])
                                in let s = loc (Seq (assigns))
                                in let c = loc (Call (expr, tmps, typ))
                                in Eseq (s, c)
      | Binop (op, e1, e2) -> 
          (match e1.payload, e2.payload with
          | Call (_, _, t1), Call (_, _, t2) -> let (temp1, move1) = callexpr_temp t1 e1 in
                                                let (temp2, move2) = callexpr_temp t2 e2 in
                                                let s = loc (Seq [move1; move2]) in
                                                expr_call2 (Eseq (stmt_call s, loc (Binop (op, temp1, temp2))))
          | Call (_, _, t1), _ -> let (temp1, move1) = callexpr_temp t1 e1 
                                  in expr_call2 (Eseq (move1, loc (Binop (op, temp1, expr_call e2))))
          | _, Call (_, _, t2) -> let (temp2, move2) = callexpr_temp t2 e2 
                                  in expr_call2 (Eseq (move2, loc (Binop (op, expr_call e1, temp2))))
          | _, _ -> Binop (op, expr_call e1, expr_call e2))
      | Mem (expr) -> Mem (expr_call expr)
      | Eseq (stmt, expr) -> Eseq (stmt_call stmt, expr_call expr)
      | _ -> e
  and expr_call { payload; loc } = { payload = expr_call2 payload; loc }
  and stmt_call2 s = 
      match s with 
      | Move (e1, e2) -> Move (expr_call e1, expr_call e2)
      | Sxp (expr) -> Sxp (expr_call expr)
      | Jump (expr, labels) -> Jump (expr_call expr, labels)
      | Cjump (relop, e1, e2, l1, l2) -> 
          (match e1.payload, e2.payload with
          | Call (_, _, t1), Call (_, _, t2) -> let (temp1, move1) = callexpr_temp t1 e1 in
                                                let (temp2, move2) = callexpr_temp t2 e2 in
                                                stmt_call2 (Seq ([move1; move2; loc (Cjump (relop, temp1, temp2, l1, l2))]))
          | Call (_, _, t1), _ -> let (temp1, move1) = callexpr_temp t1 e1 
                                  in stmt_call2 (Seq [move1; loc (Cjump (relop, temp1, expr_call e2, l1, l2))])
          | _, Call (_, _, t2) -> let (temp2, move2) = callexpr_temp t2 e2 
                                  in stmt_call2 (Seq ([move2; loc (Cjump (relop, expr_call e1, temp2, l1, l2))]))
          | _, _ -> Cjump (relop, expr_call e1, expr_call e2, l1, l2))
      | Seq (stmts) -> Seq (List.map stmt_call stmts)
      | _ -> s
  and stmt_call { payload; loc } = { payload = stmt_call2 payload; loc }
  in List.map stmt_call p 

(* Rewrites the program by linearizing it. At the end, no seq or eseq must remain *)
let linearize (temp_gen : typ -> string) (p : program) : program =
  let rec expr_lin2 e = 
      match e with 
      | Binop (op, e1, e2) -> 
          (match e1.payload, e2.payload with
          | Eseq (s1, e3), Eseq (s2, e4) ->
              expr_lin2 (Eseq (stmt_lin s1, loc (Eseq (stmt_lin s2, loc (Binop (op, expr_lin e3, expr_lin e4))))))
          | Eseq (s, e3), _ -> expr_lin2 (Eseq (stmt_lin s, loc (Binop (op, expr_lin e3, expr_lin e2))))
          | _, Eseq (s, e4) -> expr_lin2 (Eseq (stmt_lin s, loc (Binop (op, expr_lin e1, expr_lin e4))))
          | _ -> Binop (op, expr_lin e1, expr_lin e2))
      | Mem (expr) -> Mem (expr_lin expr)
      | Call (expr, args, typ) -> Call (expr_lin expr, args, typ)
      | Eseq (stmt, expr) -> Eseq (stmt_lin stmt, expr_lin expr)
      | _ -> e
  and expr_lin { payload; loc } = { payload = expr_lin2 payload; loc }
  and stmt_lin2 s = 
      match s with 
      | Move (e1, e2) ->  (match e2.payload with 
                          | Eseq (stmt, e) -> stmt_lin2 (Seq ([stmt_lin stmt; loc (Move (expr_lin e1, expr_lin e))]))
                          | _ -> Move (expr_lin e1, expr_lin e2)) 
      | Sxp (expr) -> (match expr.payload with 
                      | Eseq (stmt, e) -> stmt_lin2 (Seq ([stmt_lin stmt; loc (Sxp (expr_lin e))]))
                      | _ -> Sxp (expr_lin expr))
      | Jump (expr, labels) -> Jump (expr_lin expr, labels)
      | Cjump (relop, e1, e2, l1, l2) -> 
          (match e1.payload with 
              | Eseq (stmt, e12) -> 
                  (match e2.payload with 
                      | Eseq (stmt2, e22) -> stmt_lin2 (Seq ([stmt_lin stmt; stmt_lin stmt2; loc (Cjump (relop, expr_lin e12, expr_lin e22, l1, l2))]))
                      | _ -> stmt_lin2 (Seq ([stmt_lin stmt; loc (Cjump (relop, expr_lin e12, expr_lin e2, l1, l2))])))
              | _ -> Cjump (relop, expr_lin e1, expr_lin e2, l1, l2))
      | Seq (stmts) ->  let f = (fun s -> let stmt = stmt_lin s in 
                                match stmt.payload with 
                                | Seq (stmts2) -> List.map stmt_lin stmts2 
                                | _ -> [stmt]) 
                        in Seq (List.concat_map f stmts) 
      | _ -> s
  and stmt_lin { payload; loc } = { payload = stmt_lin2 payload; loc } in 
  let lin = List.map stmt_lin p in
  List.concat_map (fun s -> match s.payload with 
                      | Seq (stmts) -> stmts
                      | _ -> [s]) lin

(* CJUMP normalization: ensures that every CJUMP is immediately followed by its
   false label. *)
let rec normalize_cjump (label_gen : unit -> string) (p : program) : program = 
  let rec aux lst =
      match lst with
      | x :: (y :: _ as rest) -> 
          (match x.payload with
          | Cjump (relop, e1, e2, l1, l2) ->  if l2 = (match y.payload with Label l -> l | _ -> "") 
                                              then x :: aux rest
                                              else 
                                                let lab = label_gen () in
                                                let label = loc (Label lab) in 
                                                let jump = loc (Jump (loc (Name l2), [])) in
                                                let cjump = { x with payload = (Cjump (relop, e1, e2, l1, lab)) }
                                                in cjump :: label :: jump :: aux rest
          | Seq (stmts) -> let s = aux stmts in loc (Seq (s)) :: aux rest
          | _ -> x :: aux rest)
      | [x] -> [x]
      | [] -> []
  in aux p


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
  let reordered = Blocks.reordering label_gen linearized in
  let normalized_cjump = normalize_cjump label_gen reordered in
  let oc = open_out filename in
  let fmt = Format.formatter_of_out_channel oc in
  Format.fprintf fmt "%a%!" print_prog normalized_cjump;
  normalized_cjump
