// Routine L1
mv a0, i0
li t10, 1
add t11, i0, t10
mv rv, t11
end:
// Routine L2
mv a0, i0
li t12, 1
mv t1, t12
mv a0, t1
jal ra, string_of_int
mv t13, a0
mv t0, t13
mv a0, i0
mv a1, t0
jal ra, concat
mv t14, a0
mv rv, t14
