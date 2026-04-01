// Routine L1
mv i0, a0
li t9, 0
beq t8, t9, L5
L6:
li t11, 0
mv t2, t11
j L7
L5:
li t12, 1
mv t2, t12
j L7
L7:
li t14, 0
bne t13, t14, L2
L3:
li t17, 1
sub t18, t16, t17
mv t3, t18
mv t4, t19
mv t21, a0
jal L1
mv t20, a0
mv t0, t20
mul t24, t22, t23
mv t1, t24
j L4
L2:
li t25, 1
mv t1, t25
j L4
L4:
mv rv, t26
