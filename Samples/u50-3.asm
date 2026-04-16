// Routine main
li t3, 2
mv t2, t3
li t4, 1
li t5, 0
blt t4, t5, L5
L6:
li t7, 0
mv t1, t7
j L7
L5:
li t8, 1
mv t1, t8
j L7
L7:
li t10, 0
bne t9, t10, L2
L3:
la t12, L_str_1
mv L1, t12
j L4
L2:
la t13, L_str_0
mv L1, t13
j L4
L4:
mv t0, t14
mv t16, a0
mv t17, a1
jal concat
mv t15, a0
