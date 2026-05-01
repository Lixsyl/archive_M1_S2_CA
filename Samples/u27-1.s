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
sd s1, 0(sp)
sd ra, 8(sp)
li s1, 1
mv s1, s1
li s1, 2
mv s1, s1
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
