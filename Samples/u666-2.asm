// Routine L1
mv i0, a0
li t5, 0
beq t6, i0, t5
bne t6, x0, L5
L6:
li t7, 0
mv t2, t7
j L7
L5:
li t8, 1
mv t2, t8
j L7
L7:
li t9, 0
bne t10, t2, t9
beq t10, x0, L2
L3:
li t11, 1
sub t12, i0, t11
mv t3, t12
mv t3, a0
jal ra, L1
mv t13, a0
mv t0, t13
mul t14, i0, t0
mv t1, t14
j L4
L2:
li t15, 1
mv t1, t15
j L4
L4:
mv rv, t1
