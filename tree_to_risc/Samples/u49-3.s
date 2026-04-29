.section .rodata
L_str_0:
	.string "*"
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
li s1, 2
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t4, 24(sp)
sd t5, 32(sp)
jal ra, float_of_int
addi sp, sp, 48
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t4, 24(sp)
ld t5, 32(sp)
fmv.d fs0, fa0
fmv.d fs1, fs0
la s1, L_float_0
fld fs0, 0(s1)
fdiv.d fs0, fs0, fs1
fmv.d fs0, fs0
fmv.d fa0, fs0
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t4, 24(sp)
sd t5, 32(sp)
jal ra, string_of_float
addi sp, sp, 48
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t4, 24(sp)
ld t5, 32(sp)
mv s1, a0
mv s2, s1
la s1, L_str_0
mv s1, s1
mv a0, s2
mv a1, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t4, 24(sp)
sd t5, 32(sp)
jal ra, concat
addi sp, sp, 48
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t4, 24(sp)
ld t5, 32(sp)
mv s1, a0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
