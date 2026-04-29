.section .rodata
L_str_0:
	.string "foobar"
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
li s1, 33
mv s1, s1
la s1, L_str_0
li s2, 22
add s1, s1, s2
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
