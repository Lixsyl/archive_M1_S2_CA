// Routine main
li t2, 1
li t3, 0
bne t2, t3, L1
L2:
li t5, 0
mv t1, t5
j L3
L1:
la t6, L_str_0
mv t0, t6
mv t8, a0
jal print
mv t7, a0
li t9, 0
mv t1, t9
j L3
L3:
li t11, 48
