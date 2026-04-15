// Routine L1
mv i1, a0
mv rv, t3
end:
// Routine L2
mv i0, a0
li t4, 2
mul t6, t4, t5
mv rv, t6
end:
// Routine main
li t7, 11
mv t1, t7
li t9, 1
add t10, t8, t9
mv t1, t10
mv t2, t11
mv t13, a0
mv t14, a1
jal L1
mv t12, a0
mv t0, t12
mv t16, a0
jal L2
mv t15, a0
