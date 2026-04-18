// Routine L1
mv i0, a0
add t5, i0, i0
mv rv, t5
end:
// Routine L2
mv i0, a0
mv i0, a0
mv i0, a1
jal ra, concat
mv t6, a0
mv rv, t6
end:
// Routine main
la t7, L_str_0
mv t4, t7
mv t4, a0
jal ra, L2
mv t8, a0
mv t3, t8
mv t3, a0
jal ra, print
mv t9, a0
li t10, 0
li t11, 2
mv t2, t11
mv t2, a0
jal ra, L1
mv t12, a0
mv t1, t12
mv t1, a0
jal ra, string_of_int
mv t13, a0
mv t0, t13
mv t0, a0
jal ra, print
mv t14, a0
li t15, 0
