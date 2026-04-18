// Routine main
li t3, 4
li t4, 5
blt t3, t4, L4
L5:
li t6, 0
mv t2, t6
j L6
L4:
li t7, 1
mv t2, t7
j L6
L6:
li t8, 0
bne t2, t8, L1
L2:
la t10, L_str_1
mv t1, t10
j L3
L1:
la t11, L_str_0
mv t1, t11
j L3
L3:
mv t0, t1
mv t0, a0
jal ra, print
mv t12, a0
li t13, 0
