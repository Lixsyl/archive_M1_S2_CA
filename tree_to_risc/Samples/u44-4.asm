// Routine main
la t6, L_str_0
mv t5, t6
la t7, L_str_1
mv t4, t7
mv t9, a0
mv t10, a1
jal strcmp
mv t8, a0
mv t3, t8
li t12, 0
beq t11, t12, L4
L5:
li t14, 0
mv t2, t14
j L6
L4:
li t15, 1
mv t2, t15
j L6
L6:
li t17, 0
bne t16, t17, L1
L2:
la t19, L_str_3
mv t1, t19
j L3
L1:
la t20, L_str_2
mv t1, t20
j L3
L3:
mv t0, t21
mv t23, a0
jal print
mv t22, a0
li t24, 0
