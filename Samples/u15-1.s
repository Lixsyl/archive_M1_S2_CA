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
addi sp, sp, -32
sd s1, 0(sp)
sd s2, 8(sp)
sd ra, 16(sp)
li s2, 33
li s1, 44
blt s2, s1, L1
L2:
li s1, 0
mv s1, s1
j L3
L1:
li s1, 1
mv s1, s1
j L3
L3:
ld s1, 0(sp)
ld s2, 8(sp)
ld ra, 16(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
