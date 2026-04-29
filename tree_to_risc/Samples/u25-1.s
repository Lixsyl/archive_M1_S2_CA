.section .rodata
L_float_0:
	.double 0.
L_float_1:
	.double 1.5
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
li s2, 1
li s1, 0
bne s2, s1, L1
L2:
la s1, L_float_0
fld fs0, 0(s1)
fmv.d fs0, fs0
j L3
L1:
la s1, L_float_1
fld fs0, 0(s1)
fmv.d fs0, fs0
j L3
L3:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
