.section .rodata
L_float_0:
	.double 1.25
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

# -------- Function L1 --------
L1:
fmv.d fs1, fa0
li s1, 2
mv s1, s1
mv s1, a0
jal ra, float_of_int
fmv.d fs0, fa0
fmv.d fs0, fs0
fmul.d fs0, fs0, fs1
fmv.d fa0, fs0
end:
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
la s1, L_float_0
flw fs0, 0(s1)
fmv.d fs0, fs0
fmv.d fs0, fa0
jal ra, L1
fmv.d fs0, fa0
fmv.d fs0, fs0
fmv.d fs0, fa0
jal ra, string_of_float
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
