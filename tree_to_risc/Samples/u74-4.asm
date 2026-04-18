// Routine L1
mv i0, a0
mv i0, a0
jal ra, L4
mv t8, a0
mv t3, t8
mv t3, a0
jal ra, L2
mv t9, a0
mv t0, t9
mv t0, a0
jal ra, L4
mv t10, a0
mv rv, t10
end:
// Routine L2
mv i0, a0
li t11, 74
blt i0, t11, L8
L9:
li t13, 0
mv t2, t13
j L10
L8:
li t14, 1
mv t2, t14
j L10
L10:
li t15, 0
bne t2, t15, L5
L6:
mv t1, i0
j L7
L5:
li t17, 2
mul t18, t17, i0
mv t1, t18
j L7
L7:
mv rv, t1
end:
// Routine L3
mv i0, a0
mv i0, a0
jal ra, L2
mv t19, a0
mv t4, t19
mv t4, a0
jal ra, L2
mv t20, a0
mv rv, t20
end:
// Routine L4
mv i0, a0
mv i0, a0
jal ra, L2
mv t21, a0
mv t6, t21
mv i0, a0
mv i0, a1
jal ra, L3
mv t22, a0
mv t5, t22
mv t6, a0
mv t5, a1
jal ra, L3
mv t23, a0
mv rv, t23
end:
// Routine main
li t24, 74
mv t7, t24
mv t7, a0
jal ra, L1
mv t25, a0
