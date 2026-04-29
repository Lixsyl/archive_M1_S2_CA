.section .rodata
L_str_0:
	.string "FLOAT"
.section .rodata
L_float_0:
	.double 5.0
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
la s1, L_float_0
flw fs0, 0(s1)
la s1, L_str_0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
