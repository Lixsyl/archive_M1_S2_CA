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
li s3, 0
li s1, 0
bne s3, s1, L1
L2:
li s1, 710
li s3, 1
li s1, 0
bne s3, s1, L4
L5:
li s1, 2
li s1, 1
mv s1, s1
j L6
L1:
li s1, 1
mv s1, s1
j L3
L4:
li s1, 1
mv s1, s1
j L6
L6:
mv s1, s2
L3:
end:
# -------- End of function main --------
