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
li s4, 3
mv s1, s4
add s2, s2, s3
mv s1, s2
mul s1, s5, s1
end:
# -------- End of function main --------
