// Routine main
li t3, 0
li t4, 0
bne t5, t3, t4
beq t5, x0, L5
L6:
li t6, 710
li t7, 1
li t8, 0
bne t9, t7, t8
beq t9, x0, L8
L9:
li t10, 2
li t11, 1
mv t2, t11
j L10
L5:
li t12, 1
mv t1, t12
j L7
L8:
li t13, 1
mv t2, t13
j L10
L10:
mv t1, t2
L7:
li t14, 0
bne t15, t1, t14
beq t15, x0, L2
L3:
la t16, L_str_1
mv L1, t16
j L4
L2:
la t17, L_str_0
mv L1, t17
j L4
L4:
mv t0, L1
mv a0, t0
jal ra, print
mv t18, a0
li t19, 0
