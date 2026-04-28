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
li s2, 3
li s1, 4
mul s1, s2, s1
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
