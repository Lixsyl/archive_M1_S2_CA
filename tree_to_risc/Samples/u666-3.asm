// Routine L1
mv a0, i0
li t7, 0
beq t8, i0, t7
bne t8, x0, L5
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
bne t12, t2, t11
beq t12, x0, L2
L3:
li t13, 1
sub t14, i0, t13
mv t3, t14
mv a0, t3
jal ra, L1
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
