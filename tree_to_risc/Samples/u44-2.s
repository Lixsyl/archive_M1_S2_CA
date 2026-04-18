.section .rodata
L_str_0:
	.string "true"
L_str_1:
	.string "false"
.section .rodata
L_float_0:
	.double 4.0
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
li s1, 4
mv s1, s1
mv s1, a0
jal ra, float_of_int
fmv.d fs0, fa0
fmv.d fs0, fs0
la s1, L_float_0
flw fs1, 0(s1)
feq.s s1, fs0, fs1
bne s1, x0, L4
L5:
li s1, 0
mv s1, s1
j L6
L4:
li s1, 1
mv s1, s1
j L6
L6:
li s2, 0
bne s1, s1, s2
beq s1, x0, L1
L2:
la s1, L_str_1
mv s1, s1
j L3
L1:
la s1, L_str_0
mv s1, s1
j L3
L3:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
