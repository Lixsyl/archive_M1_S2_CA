// Routine L1
mv i0, a0
mv i1, a1
add t6, t4, t5
mv rv, t6
end:
// Routine main
li t7, 1
li t8, 0
bne t7, t8, L2
L3:
li t10, 1
mv t1, t10
j L4
L2:
li t11, 8
mv t1, t11
j L4
L4:
mv t3, t12
li t13, 8
mv t2, t13
mul t16, t14, t15
mv t0, t16
mv t18, a0
mv t19, a1
jal L1
mv t17, a0
