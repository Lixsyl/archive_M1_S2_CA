// Routine L1
mv a0, i1
mv rv, i1
end:
// Routine L2
mv a0, i0
li t3, 2
mul t4, t3, i0
mv rv, t4
end:
// Routine main
li t5, 12
mv t1, t5
mv a0, t1
jal ra, L2
mv t6, a0
mv t1, t6
mv t2, t1
mv a0, t2
mv a1, t1
jal ra, L1
mv t7, a0
mv t0, t7
mv a0, t0
jal ra, L2
mv t8, a0
