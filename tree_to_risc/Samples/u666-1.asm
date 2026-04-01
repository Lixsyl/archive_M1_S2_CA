// Routine L1
mv i0, a0
li t5, 0
beq t4, t5, L5
L6:
li t7, 0
mv t2, t7
j L7
L5:
li t8, 1
mv t2, t8
j L7
L7:
li t10, 0
bne t9, t10, L2
L3:
li t13, 1
sub t14, t12, t13
mv t0, t14
mv t16, a0
jal L1
mv t15, a0
mv t1, t15
j L4
L2:
li t17, 1
mv t1, t17
j L4
L4:
mv rv, t18
