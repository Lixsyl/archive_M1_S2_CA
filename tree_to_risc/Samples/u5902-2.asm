// Routine L1
mv i0, a0
li t3, 2
mul t5, t3, t4
mv rv, t5
end:
// Routine L2
mv i1, a0
mv rv, t6
end:
// Routine main
li t7, 12
mv t1, t7
mv t9, a0
jal L1
mv t8, a0
mv t1, t8
mv t2, t10
mv t12, a0
mv t13, a1
jal L2
mv t11, a0
mv t0, t11
mv t15, a0
jal L1
mv t14, a0
