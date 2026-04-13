// Routine L1
mv i0, a0
li t11, 1
add t12, t10, t11
mv rv, t12
end:
// Routine L2
mv i0, a0
li t13, 1
mv t1, t13
mv t15, a0
jal string_of_int
mv t14, a0
mv t0, t14
mv t17, a0
mv t18, a1
jal concat
mv t16, a0
mv rv, t16
