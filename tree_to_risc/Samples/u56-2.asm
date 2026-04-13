// Routine L1
mv i0, a0
li t13, 0
beq t12, t13, L6
L7:
li t15, 0
mv t2, t15
j L8
L6:
li t16, 1
mv t2, t16
j L8
L8:
li t18, 0
bne t17, t18, L3
L4:
li t21, 1
beq t20, t21, L12
L13:
li t23, 0
mv t4, t23
j L14
L3:
li t24, 1
mv t1, t24
j L5
L12:
li t25, 1
mv t4, t25
j L14
L14:
li t27, 0
bne t26, t27, L9
L10:
li t30, 1
sub t31, t29, t30
mv t0, t31
mv t33, a0
jal L2
mv t32, a0
li t34, 1
mv t3, t34
j L11
L9:
li t35, 0
mv t3, t35
j L11
L11:
mv t1, t36
L5:
mv rv, t37
