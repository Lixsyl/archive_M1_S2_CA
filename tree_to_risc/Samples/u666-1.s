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
mv s2, s1
j L7
L7:
li s1, 0
bne s2, s1, L2
L3:
li s1, 1
sub s1, s2, s1
mv s1, s1
mv s1, a0
jal ra, L1
mv s1, a0
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
mv s1, a0
jal ra, L1
mv s1, a0
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
