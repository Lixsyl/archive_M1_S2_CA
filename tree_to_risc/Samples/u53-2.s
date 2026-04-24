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
li s1, 5
mv s2, s1
L1:
li s1, 53
blt s2, s1, L4
L13:
j L5
L4:
li s1, 1
mv s1, s1
j L6
L5:
li s1, 0
mv s1, s1
L6:
li s2, 0
bne s1, s2, L2
L14:
j L3
L2:
mv s2, a0
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
li s1, 2
mul s1, s1, s2
mv s2, s1
L7:
li s1, 53
blt s1, s2, L10
L15:
j L11
L10:
li s1, 1
mv s1, s1
j L12
L11:
li s1, 0
mv s1, s1
L12:
li s2, 0
bne s1, s2, L8
L16:
j L9
L8:
mv s2, a0
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
li s1, 3
sub s1, s2, s1
mv s2, s1
j L7
L9:
li s1, 0
j L1
L3:
li s1, 0
end:
# -------- End of function main --------
