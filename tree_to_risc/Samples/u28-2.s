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
li s1, 1
mv s1, s1
li s2, 2
mv s1, s2
li s2, 3
mv s2, s2
add s1, s1, s2
end:
# -------- End of function main --------
