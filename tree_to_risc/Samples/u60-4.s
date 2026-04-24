.section .rodata
L_str_0:
	.string "BOOL"
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
li s1, 2
beq s2, s1, L1
L4:
j L2
L1:
li s1, 1
mv s1, s1
j L3
L2:
li s1, 0
mv s1, s1
L3:
la s1, L_str_0
end:
# -------- End of function main --------
