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
li s1, 50
mv s2, s1
j L1
L1:
li s1, 52
blt s2, s1, L4
L5:
li s1, 0
mv s1, s1
j L6
L6:
li s2, 0
beq s1, s2, L3
L2:
li s1, 1
add s1, s2, s1
mv s2, s1
j L1
L4:
li s1, 1
mv s1, s1
j L6
L3:
li s1, 0
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
