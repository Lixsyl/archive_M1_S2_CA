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
li s2, 2
div s1, s1, s2
mv a0, s1
end:
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
li s1, 2
li s2, 5490
mul s1, s1, s2
mv s1, s1
mv s1, a0
jal ra, L1
mv s1, a0
end:
# -------- End of function main --------
