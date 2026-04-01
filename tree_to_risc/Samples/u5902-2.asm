// Routine L1
mv i0, a0
li t5, 2
mul t7, t5, t6
mv rv, t7
end:
// Routine L2
mv i1, a0
mv rv, t8
end:
// Routine main
li t9, 12
mv t1, t9
mv t4, t10
mv t12, a0
jal L1
mv t11, a0
mv t1, t11
mv t3, t13
mv t2, t14
mv t16, a0
mv t17, a1
jal L2
mv t15, a0
mv t0, t15
mv t19, a0
jal L1
mv t18, a0
