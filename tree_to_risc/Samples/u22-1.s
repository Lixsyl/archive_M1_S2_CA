.section .rodata
L_float_0:
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
addi sp, sp, -16
sd ra, 8(sp)
li s1, 22
li s1, 1
li s2, 0
bne s1, s2, L1
L2:
la s1, L_float_0
flw fs0, 0(s1)
fmv.d fs0, fs0
j L3
L1:
li s1, 1
mv s1, s1
mv a0, s1
sd t0, 0(sp)
sd t1, 8(sp)
sd t2, 16(sp)
sd t3, 24(sp)
sd t4, 32(sp)
sd t5, 40(sp)
jal ra, float_of_int
ld t0, 0(sp)
ld t1, 8(sp)
ld t2, 16(sp)
ld t3, 24(sp)
ld t4, 32(sp)
ld t5, 40(sp)
fmv.d fs0, fa0
fmv.d fs0, fs0
j L3
L3:
ld ra, 8(sp)
addi sp, sp, 16
ret
# -------- End of function main --------
