// Routine main
la t2, L_str_0
li t3, 0
li t4, 0
li t5, 0
bne t4, t5, L1
L2:
la t7, L_str_2
mv t1, t7
j L3
L1:
la t8, L_str_1
mv t1, t8
j L3
L3:
mv t0, t1
mv t0, a0
jal print
mv t9, a0
li t10, 0
