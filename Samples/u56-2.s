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
beq s2, s1, L6
L7:
li s1, 0
mv s1, s1
j L8
L8:
li s2, 0
bne s1, s2, L3
L4:
li s1, 1
beq s2, s1, L12
L13:
li s1, 0
mv s2, s1
j L14
L14:
li s1, 0
bne s2, s1, L9
L10:
li s1, 1
sub s1, s2, s1
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
jal ra, L2
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
addi sp, sp, 48
mv s1, a0
li s1, 1
mv s1, s1
j L11
L11:
mv s1, s1
j L5
L6:
li s1, 1
mv s1, s1
j L8
L3:
li s1, 1
mv s1, s1
j L5
L12:
li s1, 1
mv s2, s1
j L14
L9:
li s1, 0
mv s1, s1
j L11
L5:
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
addi sp, sp, -16
sd ra, 8(sp)
mv s2, a0
li s1, 0
beq s2, s1, L18
L19:
li s1, 0
mv s2, s1
j L20
L20:
li s1, 0
bne s2, s1, L15
L16:
li s1, 1
beq s2, s1, L24
L25:
li s1, 0
mv s1, s1
j L26
L26:
li s2, 0
bne s1, s2, L21
L22:
li s1, 1
sub s1, s2, s1
mv s1, s1
mv a0, s1
addi sp, sp, -16
sd t5, 0(sp)
sd t6, 8(sp)
jal ra, L1
ld t5, 0(sp)
ld t6, 8(sp)
addi sp, sp, 16
mv s1, a0
mv s1, s1
j L23
L23:
mv s1, s1
j L17
L18:
li s1, 1
mv s2, s1
j L20
L15:
li s1, 0
mv s1, s1
j L17
L24:
li s1, 1
mv s1, s1
j L26
L21:
li s1, 1
mv s1, s1
j L23
L17:
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L2 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd ra, 8(sp)
li s1, 56
mv s1, s1
mv a0, s1
addi sp, sp, -0
jal ra, L2
addi sp, sp, 0
mv s1, a0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
