// Routine L1
mv i0, a0
li t8, 2
mul t10, t8, t9
mv rv, t10
end:
// Routine L2
mv i0, a0
mv t1, t11
mv t13, a0
jal L1
mv t12, a0
mv t0, t12
mv t15, a0
jal L1
mv t14, a0
mv rv, t14
