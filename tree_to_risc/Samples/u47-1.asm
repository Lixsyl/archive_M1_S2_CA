// Routine main
li t2, 0
li t3, 0
bne t2, t3, L1
L4:
j L2
L1:
la t5, L_str_0
mv t0, t5
mv t0, a0
jal ra, print
mv t6, a0
li t7, 0
mv t1, t7
j L3
L2:
li t8, 0
mv t1, t8
L3:
li t9, 47
