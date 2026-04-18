.section .rodata
L_str_0:
	.string "Pourquoi ce message ne s'affiche pas? Il s'agit probablement d'une erreur de resolution. Pensez aux effets de bord!"
L_str_1:
	.string "a"
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
la s1, L_str_0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
la s1, L_str_1
li s1, 1
li s1, 0
end:
# -------- End of function main --------
