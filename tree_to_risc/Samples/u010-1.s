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
li fs1, 0.
li fs0, 49.3
fsub.d fs0, fs1, fs0
end:
# -------- End of function main --------
