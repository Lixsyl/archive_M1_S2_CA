// Routine main
la t6, L_str_0
mv t5, t6
la t7, L_str_0
mv t4, t7
mv a0, t5
mv a1, t4
jal ra, strcmp
mv t8, a0
mv t3, t8
li t9, 0
beq t3, t9, L4
L5:
li t11, 0
mv t2, t11
j L6
L6:
li t12, 0
bne t2, t12, L1
L2:
la t14, L_str_2
mv t1, t14
j L3
L4:
li t15, 1
mv t2, t15
j L6
L1:
la t16, L_str_1
mv t1, t16
j L3
L3:
mv t0, t1
mv a0, t0
jal ra, print
mv t17, a0
