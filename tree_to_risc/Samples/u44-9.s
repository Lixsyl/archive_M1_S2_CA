.section .rodata
L_str_0:
	.string "true"
L_str_1:
	.string "false"
.section .rodata
L_float_0:
	.double 0.
L_float_1:
	.double 1.
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
li s2, 0
blt s2, s1, L4
L5:
li s1, 0
mv s1, s1
j L6
L6:
li s2, 0
bne s1, s2, L1
L2:
la s1, L_str_1
mv s1, s1
j L3
L3:
mv s1, s1
mv a0, s1
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
addi sp, sp, 64
mv s1, a0
li s1, 0
li s1, 1
mv s1, s1
mv a0, s1
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, float_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
addi sp, sp, 64
fmv.d fs0, fa0
fmv.d fs1, fs0
la s1, L_float_0
fld fs0, 0(s1)
flt.s s1, fs1, fs0
beq s1, x0, L10
L11:
li s1, 0
mv s2, s1
j L12
L12:
li s1, 0
bne s2, s1, L7
L8:
la s1, L_str_1
mv s1, s1
j L9
L9:
mv s1, s1
mv a0, s1
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
addi sp, sp, 64
mv s1, a0
li s1, 0
li s1, 0
mv s1, s1
mv a0, s1
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, float_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
addi sp, sp, 64
fmv.d fs0, fa0
fmv.d fs1, fs0
la s1, L_float_1
fld fs0, 0(s1)
flt.s s1, fs0, fs1
beq s1, x0, L16
L17:
li s1, 0
mv s2, s1
j L18
L18:
li s1, 0
bne s2, s1, L13
L14:
la s1, L_str_1
mv s1, s1
j L15
L4:
li s1, 1
mv s1, s1
j L6
L1:
la s1, L_str_0
mv s1, s1
j L3
L10:
li s1, 1
mv s2, s1
j L12
L7:
la s1, L_str_0
mv s1, s1
j L9
L16:
li s1, 1
mv s2, s1
j L18
L13:
la s1, L_str_0
mv s1, s1
j L15
L15:
mv s1, s1
mv a0, s1
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
addi sp, sp, 64
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
