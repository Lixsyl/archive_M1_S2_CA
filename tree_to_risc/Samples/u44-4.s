.section .rodata
L_str_0:
	.string "aa"
L_str_1:
	.string "bb"
L_str_2:
	.string "true"
L_str_3:
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
mv s1, s1
la s1, L_str_1
mv s1, s1
mv s1, a0
mv s1, a1
jal ra, strcmp
mv s1, a0
mv s2, s1
li s1, 0
beq s2, s1, L4
L7:
j L5
L4:
li s1, 1
mv s2, s1
j L6
L5:
li s1, 0
mv s2, s1
L6:
li s1, 0
bne s2, s1, L1
L8:
j L2
L1:
la s1, L_str_2
mv s1, s1
j L3
L2:
la s1, L_str_3
mv s1, s1
L3:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
