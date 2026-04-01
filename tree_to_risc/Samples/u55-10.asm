// Routine main
li t3, 1
li t4, 0
bne t3, t4, L4
L5:
li t6, 0
mv t2, t6
j L6
L4:
li t7, 1
mv t2, t7
j L6
L6:
li t9, 0
bne t8, t9, L1
L2:
la t11, L_str_1
mv t1, t11
j L3
L1:
la t12, L_str_0
mv t1, t12
j L3
L3:
mv t0, t13
mv t15, a0
jal print
mv t14, a0
li t16, 0
