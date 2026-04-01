// Routine L1
mv i0, a0
li t4, 2
mul t6, t4, t5
mv rv, t6
end:
// Routine L2
mv i1, a0
mv rv, t7
end:
// Routine main
li t8, 11
mv t1, t8
li t10, 1
add t11, t9, t10
mv t1, t11
mv t3, t12
mv t2, t13
mv t15, a0
mv t16, a1
jal L2
mv t14, a0
mv t0, t14
mv t18, a0
jal L1
mv t17, a0
