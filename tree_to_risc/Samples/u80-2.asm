// Routine L1
mv i0, a0
li t12, 1
add t13, t11, t12
mv rv, t13
end:
// Routine L2
mv i0, a0
mv t2, t14
li t15, 1
mv t1, t15
mv t17, a0
jal string_of_int
mv t16, a0
mv t0, t16
mv t19, a0
mv t20, a1
jal concat
mv t18, a0
mv rv, t18
