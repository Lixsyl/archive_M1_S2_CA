// Routine L1
mv i0, a0
li t10, 1
add t11, i0, t10
mv rv, t11
end:
// Routine L2
mv i0, a0
li t12, 1
mv t1, t12
mv t1, a0
jal string_of_int
mv t13, a0
mv t0, t13
mv i0, a0
mv t0, a1
jal concat
mv t14, a0
mv rv, t14
