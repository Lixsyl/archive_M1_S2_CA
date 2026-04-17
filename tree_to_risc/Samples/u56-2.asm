// Routine L1
mv i0, a0
li t12, 0
beq t13, i0, t12
bne t13, x0, L6
L7:
li t14, 0
mv t2, t14
j L8
L6:
li t15, 1
mv t2, t15
j L8
L8:
li t16, 0
bne t17, t2, t16
beq t17, x0, L3
L4:
li t18, 1
beq t19, i0, t18
bne t19, x0, L12
L13:
li t20, 0
mv t4, t20
j L14
L3:
li t21, 1
mv t1, t21
j L5
L12:
li t22, 1
mv t4, t22
j L14
L14:
li t23, 0
bne t24, t4, t23
beq t24, x0, L9
L10:
li t25, 1
sub t26, i0, t25
mv t0, t26
mv t0, a0
jal ra, L2
mv t27, a0
li t28, 1
mv t3, t28
j L11
L9:
li t29, 0
mv t3, t29
j L11
L11:
mv t1, t3
L5:
mv rv, t1
