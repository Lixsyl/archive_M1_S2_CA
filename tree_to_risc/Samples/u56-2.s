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
mv s1, a0
li s2, 0
beq s1, s1, s2
bne s1, x0, L6
L7:
li s1, 0
mv s2, s1
j L8
L6:
li s1, 1
mv s2, s1
j L8
L8:
li s1, 0
bne s1, s2, s1
beq s1, x0, L3
L4:
li s2, 1
beq s1, s1, s2
bne s1, x0, L12
L13:
li s1, 0
mv s2, s1
j L14
L3:
li s1, 1
mv s1, s1
j L5
L12:
li s1, 1
mv s2, s1
j L14
L14:
li s1, 0
bne s1, s2, s1
beq s1, x0, L9
L10:
li s2, 1
sub s1, s1, s2
mv s1, s1
mv s1, a0
jal ra, L2
mv s1, a0
li s1, 1
mv s1, s1
j L11
L9:
li s1, 0
mv s1, s1
j L11
L11:
mv s1, s1
L5:
mv a0, s1
end:
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
mv s2, a0
li s1, 0
beq s1, s2, s1
bne s1, x0, L18
L19:
li s1, 0
mv s2, s1
j L20
L18:
li s1, 1
mv s2, s1
j L20
L20:
li s1, 0
bne s1, s2, s1
beq s1, x0, L15
L16:
li s1, 1
beq s1, s2, s1
bne s1, x0, L24
L25:
li s1, 0
mv s1, s1
j L26
L15:
li s1, 0
mv s1, s1
j L17
L24:
li s1, 1
mv s1, s1
j L26
L26:
li s2, 0
bne s1, s1, s2
beq s1, x0, L21
L22:
li s1, 1
sub s1, s2, s1
mv s1, s1
mv s1, a0
jal ra, L1
mv s1, a0
mv s1, s1
j L23
L21:
li s1, 1
mv s1, s1
j L23
L23:
mv s1, s1
L17:
mv a0, s1
end:
# -------- End of function L2 --------

# -------- Function main --------
ILPmain:
li s1, 56
mv s1, s1
mv s1, a0
jal ra, L2
mv s1, a0
mv s2, s1
li s1, 1
xor s1, s2, s1
end:
# -------- End of function main --------
