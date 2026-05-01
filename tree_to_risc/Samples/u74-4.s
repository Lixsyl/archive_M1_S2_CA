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

# -------- Function L1 --------
L1:
addi sp, sp, -16
sd s1, 0(sp)
sd ra, 8(sp)
mv s1, a0
mv a0, s1
jal ra, L4
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, L2
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, L4
mv s1, a0
mv a0, s1
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
addi sp, sp, -32
sd s1, 0(sp)
sd s2, 8(sp)
sd s3, 16(sp)
sd ra, 24(sp)
mv s2, a0
li s1, 74
blt s2, s1, L8
L9:
li s1, 0
mv s1, s1
j L10
L10:
li s3, 0
bne s1, s3, L5
L6:
mv s1, s2
j L7
L8:
li s1, 1
mv s1, s1
j L10
L5:
li s1, 2
mul s1, s1, s2
mv s1, s1
j L7
L7:
mv a0, s1
ld s1, 0(sp)
ld s2, 8(sp)
ld s3, 16(sp)
ld ra, 24(sp)
addi sp, sp, 32
ret
# -------- End of function L2 --------

# -------- Function L3 --------
L3:
addi sp, sp, -16
sd s1, 0(sp)
sd ra, 8(sp)
mv s1, a0
mv a0, s1
jal ra, L2
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, L2
mv s1, a0
mv a0, s1
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L3 --------

# -------- Function L4 --------
L4:
addi sp, sp, -32
sd s1, 0(sp)
sd s2, 8(sp)
sd ra, 16(sp)
mv s1, a0
mv a0, s1
jal ra, L2
mv s2, a0
mv s2, s2
mv a0, s1
mv a1, s1
jal ra, L3
mv s1, a0
mv s1, s1
mv a0, s2
mv a1, s1
jal ra, L3
mv s1, a0
mv a0, s1
ld s1, 0(sp)
ld s2, 8(sp)
ld ra, 16(sp)
addi sp, sp, 32
ret
# -------- End of function L4 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd s1, 0(sp)
sd ra, 8(sp)
li s1, 74
mv s1, s1
mv a0, s1
jal ra, L1
mv s1, a0
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
