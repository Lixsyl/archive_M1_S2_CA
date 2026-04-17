// Routine main
li t4, 0
li t5, 0
bne t6, t4, t5
beq t6, x0, L4
L5:
li t7, 710
li t8, 1
li t9, 0
bne t10, t8, t9
beq t10, x0, L7
L8:
li t11, 2
li t12, 1
mv t3, t12
j L9
L4:
li t13, 1
mv t2, t13
j L6
L7:
li t14, 1
mv t3, t14
j L9
L9:
mv t2, t3
L6:
li t15, 0
bne t16, t2, t15
beq t16, x0, L1
L2:
la t17, L_str_1
mv t1, t17
j L3
L1:
la t18, L_str_0
mv t1, t18
j L3
L3:
mv t0, t1
mv t0, a0
jal ra, print
mv t19, a0
li t20, 0
