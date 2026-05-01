.section .rodata
L_float_0:
	.float 1.25
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

# -------- Function L1 --------
L1:
addi sp, sp, -32
sd s1, 0(sp)
fsd fs0, 8(sp)
fsd fs1, 16(sp)
sd ra, 24(sp)
fmv.s fs1, fa0
li s1, 2
mv s1, s1
mv a0, s1
jal ra, float_of_int
fmv.s fs0, fa0
fmv.s fs0, fs0
fmul.s fs0, fs0, fs1
fmv.s fa0, fs0
ld s1, 0(sp)
fld fs0, 8(sp)
fld fs1, 16(sp)
ld ra, 24(sp)
addi sp, sp, 32
ret
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -32
sd s1, 0(sp)
fsd fs0, 8(sp)
sd ra, 16(sp)
la s1, L_float_0
flw fs0, 0(s1)
fmv.s fs0, fs0
fmv.s fa0, fs0
jal ra, L1
fmv.s fs0, fa0
fmv.s fs0, fs0
fmv.s fa0, fs0
jal ra, string_of_float
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
ld s1, 0(sp)
fld fs0, 8(sp)
ld ra, 16(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
