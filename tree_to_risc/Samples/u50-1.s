.section .rodata
L_str_0:
	.string "*"
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
la s1, L_str_0
mv s1, s1
li s2, 2
mv s2, s2
mv a0, s2
jal ra, string_of_int
mv s2, a0
mv s2, s2
mv a0, s1
mv a1, s2
jal ra, concat
mv s1, a0
ld s1, 0(sp)
ld s2, 8(sp)
ld ra, 16(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
