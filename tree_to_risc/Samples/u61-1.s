.section .rodata
L_str_0:
	.string "coucou"
L_str_1:
	.string "STRING"
.section .rodata
L_float_0:
	.float 1.5
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
addi sp, sp, -48
sd s1, 0(sp)
sd s2, 8(sp)
sd s3, 16(sp)
fsd fs0, 24(sp)
sd ra, 32(sp)
li s1, 1
mv s2, s1
li s3, 1
li s1, 0
bne s3, s1, L1
L2:
la s1, L_float_0
flw fs0, 0(s1)
fmv.s fs0, fs0
fmv.s fa0, fs0
jal ra, string_of_float
mv s1, a0
mv s1, s1
j L3
L1:
mv a0, s2
jal ra, string_of_int
mv s1, a0
mv s2, s1
la s1, L_str_0
mv s1, s1
mv a0, s2
mv a1, s1
jal ra, concat
mv s1, a0
la s1, L_str_1
mv s1, s1
j L3
L3:
mv s1, s1
mv a0, s1
jal ra, print
mv s1, a0
li s1, 0
ld s1, 0(sp)
ld s2, 8(sp)
ld s3, 16(sp)
fld fs0, 24(sp)
ld ra, 32(sp)
addi sp, sp, 48
ret
# -------- End of function main --------
