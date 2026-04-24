// Routine main
li t3, 4
li t4, 5
beq t3, t4, L4
L7:
j L5
L4:
li t6, 1
mv t2, t6
j L6
L5:
li t7, 0
mv t2, t7
L6:
li t8, 0
bne t2, t8, L1
L8:
j L2
L1:
la t10, L_str_0
mv t1, t10
j L3
L2:
la t11, L_str_1
mv t1, t11
L3:
mv t0, t1
mv t0, a0
jal ra, print
mv t12, a0
li t13, 0
