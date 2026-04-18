// Routine L1
mv i0, a0
li t4, 2
mul t5, t4, i0
mv rv, t5
end:
// Routine L2
mv i0, a0
mv i0, a0
jal ra, L1
mv t6, a0
mv t0, t6
mv t0, a0
jal ra, L1
mv t7, a0
mv rv, t7
end:
// Routine L3
mv i0, a0
mv i0, a0
jal ra, L1
mv t8, a0
mv t2, t8
mv i0, a0
mv i0, a1
jal ra, L2
mv t9, a0
mv t1, t9
mv t2, a0
mv t1, a1
jal ra, L2
mv t10, a0
mv rv, t10
end:
// Routine main
li t11, 73
mv t3, t11
mv t3, a0
jal ra, L3
mv t12, a0
