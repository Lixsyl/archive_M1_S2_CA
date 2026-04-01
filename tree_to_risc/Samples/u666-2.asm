// Routine L1
mv i0, a0
li t7, 0
beq t6, t7, L5
L6:
li t9, 0
mv t2, t9
j L7
L5:
li t10, 1
mv t2, t10
j L7
L7:
li t12, 0
bne t11, t12, L2
L3:
li t15, 1
sub t16, t14, t15
mv t3, t16
mv t4, t17
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
