// Routine L1
mv i0, a0
li t6, 0
beq t5, t6, L5
L6:
li t8, 0
mv t2, t8
j L7
L5:
li t9, 1
mv t2, t9
j L7
L7:
li t11, 0
bne t10, t11, L2
L3:
li t14, 1
sub t15, t13, t14
mv t3, t15
mv t17, a0
jal L1
mv t16, a0
mv t0, t16
mul t20, t18, t19
mv t1, t20
j L4
L2:
li t21, 1
mv t1, t21
j L4
L4:
mv rv, t22
