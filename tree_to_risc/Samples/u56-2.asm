// Routine L1
mv i0, a0
li t14, 0
beq t13, t14, L6
L7:
li t16, 0
mv t2, t16
j L8
L6:
li t17, 1
mv t2, t17
j L8
L8:
li t19, 0
bne t18, t19, L3
L4:
li t22, 1
beq t21, t22, L12
L13:
li t24, 0
mv t4, t24
j L14
L3:
li t25, 1
mv t1, t25
j L5
L12:
li t26, 1
mv t4, t26
j L14
L14:
li t28, 0
bne t27, t28, L9
L10:
li t31, 1
sub t32, t30, t31
mv t0, t32
mv t34, a0
jal L2
mv t33, a0
li t35, 1
mv t3, t35
j L11
L9:
li t36, 0
mv t3, t36
j L11
L11:
mv t1, t37
L5:
mv rv, t38
