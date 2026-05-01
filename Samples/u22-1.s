.section .rodata
L_float_0:
	.float 1.
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
addi sp, sp, -32
sd s1, 0(sp)
sd s2, 8(sp)
fsd fs0, 16(sp)
sd ra, 24(sp)
li s1, 22
li s1, 1
li s2, 0
bne s1, s2, L1
L2:
la s1, L_float_0
flw fs0, 0(s1)
fmv.s fs0, fs0
j L3
L1:
li s1, 1
mv s1, s1
mv a0, s1
jal ra, float_of_int
fmv.s fs0, fa0
fmv.s fs0, fs0
j L3
L3:
ld s1, 0(sp)
ld s2, 8(sp)
fld fs0, 16(sp)
ld ra, 24(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
