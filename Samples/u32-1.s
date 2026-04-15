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
li fs0, 2.2
fmv.d fs0, fs0
li fs0, 6.3
fmv.d fs0, fs0
fadd.d fs0, s2, s1
end:
# -------- End of function main --------
