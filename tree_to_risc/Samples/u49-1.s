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
addi sp, sp, -16
sd ra, 8(sp)
li s1, 12
mv s1, s1
mv s1, a0
jal ra, string_of_int
mv s1, a0
mv s1, s1
la s1, L_str_0
mv s1, s1
mv s1, a0
mv s1, a1
jal ra, concat
mv s1, a0
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
