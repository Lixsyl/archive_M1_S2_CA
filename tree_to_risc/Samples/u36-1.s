.section .rodata
L_float_0:
	.double 0.1415926535
L_float_1:
	.double 3.1415926535
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
addi sp, sp, -16
sd ra, 8(sp)
la s1, L_float_1
flw fs0, 0(s1)
la s1, L_float_0
flw fs1, 0(s1)
fsub.d fs0, fs0, fs1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
