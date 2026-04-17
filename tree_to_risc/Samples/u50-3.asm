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
li t9, 0
bne t10, t2, t9
beq t10, x0, L1
L2:
la t11, L_str_1
mv t1, t11
j L3
L1:
la t12, L_str_0
mv t1, t12
j L3
L3:
mv t3, t1
la t13, L_str_2
mv t0, t13
mv t3, a0
mv t0, a1
jal ra, concat
mv t14, a0
