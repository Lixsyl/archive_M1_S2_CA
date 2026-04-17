// Routine L1
mv a0, i0
li t4, 1
add t5, i0, t4
mv t1, t5
li t6, 2
mul t7, t6, t1
mv rv, t7
end:
// Routine main
li t8, 3
mv t3, t8
mv a0, t3
jal ra, L1
mv t9, a0
mv t2, t9
mv a0, t2
jal ra, string_of_int
mv t10, a0
mv t0, t10
mv a0, t0
jal ra, print
mv t11, a0
li t12, 0
