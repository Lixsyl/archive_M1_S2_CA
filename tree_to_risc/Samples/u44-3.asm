// Routine main
la t8, L_str_0
mv t5, t8
la t9, L_str_0
mv t4, t9
mv t7, t10
mv t6, t11
mv t13, a0
mv t14, a1
jal strcmp
mv t12, a0
mv t3, t12
li t16, 0
beq t15, t16, L4
L5:
li t18, 0
mv t2, t18
j L6
L4:
li t19, 1
mv t2, t19
j L6
L6:
li t21, 0
bne t20, t21, L1
L2:
la t23, L_str_2
mv t1, t23
j L3
L1:
la t24, L_str_1
mv t1, t24
j L3
L3:
mv t0, t25
mv t27, a0
jal print
mv t26, a0
li t28, 0
