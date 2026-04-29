.section .rodata
L_str_0:
	.string "GEORGE "
L_str_1:
	.string "BOOL"
L_str_2:
	.string "E"
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
la s1, L_str_0
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
addi sp, sp, 64
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
mv s1, a0
li s1, 0
la s1, L_str_1
mv s2, s1
la s1, L_str_2
mv s1, s1
mv a0, s2
mv a1, s1
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, concat
addi sp, sp, 64
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
mv s1, a0
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
addi sp, sp, 64
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
ld t6, 48(sp)
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
