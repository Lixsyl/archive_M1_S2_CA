// Routine main
li f0, 1.0
li t1, 1
li t2, 0
li t3, 0
bne t2, t3, L2
L3:
la t5, L_str_1
mv L1, t5
j L4
L2:
la t6, L_str_0
mv L1, t6
j L4
L4:
mv t0, t7
mv t9, a0
jal print
mv t8, a0
li t10, 0
