// Routine L1
mv i0, a0
li t7, 0
beq i0, t7, L5
L6:
li t9, 0
mv t2, t9
j L7
L5:
li t10, 1
mv t2, t10
j L7
L7:
li t11, 0
bne t2, t11, L2
L3:
li t13, 1
sub t14, i0, t13
mv t3, t14
mv t3, a0
jal L1
mv t15, a0
mv t0, t15
mul t16, i0, t0
mv t1, t16
j L4
L2:
li t17, 1
mv t1, t17
j L4
L4:
mv rv, t1
