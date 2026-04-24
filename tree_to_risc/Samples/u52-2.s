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
li s1, 50
mv s3, s1
L1:
li s1, 52
blt s3, s1, L4
L7:
j L5
L4:
li s1, 1
mv s2, s1
j L6
L5:
li s1, 0
mv s2, s1
L6:
li s1, 0
bne s2, s1, L2
L8:
j L3
L2:
li s1, 1
add s1, s3, s1
mv s3, s1
j L1
L3:
li s1, 0
end:
# -------- End of function main --------
