// Routine main
la t6, L_str_0
mv t5, t6
la t7, L_str_0
mv t4, t7
mv t5, a0
mv t4, a1
jal ra, strcmp
mv t8, a0
mv t3, t8
li t9, 0
beq t3, t9, L4
L7:
j L5
L4:
li t11, 1
mv t2, t11
j L6
L5:
li t12, 0
mv t2, t12
L6:
li t13, 0
bne t2, t13, L1
L8:
j L2
L1:
la t15, L_str_1
mv t1, t15
j L3
L2:
la t16, L_str_2
mv t1, t16
L3:
mv t0, t1
mv t0, a0
jal ra, print
mv t17, a0
li t18, 0
