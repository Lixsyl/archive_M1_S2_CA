// Routine main
li t4, 0
li t5, 0
bne t4, t5, L4
L5:
li t7, 710
li t8, 1
li t9, 0
bne t8, t9, L7
L8:
li t11, 2
li t12, 1
mv t3, t12
j L9
L9:
mv t2, t3
j L6
L6:
li t13, 0
bne t2, t13, L1
L2:
la t15, L_str_1
mv t1, t15
j L3
L4:
li t16, 1
mv t2, t16
j L6
L7:
li t17, 1
mv t3, t17
j L9
L1:
la t18, L_str_0
mv t1, t18
j L3
L3:
mv t0, t1
mv t0, a0
jal ra, print
mv t19, a0
li t20, 0
