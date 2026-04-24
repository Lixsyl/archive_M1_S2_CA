.section .rodata
L_str_0:
	.string "0"
L_str_1:
	.string "true"
L_str_2:
	.string "false"
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
la s1, L_str_0
li s1, 0
li s2, 0
li s1, 0
bne s2, s1, L1
L4:
j L2
L1:
la s1, L_str_1
mv s1, s1
j L3
L2:
la s1, L_str_2
mv s1, s1
L3:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
