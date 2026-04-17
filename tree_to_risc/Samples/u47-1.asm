// Routine main
li t2, 0
li t3, 0
bne t4, t2, t3
beq t4, x0, L1
L2:
li t5, 0
mv t1, t5
j L3
L1:
la t6, L_str_0
mv t0, t6
mv t0, a0
jal ra, print
mv t7, a0
li t8, 0
mv t1, t8
j L3
L3:
li t9, 47
