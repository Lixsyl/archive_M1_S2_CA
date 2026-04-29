.section .rodata
L_float_0:
	.double 1.25
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
addi sp, sp, -16
sd ra, 8(sp)
fmv.d fs1, fa0
li s1, 2
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
jal ra, float_of_int
addi sp, sp, 32
ld t0, 0(sp)
ld t1, 8(sp)
fmv.d fs0, fa0
fmv.d fs0, fs0
fmul.d fs0, fs0, fs1
fmv.d fa0, fs0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd ra, 8(sp)
la s1, L_float_0
fld fs0, 0(s1)
fmv.d fs0, fs0
fmv.d fa0, fs0
addi sp, sp, -32
sd t2, 0(sp)
sd t3, 8(sp)
jal ra, L1
addi sp, sp, 32
ld t2, 0(sp)
ld t3, 8(sp)
fmv.d fs0, fa0
fmv.d fs0, fs0
fmv.d fa0, fs0
addi sp, sp, -32
sd t2, 0(sp)
sd t3, 8(sp)
jal ra, string_of_float
addi sp, sp, 32
ld t2, 0(sp)
ld t3, 8(sp)
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t2, 0(sp)
sd t3, 8(sp)
jal ra, print
addi sp, sp, 32
ld t2, 0(sp)
ld t3, 8(sp)
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
