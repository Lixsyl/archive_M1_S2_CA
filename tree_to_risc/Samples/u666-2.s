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
mv s1, a0
li s2, 0
beq s1, s2, L5
L6:
li s1, 0
mv s2, s1
j L7
L7:
li s1, 0
bne s2, s1, L2
L3:
li s2, 1
sub s2, s1, s2
mv s2, s2
mv a0, s2
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t5, 32(sp)
sd t6, 40(sp)
jal ra, L1
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t5, 32(sp)
ld t6, 40(sp)
mv s2, a0
mv s2, s2
mul s1, s1, s2
mv s1, s1
j L4
L5:
li s1, 1
mv s2, s1
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
sd t4, 0(sp)
jal ra, L1
ld t4, 0(sp)
mv s1, a0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
