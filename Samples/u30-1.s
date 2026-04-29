.section .rodata
L_float_0:
	.double 3.3
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
mv s2, s1
la s1, L_float_0
fld fs0, 0(s1)
fmv.d fs1, fs0
mv a0, s2
addi sp, sp, -32
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
jal ra, float_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
addi sp, sp, 32
fmv.d fs0, fa0
fmv.d fs0, fs0
fadd.d fs0, fs0, fs1
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
