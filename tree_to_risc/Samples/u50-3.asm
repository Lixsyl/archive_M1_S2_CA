// Routine main
li t4, 1
li t5, 0
blt t4, t5, L4
L5:
li t7, 0
mv t2, t7
j L6
L6:
li t8, 0
bne t2, t8, L1
L2:
la t10, L_str_1
mv t1, t10
j L3
L4:
li t11, 1
mv t2, t11
j L6
L1:
la t12, L_str_0
mv t1, t12
j L3
L3:
mv t3, t1
la t13, L_str_2
mv t0, t13
mv a0, t3
mv a1, t0
jal ra, concat
