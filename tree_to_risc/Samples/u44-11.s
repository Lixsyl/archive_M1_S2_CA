.section .rodata
L_str_0:
	.string "a"
L_str_1:
	.string "b"
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
blt s2, s1, L4
L25:
j L5
L4:
li s1, 1
mv s1, s1
j L6
L5:
li s1, 0
mv s1, s1
L6:
li s2, 0
bne s1, s2, L1
L26:
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
la s1, L_str_0
mv s1, s1
la s1, L_str_1
mv s1, s1
mv s1, a0
mv s1, a1
jal ra, strcmp
mv s1, a0
mv s1, s1
li s2, 0
bge s2, s1, L10
L27:
j L11
L10:
li s1, 1
mv s2, s1
j L12
L11:
li s1, 0
mv s2, s1
L12:
li s1, 0
bne s2, s1, L7
L28:
j L8
L7:
la s1, L_str_2
mv s1, s1
j L9
L8:
la s1, L_str_3
mv s1, s1
L9:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
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
blt s1, s2, L16
L29:
j L17
L16:
li s1, 1
mv s2, s1
j L18
L17:
li s1, 0
mv s2, s1
L18:
li s1, 0
bne s2, s1, L13
L30:
j L14
L13:
la s1, L_str_2
mv s1, s1
j L15
L14:
la s1, L_str_3
mv s1, s1
L15:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
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
bge s2, s1, L22
L31:
j L23
L22:
li s1, 1
mv s2, s1
j L24
L23:
li s1, 0
mv s2, s1
L24:
li s1, 0
bne s2, s1, L19
L32:
j L20
L19:
la s1, L_str_2
mv s1, s1
j L21
L20:
la s1, L_str_3
mv s1, s1
L21:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
