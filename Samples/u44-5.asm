// Routine main
la t1, L_str_0
li t2, 0
li t3, 0
li t4, 0
bne t5, t3, t4
beq t5, x0, L2
L3:
la t6, L_str_2
mv L1, t6
j L4
L2:
la t7, L_str_1
mv L1, t7
j L4
L4:
mv t0, L1
mv a0, t0
jal ra, print
mv t8, a0
li t9, 0
