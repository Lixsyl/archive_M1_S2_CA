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
mv s2, a0
li s1, 0
beq s2, s1, L5
L6:
li s1, 0
mv s1, s1
j L7
L7:
li s2, 0
bne s1, s2, L2
L3:
li s1, 1
sub s1, s2, s1
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
jal ra, L1
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
addi sp, sp, 32
mv s1, a0
mv s1, s1
mul s1, s2, s1
mv s1, s1
j L4
L5:
li s1, 1
mv s1, s1
j L7
L2:
li s1, 1
mv s1, s1
j L4
L4:
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd ra, 8(sp)
li s1, 5
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t4, 0(sp)
sd t5, 8(sp)
sd t6, 16(sp)
jal ra, L1
ld t4, 0(sp)
ld t5, 8(sp)
ld t6, 16(sp)
addi sp, sp, 32
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t4, 0(sp)
sd t5, 8(sp)
sd t6, 16(sp)
jal ra, string_of_int
ld t4, 0(sp)
ld t5, 8(sp)
ld t6, 16(sp)
addi sp, sp, 32
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t4, 0(sp)
sd t5, 8(sp)
sd t6, 16(sp)
jal ra, print
ld t4, 0(sp)
ld t5, 8(sp)
ld t6, 16(sp)
addi sp, sp, 32
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
