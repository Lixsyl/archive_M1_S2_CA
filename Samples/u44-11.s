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
addi sp, sp, -32
sd s1, 0(sp)
sd s2, 8(sp)
sd ra, 16(sp)
la s1, L_str_0
mv s2, s1
la s1, L_str_1
mv s1, s1
mv a0, s2
mv a1, s1
jal ra, strcmp
mv s1, a0
mv s2, s1
li s1, 0
blt s2, s1, L4
L5:
li s1, 0
mv s1, s1
j L6
L6:
li s2, 0
bne s1, s2, L1
L2:
la s1, L_str_3
mv s1, s1
j L3
L3:
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
la s1, L_str_0
mv s2, s1
la s1, L_str_1
mv s1, s1
mv a0, s2
mv a1, s1
jal ra, strcmp
mv s1, a0
mv s2, s1
li s1, 0
bge s1, s2, L10
L11:
li s1, 0
mv s2, s1
j L12
L12:
li s1, 0
bne s2, s1, L7
L8:
la s1, L_str_3
mv s1, s1
j L9
L9:
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
la s1, L_str_0
mv s2, s1
la s1, L_str_1
mv s1, s1
mv a0, s2
mv a1, s1
jal ra, strcmp
mv s1, a0
mv s1, s1
li s2, 0
blt s2, s1, L16
L17:
li s1, 0
mv s1, s1
j L18
L18:
li s2, 0
bne s1, s2, L13
L14:
la s1, L_str_3
mv s1, s1
j L15
L15:
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
la s1, L_str_0
mv s2, s1
la s1, L_str_1
mv s1, s1
mv a0, s2
mv a1, s1
jal ra, strcmp
mv s1, a0
mv s1, s1
li s2, 0
bge s1, s2, L22
L23:
li s1, 0
mv s2, s1
j L24
L24:
li s1, 0
bne s2, s1, L19
L20:
la s1, L_str_3
mv s1, s1
j L21
L4:
li s1, 1
mv s1, s1
j L6
L1:
la s1, L_str_2
mv s1, s1
j L3
L10:
li s1, 1
mv s2, s1
j L12
L7:
la s1, L_str_2
mv s1, s1
j L9
L16:
li s1, 1
mv s1, s1
j L18
L13:
la s1, L_str_2
mv s1, s1
j L15
L22:
li s1, 1
mv s2, s1
j L24
L19:
la s1, L_str_2
mv s1, s1
j L21
L21:
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
ld s1, 0(sp)
ld s2, 8(sp)
ld ra, 16(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
