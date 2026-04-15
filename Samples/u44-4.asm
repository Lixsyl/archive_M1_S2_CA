// Routine main
la t1, L_str_0
la t2, L_str_1
li t3, 0
li t4, 0
bne t3, t4, L2
L3:
la t6, L_str_3
mv L1, t6
j L4
L2:
la t7, L_str_2
mv L1, t7
j L4
L4:
mv t0, t8
mv t10, a0
jal print
mv t9, a0
li t11, 0
