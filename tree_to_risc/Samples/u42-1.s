.section .rodata
L_float_0:
	.double 2.5
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
li s1, 1
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
sd t3, 16(sp)
sd t4, 24(sp)
jal ra, float_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t3, 16(sp)
ld t4, 24(sp)
addi sp, sp, 32
fmv.d fs0, fa0
fmv.d fs1, fs0
la s1, L_float_0
fld fs0, 0(s1)
fsub.d fs0, fs0, fs1
fmv.d fs0, fs0
fmv.d fa0, fs0
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
sd t3, 16(sp)
sd t4, 24(sp)
jal ra, string_of_float
ld t0, 0(sp)
ld t1, 8(sp)
ld t3, 16(sp)
ld t4, 24(sp)
addi sp, sp, 32
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
sd t3, 16(sp)
sd t4, 24(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t3, 16(sp)
ld t4, 24(sp)
addi sp, sp, 32
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
