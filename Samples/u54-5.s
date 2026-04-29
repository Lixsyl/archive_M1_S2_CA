.section .rodata
L_str_0:
	.string "cou"
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
add s1, s1, s1
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
addi sp, sp, -16
sd ra, 8(sp)
mv s1, a0
mv a0, s1
mv a1, s1
addi sp, sp, -16
sd t6, 0(sp)
jal ra, concat
ld t6, 0(sp)
addi sp, sp, 16
mv s1, a0
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L2 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd ra, 8(sp)
la s1, L_str_0
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
jal ra, L2
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
addi sp, sp, 48
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
addi sp, sp, 48
mv s1, a0
li s1, 0
li s1, 2
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
jal ra, L1
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
addi sp, sp, 48
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
jal ra, string_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
addi sp, sp, 48
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
jal ra, print
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
addi sp, sp, 48
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
