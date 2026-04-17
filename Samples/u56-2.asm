// Routine L1
mv i0, a0
li t11, 0
beq t12, i0, t11
bne t12, x0, L6
L7:
li t13, 0
mv t2, t13
j L8
L6:
li t14, 1
mv t2, t14
j L8
L8:
li t15, 0
bne t16, t2, t15
beq t16, x0, L3
L4:
li t17, 1
beq t18, i0, t17
bne t18, x0, L12
L13:
li t19, 0
mv t4, t19
j L14
L3:
li t20, 1
mv t1, t20
j L5
L12:
li t21, 1
mv t4, t21
j L14
L14:
li t22, 0
bne t23, t4, t22
beq t23, x0, L9
L10:
li t24, 1
sub t25, i0, t24
mv t0, t25
mv t0, a0
jal ra, L2
mv t26, a0
li t27, 1
mv t3, t27
j L11
L9:
li t28, 0
mv t3, t28
j L11
L11:
mv t1, t3
L5:
mv rv, t1
