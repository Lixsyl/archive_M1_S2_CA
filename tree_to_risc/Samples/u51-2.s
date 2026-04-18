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
li s1, 49
mv s2, s1
mv s2, a0
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
li s1, 1
add s1, s2, s1
mv s2, s1
mv s2, a0
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
li s1, 1
add s1, s2, s1
mv s2, s1
mv s2, a0
jal ra, string_of_int
mv s1, a0
mv s1, s1
mv s1, a0
jal ra, print
mv s1, a0
li s1, 0
end:
# -------- End of function main --------
