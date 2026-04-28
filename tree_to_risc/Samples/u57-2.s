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
li s1, 51
mv s2, s1
li s1, 6
mv s1, s1
add s1, s2, s1
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
