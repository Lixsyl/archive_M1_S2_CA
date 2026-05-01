.section .rodata
L_float_0:
	.float 6.3
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
addi sp, sp, -48
sd s1, 0(sp)
sd s2, 8(sp)
fsd fs0, 16(sp)
fsd fs1, 24(sp)
sd ra, 32(sp)
li s1, 22
mv s2, s1
la s1, L_float_0
flw fs0, 0(s1)
fmv.s fs1, fs0
mv a0, s2
jal ra, float_of_int
fmv.s fs0, fa0
fmv.s fs0, fs0
fadd.s fs0, fs1, fs0
ld s1, 0(sp)
ld s2, 8(sp)
fld fs0, 16(sp)
fld fs1, 24(sp)
ld ra, 32(sp)
addi sp, sp, 48
ret
# -------- End of function main --------
