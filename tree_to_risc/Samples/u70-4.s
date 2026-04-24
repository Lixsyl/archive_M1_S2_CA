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
li s2, 1
li s1, 1
beq s2, s1, L7
L8:
li s1, 0
mv s2, s1
j L9
L9:
li s1, 0
bne s2, s1, L4
L5:
li s1, 0
mv s1, s1
j L6
L6:
li s2, 0
bne s1, s2, L1
L2:
li s1, 4
mv s1, s1
j L3
L7:
li s1, 1
mv s2, s1
j L9
L4:
li s1, 1
mv s1, s1
j L6
L1:
li s1, 3
mv s1, s1
j L3
L3:
end:
# -------- End of function main --------
