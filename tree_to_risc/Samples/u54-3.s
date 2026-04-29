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
sd ra, 8(sp)
mv s1, a0
li s2, 2
mul s1, s2, s1
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd ra, 8(sp)
li s1, 27
mv s1, s1
mv a0, s1
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, L1
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s1, s1
mv a0, s1
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, string_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s1, s1
mv a0, s1
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
