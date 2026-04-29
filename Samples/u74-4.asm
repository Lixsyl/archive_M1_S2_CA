// Routine L1
mv i0, a0
li t8, 74
blt i0, t8, L8
L9:
li t10, 0
mv t2, t10
j L10
L10:
li t11, 0
bne t2, t11, L5
L6:
mv t1, i0
j L7
L8:
li t13, 1
mv t2, t13
j L10
L5:
li t14, 2
mul t15, t14, i0
mv t1, t15
j L7
L7:
mv rv, t1
// Routine L2
mv i0, a0
mv a0, i0
jal ra, L4
mv t16, a0
mv t3, t16
mv a0, t3
jal ra, L1
mv t17, a0
mv t0, t17
mv a0, t0
jal ra, L4
mv t18, a0
mv rv, t18
// Routine L3
mv i0, a0
mv a0, i0
jal ra, L1
mv t19, a0
mv t4, t19
mv a0, t4
jal ra, L1
mv t20, a0
mv rv, t20
// Routine L4
mv i0, a0
mv a0, i0
jal ra, L1
mv t21, a0
mv t6, t21
mv a0, i0
mv a1, i0
jal ra, L3
mv t22, a0
mv t5, t22
mv a0, t6
mv a1, t5
jal ra, L3
mv t23, a0
mv rv, t23
// Routine main
li t24, 74
mv t7, t24
mv a0, t7
jal ra, L2
