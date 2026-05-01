.section .rodata
L_float_0:
	.float -49.3
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
fsd fs0, 8(sp)
sd ra, 16(sp)
la s1, L_float_0
flw fs0, 0(s1)
ld s1, 0(sp)
fld fs0, 8(sp)
ld ra, 16(sp)
addi sp, sp, 32
ret
# -------- End of function main --------
