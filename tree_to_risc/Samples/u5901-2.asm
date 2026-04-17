// Routine L1
mv a0, i0
li t3, 2
mul t4, t3, i0
mv rv, t4
end:
// Routine L2
mv a0, i1
mv rv, i1
end:
// Routine main
li t5, 11
mv t1, t5
li t6, 1
add t7, t1, t6
mv t1, t7
mv t2, t1
mv a0, t2
mv a1, t1
jal ra, L2
mv t8, a0
mv t0, t8
mv a0, t0
jal ra, L1
mv t9, a0
