open Treelib
open! Utils


(* -------------------------------------------------------------------------- *)
(* Final assembly rewriting stage responsible for inserting calling
   convention machinery around the already register-allocated code.

   It performs two main tasks:
   1) Prologue / Epilogue generation
      - Determines which callee-saved registers are actually used
        (based on the coloring maps).
      - Computes the required stack frame size (ABI-aligned).
      - Generates:
          * Prologue: adjust stack pointer, save ra, save used callee-saved
            integer and floating-point registers.
          * Epilogue: restore saved registers, restore ra, reset stack
            pointer, and return.
   2) Call rewriting
      - For each function call instruction, inserts code to save and
        restore caller-saved registers around the call.

   Inputs:
     - colors / fcolors : register allocation maps (int and float).
     - callee_saved     : list of callee-saved registers.
     - caller_saved     : list of caller-saved registers.
     - instrs           : body instructions (after register allocation).

   Output:
     - The rewritten instruction list (with caller-save handling),
     - The function prologue,
     - The function epilogue.
*)

let pro_epi (callee_int : string list) (callee_float : string list) : Asm.t * Asm.t =
  let size = ((8 * (1 + List.length callee_int + List.length callee_float) + 15) / 16) * 16 in
  let prologue =
    let stack_alloc = 
        Asm.Oper
        {
          assem = "addi sp, sp, -" ^ string_of_int size;
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        } in 
    let reg_alloc =
        List.mapi (fun i reg ->
          let offset = i * 8 in
          Asm.Oper
          {
            assem = "sd " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
            dst = [];
            src = [];
            jump = None;
            is_call = false;
          }
        ) callee_int in
    let reg_alloc2 =
        List.mapi (fun i reg ->
          let offset = i * 8 in
          Asm.Oper
          {
            assem = "fsd " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
            dst = [];
            src = [];
            jump = None;
            is_call = false;
          }
        ) callee_float in
    let ra_alloc = 
        Asm.Oper
        {
          assem = "sd ra, " ^ string_of_int (size - 8) ^ "(sp)";
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        } in
    (stack_alloc :: reg_alloc @ reg_alloc2 @ [ra_alloc]) in
  let epilogue =
    let reg_dealloc =
        List.mapi (fun i reg ->
          let offset = i * 8 in
          Asm.Oper
          {
            assem = "ld " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
            dst = [];
            src = [];
            jump = None;
            is_call = false;
          }
        ) callee_int in
    let reg_dealloc2 =
        List.mapi (fun i reg ->
          let offset = i * 8 in
          Asm.Oper
          {
            assem = "fld " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
            dst = [];
            src = [];
            jump = None;
            is_call = false;
          }
        ) callee_float in
    let ra_stack_dealloc_ret = [
        Asm.Oper
        {
          assem = "ld ra, " ^ string_of_int (size - 8) ^ "(sp)";
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        };
        Asm.Oper
        {
          assem = "addi sp, sp, " ^ string_of_int size;
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        };
        Asm.Oper
        {
          assem = "ret";
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        }] in
    (reg_dealloc @ reg_dealloc2 @ ra_stack_dealloc_ret)
  in (prologue, epilogue)

let pre_post (caller_int : string list) (caller_float : string list) : Asm.t * Asm.t =
  let size = ((8 * (List.length caller_int + List.length caller_float) + 15) / 16) * 16 in
  let pre = 
    let stack_alloc = 
        Asm.Oper
        {
          assem = "addi sp, sp, -" ^ string_of_int size;
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        } in
    let reg_alloc =
        List.mapi (fun i reg ->
            let offset = i * 8 in
            Asm.Oper
            {
              assem = "sd " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
              dst = [];
              src = [];
              jump = None;
              is_call = false;
            }
          ) caller_int in
    let reg_alloc2 =
        List.mapi (fun i reg ->
          let offset = i * 8 in
          Asm.Oper
          {
            assem = "fsd " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
            dst = [];
            src = [];
            jump = None;
            is_call = false;
          }
        ) caller_float in
    stack_alloc :: reg_alloc @ reg_alloc2 in
  let post =  
    let stack_dealloc = 
        Asm.Oper
        {
          assem = "addi sp, sp, " ^ string_of_int size;
          dst = [ ];
          src = [ ];
          jump = None;
          is_call = false;
        } in
    let reg_dealloc =
        List.mapi (fun i reg ->
                let offset = i * 8 in
                Asm.Oper
                {
                  assem = "ld " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
                  dst = [];
                  src = [];
                  jump = None;
                  is_call = false;
                }
              ) caller_int in
    let reg_dealloc2 =
        List.mapi (fun i reg ->
          let offset = i * 8 in
          Asm.Oper
          {
            assem = "fld " ^ reg ^ ", " ^ string_of_int offset ^ "(sp)";
            dst = [];
            src = [];
            jump = None;
            is_call = false;
          }
        ) caller_float in
    reg_dealloc @ reg_dealloc2 @ [stack_dealloc]
  in (pre, post)

let generate (colors : string SMap.t) (fcolors : string SMap.t)
    (callee_saved : string list) (caller_saved : string list) (instrs : Asm.t) =
  let callee_int = List.filter (fun r -> SMap.mem r colors) callee_saved in
  let callee_float = List.filter (fun r -> SMap.mem r fcolors) callee_saved in
  let (prologue, epilogue) = pro_epi callee_int callee_float in
  let caller_int = List.filter (fun r -> SMap.mem r colors) caller_saved in
  let caller_float = List.filter (fun r -> SMap.mem r fcolors) caller_saved in
  let rec aux ins = 
      (match ins with
      | [] -> []
      | x :: xs -> (match x with
                    | Asm.Oper { is_call = true; _ } -> 
                        let (pre, post) = pre_post caller_int caller_float in pre @ [x] @ post @ aux xs
                    | _ -> x :: aux xs)) in
  (aux instrs, prologue, epilogue)