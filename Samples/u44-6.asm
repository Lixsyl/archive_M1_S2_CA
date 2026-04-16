// Routine main
la t1, L_float_0
flw f2, 0(t1)
li t3, 1
li t4, 0
li t5, 0
bne t4, t5, L2
L3:
la t7, L_str_1
mv L1, t7
j L4
L2:
la t8, L_str_0
mv L1, t8
j L4
L4:
mv t0, t9
mv t11, a0
jal print
mv t10, a0
li t12, 0
