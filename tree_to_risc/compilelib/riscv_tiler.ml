open Treelib
open Tree
open Tree_helper
open! Asm
open! Backend

(* integer registers *)
let registers = [ "s1"; "s2"; "s3"; "s4"; "s5"; "s6" ]

(* floating-point registers *)
let f_registers = [ "fs0"; "fs1"; "fs2"; "fs3"; "fs4"; "fs5"; "fs6" ]

let callee_saved =
  [
    (* integer *)
    "s0";
    "s1";
    "s2";
    "s3";
    "s4";
    "s5";
    "s6";
    "s7";
    "s8";
    "s9";
    "s10";
    "s11";
    (* floating-point *)
    "fs0";
    "fs1";
    "fs2";
    "fs3";
    "fs4";
    "fs5";
    "fs6";
    "fs7";
    "fs8";
    "fs9";
    "fs10";
    "fs11";
  ]

let caller_saved =
  [
    (* return address *)
    "ra";
    (* integer temporaries *)
    "t0";
    "t1";
    "t2";
    "t3";
    "t4";
    "t5";
    "t6";
    (* floating-point temporaries *)
    "ft0";
    "ft1";
    "ft2";
    "ft3";
    "ft4";
    "ft5";
    "ft6";
    "ft7";
    "ft8";
    "ft9";
    "ft10";
    "ft11";
  ]

let precolored = [ ("rv", "a0") ]
let f_precolored = [ ("fv", "fa0") ]

let asm_of_binop = function
  (* integer *)
  | Add -> "add"
  | Sub -> "sub"
  | Mul -> "mul"
  | Div -> "div"
  | And -> "and"
  | Or -> "or"
  | Xor -> "xor"
  | Mod -> "rem"
  (* floating-point *)
  | AddF -> "fadd.d"
  | SubF -> "fsub.d"
  | MulF -> "fmul.d"
  | DivF -> "fdiv.d"
  (* integer shifts *)
  | LShift -> "sll"
  | RShift -> "srl"
  | ARshift -> "sra"

let type_binop = function
  (* integer *)
  | Add -> Int
  | Sub -> Int
  | Mul -> Int
  | Div -> Int
  | And -> Int
  | Or -> Int
  | Xor -> Int
  | Mod -> Int
  (* floating-point *)
  | AddF -> Float
  | SubF -> Float
  | MulF -> Float
  | DivF -> Float
  (* integer shifts *)
  | LShift -> Int
  | RShift -> Int
  | ARshift -> Int


(* Lowers a single IR statement (Tree.stmt) into one or more RISC-V assembly
   instructions (Asm.instr).
   The rewriter 'r' is used to generate fresh temporaries when needed
   expr_to_temp: ensures that an IR expression is evaluated and its value is stored
   in a temporary register.

   - If the expression is already a Temp, it simply returns that temp.
   - Otherwise, it generates the necessary instructions to compute the
     expression into a fresh temporary and returns that temp.

   This guarantees that instruction selection always works with
   register operands (temps), not complex IR expressions.
 *)

(* Add parameter move insertion at function entry *)
let param_moves params =
  List.mapi
    (fun i temp ->
      let reg =
        if Tree_helper.is_float_temp temp then "fa" ^ string_of_int i
        else "a" ^ string_of_int i
      in
      Asm.move_param ~dst:temp ~src:reg)
    params

let munch_stm (r : rewritter) (expr_to_temp : expr -> temp) (s : stmt) =
  match s.payload with
  | Tree.Move ({ payload = Temp t; _ }, src) ->
      let ts = expr_to_temp src in
      [ Asm.move_instr ~dst:t ~src:ts ]
  | Tree.Label l -> [ Asm.label l ]
  | Tree.Cjump (relop, e1, e2, label, _) ->
      let t1 = expr_to_temp e1 in
      let t2 = expr_to_temp e2 in
      let t = r.fresh_temp Int in
      [ Asm.cjump_instr ~relop:relop ~src1:t1 ~src2:t2 ~lab:label ~temp:t]
  | Tree.Jump ({ payload = Name l; _ }, _) ->
      [ Asm.jump_instr ~lab:l ]
  | _ -> failwith (Format.asprintf "munch_stm: %a not supported" print_stmt s)

(* Instruction-selection tile for integer constants.
   This tile matches IR expressions of the form:
       Const n

   When selected, it:
     1. Creates a fresh temporary register.
     2. Emits a single "load immediate" instruction that loads
        the constant value n into that temporary.
     3. Returns the generated instruction along with the temp
        holding the result. *)
let tile_const r =
  {
    cost = 1;
    matches_exp = (function { payload = Const _; _ } -> true | _ -> false);
    emit_exp =
      (fun _ e _ ->
        match e.payload with
        | Const n ->
            let t = r.fresh_temp Int in
            ([ Asm.load_immediate ~temp:t ~imm:n ], t)
        | _ -> assert false);
  }

let tile_constF r =
  {
    cost = 1;
    matches_exp = (function { payload = ConstF _; _ } -> true | _ -> false);
    emit_exp =
      (fun _ e lab_l ->
        match e.payload with
        | ConstF n ->
            let t_addr = r.fresh_temp Int in
            let t = r.fresh_temp Float in
            let lab = Utils.SMap.find n lab_l in
            ([ Asm.load_address ~temp:t_addr ~lab:lab ; Asm.load_float ~dst:t ~src:t_addr], t)
        | _ -> assert false);
  }

let tile_name r =
  {
    cost = 1;
    matches_exp = (function { payload = Name _; _ } -> true | _ -> false);
    emit_exp =
      (fun _ e _ ->
        match e.payload with
        | Name l -> 
          let t = r.fresh_temp Int in
          ([ Asm.load_address ~temp:t ~lab:l ], t)
        | _ -> assert false);
  }

let tile_temp r =
  {
    cost = 1;
    matches_exp = (function { payload = Temp _; _ } -> true | _ -> false);
    emit_exp =
      (fun _ e _ ->
        match e.payload with
        | Temp t -> let t = r.fresh_temp Int in ([], t)
        | _ -> assert false);
  }

let tile_binop r =
  {
    cost = 1;
    matches_exp = (function { payload = Binop (_,_,_); _ } -> true | _ -> false);
    emit_exp =
      (fun f e _ ->
        match e.payload with
        | Binop (op, e1, e2) -> 
            let ope = asm_of_binop op in
            let t1 = f e1 in
            let t2 = f e2 in
            let t = r.fresh_temp (type_binop op) in
            ([Asm.binary_instr ~op:ope ~dst:t ~src1:t1 ~src2:t2], t)
        | _ -> assert false);
  }

let tile_call r =
  {
    cost = 1;
    matches_exp = (function { payload = Call (_,_,_); _ } -> true | _ -> false);
    emit_exp =
      (fun f e _ ->
        match e.payload with
        | Call (expr, args, typ) -> 
            (match expr.payload with
            | Name l -> let t = r.fresh_temp typ in
                        let arg_temps = List.map (fun (t, e) -> f e) args in
                        let param_moves = param_moves arg_temps in
                        let call = Asm.call ~lab:l in
                        let return = Asm.return_value ~dst:t in
                        (param_moves @ [ call; return ], t)
            | _ -> assert false)
        | _ -> assert false);
  }

let tiles r =
  [
    tile_const r;
    tile_constF r;
    tile_name r;
    tile_temp r;
    tile_binop r;
    tile_call r;
  ]

let file_prologue =
  ".text\n.globl main\nmain:\n" ^ "  addi sp, sp, -16\n" ^ "  sd ra, 8(sp)\n"
  ^ "  # Call ILPmain\n" ^ "  jal ra, ILPmain\n" ^ "  li a0, 0\n"
  ^ "  ld ra, 8(sp)\n" ^ "  addi sp, sp, 16\n" ^ "  ret\n"

let file_epilogue = ""
