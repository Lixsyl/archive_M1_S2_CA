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
li s1, 5
mv s2, s1
j L1
L1:
li s1, 53
blt s2, s1, L4
L5:
li s1, 0
mv s2, s1
j L6
L6:
li s1, 0
beq s2, s1, L3
L2:
mv a0, s2
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, string_of_int
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
li s1, 2
mul s1, s1, s2
mv s2, s1
j L7
L7:
li s1, 53
blt s1, s2, L10
L11:
li s1, 0
mv s3, s1
j L12
L12:
li s1, 0
bne s3, s1, L8
L9:
li s1, 0
j L1
L4:
li s1, 1
mv s2, s1
j L6
L10:
li s1, 1
mv s3, s1
j L12
L8:
mv a0, s2
addi sp, sp, -64
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
sd t6, 48(sp)
jal ra, string_of_int
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
li s1, 3
sub s1, s2, s1
mv s2, s1
j L7
L3:
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
