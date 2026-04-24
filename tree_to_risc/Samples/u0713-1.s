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
li s2, 0
li s1, 0
bne s2, s1, L1
L6:
j L2
L1:
li s2, 0
li s1, 0
bne s2, s1, L4
L7:
j L5
L4:
li s1, 0
mv s1, s1
j L3
L5:
li s1, 1
mv s1, s1
j L3
L2:
li s1, 0
mv s1, s1
L3:
end:
# -------- End of function main --------
