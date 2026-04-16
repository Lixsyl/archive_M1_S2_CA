.section .rodata
L_float_1:
	.double 0.
L_float_0:
	.double 49.3
.text
.globl main
main:
  addi sp, sp, -16
  sd ra, 8(sp)
  # Call ILPmain
  jal ra, ILPmain
  li a0, 0
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

# -------- Function main --------
ILPmain:
la fs0, L_float_1
flw fs0, 0(t0)
la fs1, L_float_0
flw fs1, 0(t2)
fsub.d fs0, fs0, fs1
end:
# -------- End of function main --------
