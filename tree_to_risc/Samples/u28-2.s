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
mv s1, s2
li s2, 2
mv s1, s2
li s2, 3
mv s1, s2
add s1, s3, s1
end:
# -------- End of function main --------
