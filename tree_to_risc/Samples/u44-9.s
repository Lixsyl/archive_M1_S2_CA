.section .rodata
L_str_0:
	.string "true"
L_str_1:
	.string "false"
.section .rodata
L_float_0:
	.double 0.
L_float_1:
	.double 1.
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
li s1, 1
li s2, 0
blt s2, s1, L4
L19:
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
L20:
j L2
L1:
la s1, L_str_0
mv s1, s1
j L3
L2:
la s1, L_str_1
mv s1, s1
L3:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
li s1, 1
mv s1, s1
mv s1, a0
jal ra, float_of_int
fmv.d fs0, fa0
fmv.d fs1, fs0
la s1, L_float_0
flw fs0, 0(s1)
flt.s s1, fs1, fs0
beq s1, x0, L10
L21:
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
L22:
j L8
L7:
la s1, L_str_0
mv s1, s1
j L9
L8:
la s1, L_str_1
mv s1, s1
L9:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
li s1, 0
mv s1, s1
mv s1, a0
jal ra, float_of_int
fmv.d fs0, fa0
fmv.d fs0, fs0
la s1, L_float_1
flw fs1, 0(s1)
flt.s s1, fs1, fs0
beq s1, x0, L16
L23:
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
L24:
j L14
L13:
la s1, L_str_0
mv s1, s1
j L15
L14:
la s1, L_str_1
mv s1, s1
L15:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
