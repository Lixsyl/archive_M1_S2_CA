// Routine L1
mv i0, a0
li t8, 0
beq t7, t8, L5
L6:
li t10, 0
mv t2, t10
j L7
L5:
li t11, 1
mv t2, t11
j L7
L7:
li t13, 0
bne t12, t13, L2
L3:
li t16, 1
sub t17, t15, t16
mv t3, t17
mv t19, a0
jal L1
mv t18, a0
mv t0, t18
mul t22, t20, t21
mv t1, t22
j L4
L2:
li t23, 1
mv t1, t23
j L4
L4:
mv rv, t24
