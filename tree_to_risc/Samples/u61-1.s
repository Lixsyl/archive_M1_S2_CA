.section .rodata
L_str_0:
	.string "coucou"
L_str_1:
	.string "STRING"
.section .rodata
L_float_0:
	.double 1.5
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
li s1, 1
mv s1, s1
li s2, 1
li s1, 0
bne s2, s1, L1
L2:
la s1, L_float_0
flw fs0, 0(s1)
fmv.d fs0, fs0
fmv.d fs0, fa0
jal ra, string_of_float
mv s1, a0
mv s1, s1
j L3
L1:
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
la s1, L_str_1
mv s1, s1
j L3
L3:
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
