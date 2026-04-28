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
li s2, 45
li s1, 44
bge s1, s2, L1
L2:
li s1, 0
mv s1, s1
j L3
L1:
li s1, 1
mv s1, s1
j L3
L3:
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
