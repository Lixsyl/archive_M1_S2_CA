// Routine L1
mv i0, a0
li t3, 2
mul t4, t3, i0
mv rv, t4
end:
// Routine L2
mv i1, a0
mv rv, i1
end:
// Routine main
li t5, 12
mv t1, t5
mv t1, a0
jal ra, L1
mv t6, a0
mv t1, t6
mv t2, t1
mv t2, a0
mv t1, a1
jal ra, L2
mv t7, a0
mv t0, t7
mv t0, a0
jal ra, L1
mv t8, a0
