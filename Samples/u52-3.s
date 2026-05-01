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
sd s3, 16(sp)
sd ra, 24(sp)
li s1, 5
mv s3, s1
j L1
L1:
li s1, 42
blt s3, s1, L4
L5:
li s1, 0
mv s2, s1
j L6
L6:
li s1, 0
beq s2, s1, L3
L2:
li s1, 1
add s1, s3, s1
mv s3, s1
j L1
L4:
li s1, 1
mv s2, s1
j L6
L3:
li s1, 0
mv s1, s3
mv a0, s1
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
ld s1, 0(sp)
ld s2, 8(sp)
ld s3, 16(sp)
ld ra, 24(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
