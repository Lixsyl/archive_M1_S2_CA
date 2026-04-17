// Routine main
la t6, L_str_0
mv t5, t6
la t7, L_str_1
mv t4, t7
mv a0, t5
mv a1, t4
jal ra, strcmp
mv t8, a0
mv t3, t8
li t9, 0
beq t10, t3, t9
bne t10, x0, L4
L5:
li t11, 0
mv t2, t11
j L6
L4:
li t12, 1
mv t2, t12
j L6
L6:
li t13, 0
bne t14, t2, t13
beq t14, x0, L1
L2:
la t15, L_str_3
mv t1, t15
j L3
L1:
la t16, L_str_2
mv t1, t16
j L3
L3:
mv t0, t1
mv a0, t0
jal ra, print
mv t17, a0
li t18, 0
