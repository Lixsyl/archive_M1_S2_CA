// Routine main
li t4, 0
li t5, 0
bne t4, t5, L4
L5:
li t7, 710
li t8, 1
li t9, 0
bne t8, t9, L7
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
mv t2, t15
L6:
li t17, 0
bne t16, t17, L1
L2:
la t19, L_str_1
mv t1, t19
j L3
L1:
la t20, L_str_0
mv t1, t20
j L3
L3:
mv t0, t21
mv t23, a0
jal print
mv t22, a0
li t24, 0
