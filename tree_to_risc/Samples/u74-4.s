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
mv s1, a0
jal ra, L4
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, L2
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, L4
mv s1, a0
mv a0, s1
end:
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
mv s2, a0
li s1, 74
blt s2, s1, L8
L9:
li s1, 0
mv s1, s1
j L10
L8:
li s1, 1
mv s1, s1
j L10
L10:
li s3, 0
bne s1, s3, L5
L6:
mv s1, s2
j L7
L5:
li s1, 2
mul s1, s1, s2
mv s1, s1
j L7
L7:
mv a0, s1
end:
# -------- End of function L2 --------

# -------- Function L3 --------
L3:
mv s1, a0
mv s1, a0
jal ra, L2
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, L2
mv s1, a0
mv a0, s1
end:
# -------- End of function L3 --------

# -------- Function L4 --------
L4:
mv s1, a0
mv s1, a0
jal ra, L2
mv s1, a0
mv s1, s1
mv s1, a0
mv s1, a1
jal ra, L3
mv s1, a0
mv s1, s1
mv s1, a0
mv s1, a1
jal ra, L3
mv s1, a0
mv a0, s1
end:
# -------- End of function L4 --------

# -------- Function main --------
ILPmain:
li s1, 74
mv s1, s1
mv s1, a0
jal ra, L1
mv s1, a0
end:
# -------- End of function main --------
