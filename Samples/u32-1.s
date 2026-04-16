.section .rodata
L_float_0:
	.double 2.2
L_float_1:
	.double 6.3
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
la s1, L_float_0
flw fs0, 0(t0)
fmv.d fs0, fs0
la s1, L_float_1
flw fs0, 0(t4)
fmv.d fs0, fs0
fadd.d fs0, s2, s1
end:
# -------- End of function main --------
