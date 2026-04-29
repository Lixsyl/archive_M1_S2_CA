.section .rodata
L_str_0:
	.string "FUNCTION"
L_str_1:
	.string "0"
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
li s2, 1
add s1, s1, s2
mv a0, s1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
addi sp, sp, -16
sd ra, 8(sp)
mv s2, a0
li s1, 1
mv s1, s1
mv a0, s1
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
jal ra, string_of_int
addi sp, sp, 32
ld t0, 0(sp)
ld t1, 8(sp)
mv s1, a0
mv s1, s1
mv a0, s2
mv a1, s1
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
jal ra, concat
addi sp, sp, 32
ld t0, 0(sp)
ld t1, 8(sp)
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
mv s2, s1
li s1, 2
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t2, 0(sp)
sd t3, 8(sp)
sd t4, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, L1
addi sp, sp, 48
ld t2, 0(sp)
ld t3, 8(sp)
ld t4, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t2, 0(sp)
sd t3, 8(sp)
sd t4, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, string_of_int
addi sp, sp, 48
ld t2, 0(sp)
ld t3, 8(sp)
ld t4, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s1, s1
mv a0, s2
mv a1, s1
addi sp, sp, -48
sd t2, 0(sp)
sd t3, 8(sp)
sd t4, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, concat
addi sp, sp, 48
ld t2, 0(sp)
ld t3, 8(sp)
ld t4, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s2, s1
la s1, L_str_1
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t2, 0(sp)
sd t3, 8(sp)
sd t4, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, L2
addi sp, sp, 48
ld t2, 0(sp)
ld t3, 8(sp)
ld t4, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s1, s1
mv a0, s2
mv a1, s1
addi sp, sp, -48
sd t2, 0(sp)
sd t3, 8(sp)
sd t4, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, concat
addi sp, sp, 48
ld t2, 0(sp)
ld t3, 8(sp)
ld t4, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
mv s1, s1
mv a0, s1
addi sp, sp, -48
sd t2, 0(sp)
sd t3, 8(sp)
sd t4, 16(sp)
sd t5, 24(sp)
sd t6, 32(sp)
jal ra, print
addi sp, sp, 48
ld t2, 0(sp)
ld t3, 8(sp)
ld t4, 16(sp)
ld t5, 24(sp)
ld t6, 32(sp)
mv s1, a0
li s1, 0
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
