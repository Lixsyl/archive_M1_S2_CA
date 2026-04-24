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
mv s1, s2
mv s1, a0
jal ra, L1
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
end:
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
li s1, 5
mv s1, s1
mv s1, a0
jal ra, L1
mv s1, a0
end:
# -------- End of function main --------
