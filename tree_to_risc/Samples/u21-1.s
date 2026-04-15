.section .rodata
L_str_0:
	.string "foobar"
.section .rodata
L_float_0:
	.double 2.2
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
la fs0, L_float_0
flw fs0, 0(t1)
li s1, 1
la s1, L_str_0
end:
# -------- End of function main --------
