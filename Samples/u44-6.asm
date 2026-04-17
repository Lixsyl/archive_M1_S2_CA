// Routine main
la t1, L_float_0
flw f2, 0(t1)
li t3, 1
li t4, 0
li t5, 0
bne t6, t4, t5
beq t6, x0, L2
L3:
la t7, L_str_1
mv L1, t7
j L4
L2:
la t8, L_str_0
mv L1, t8
j L4
L4:
mv t0, L1
mv a0, t0
jal ra, print
mv t9, a0
li t10, 0
