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

let generate (colors : string SMap.t) (fcolors : string SMap.t)
    (callee_saved : string list) (caller_saved : string list) (instrs : Asm.t) =
  (instrs, [], [])
