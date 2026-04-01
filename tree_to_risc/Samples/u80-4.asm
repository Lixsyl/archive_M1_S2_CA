// Routine main
la t4, L_str_0
mv t3, t4
mv t6, a0
jal print
mv t5, a0
li t7, 0
la t8, L_str_1
mv t2, t8
la t9, L_str_2
mv t1, t9
mv t11, a0
mv t12, a1
jal concat
mv t10, a0
mv t0, t10
mv t14, a0
jal print
mv t13, a0
li t15, 0
