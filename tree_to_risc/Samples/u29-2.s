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
li s1, 11
mv s2, s1
li s1, 22
mv s1, s1
add s3, s2, s1
mv s3, s3
mul s1, s2, s1
mv s1, s1
mul s1, s3, s1
ld s1, 0(sp)
ld s2, 8(sp)
ld s3, 16(sp)
ld ra, 24(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
