.section .rodata
L_float_1:
	.double 0.
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
li s2, 1
li s1, 0
bne s2, s1, L1
L4:
j L2
L1:
la s1, L_float_0
flw fs0, 0(s1)
fmv.d fs0, fs0
j L3
L2:
la s1, L_float_1
flw fs0, 0(s1)
fmv.d fs0, fs0
L3:
end:
# -------- End of function main --------
