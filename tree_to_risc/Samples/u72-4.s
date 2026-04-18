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
mv s1, a0
mv s2, a1
add s1, s1, s2
mv a0, s1
end:
# -------- End of function L1 --------

# -------- Function main --------
ILPmain:
li s1, 1
li s2, 0
bne s1, s2, L2
L3:
li s1, 1
mv s1, s1
j L4
L2:
li s1, 8
mv s1, s1
j L4
L4:
mv s1, s1
li s1, 8
mv s1, s1
mul s1, s1, s1
mv s1, s1
mv s1, a0
mv s1, a1
jal ra, L1
mv s1, a0
end:
# -------- End of function main --------
