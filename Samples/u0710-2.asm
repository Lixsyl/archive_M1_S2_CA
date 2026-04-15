// Routine main
li t3, 0
li t4, 0
bne t3, t4, L5
L6:
li t6, 710
li t7, 1
li t8, 0
bne t7, t8, L8
L9:
li t10, 2
li t11, 1
mv t2, t11
j L10
L5:
li t12, 1
mv t1, t12
j L7
L8:
li t13, 1
mv t2, t13
j L10
L10:
mv t1, t14
L7:
li t16, 0
bne t15, t16, L2
L3:
la t18, L_str_1
mv L1, t18
j L4
L2:
la t19, L_str_0
mv L1, t19
j L4
L4:
mv t0, t20
mv t22, a0
jal print
mv t21, a0
li t23, 0
