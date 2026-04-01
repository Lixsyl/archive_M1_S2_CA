// Routine main
li t4, 1
li t5, 0
blt t4, t5, L4
L5:
li t7, 0
mv t2, t7
j L6
L4:
li t8, 1
mv t2, t8
j L6
L6:
li t10, 0
bne t9, t10, L1
L2:
la t12, L_str_1
mv t1, t12
j L3
L1:
la t13, L_str_0
mv t1, t13
j L3
L3:
mv t3, t14
la t15, L_str_2
mv t0, t15
mv t17, a0
mv t18, a1
jal concat
mv t16, a0
