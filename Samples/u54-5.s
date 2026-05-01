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
sd s1, 0(sp)
sd ra, 8(sp)
mv s1, a0
add s1, s1, s1
mv a0, s1
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L1 --------

# -------- Function L2 --------
L2:
addi sp, sp, -16
sd s1, 0(sp)
sd ra, 8(sp)
mv s1, a0
mv a0, s1
mv a1, s1
jal ra, concat
mv s1, a0
mv a0, s1
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function L2 --------

# -------- Function main --------
ILPmain:
addi sp, sp, -16
sd s1, 0(sp)
sd ra, 8(sp)
la s1, L_str_0
mv s1, s1
mv a0, s1
jal ra, L2
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
li s1, 2
mv s1, s1
mv a0, s1
jal ra, L1
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
ld s1, 0(sp)
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
