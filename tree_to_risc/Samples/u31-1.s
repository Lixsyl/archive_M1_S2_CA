.section .rodata
L_float_0:
	.double 6.3
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
li s1, 22
mv s1, s1
la s1, L_float_0
flw fs0, 0(s1)
fmv.d fs1, fs0
mv s1, a0
jal ra, float_of_int
fmv.d fs0, fa0
fmv.d fs0, fs0
fadd.d fs0, fs1, fs0
end:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
