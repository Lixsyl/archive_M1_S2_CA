// Routine main
li t5, 1
mv t1, t5
li t7, 1
li t8, 0
bne t7, t8, L1
L2:
li f10, 1.5
fmv.d f5, f10
mv t12, a0
jal string_of_float
mv t11, a0
mv t2, t11
j L3
L1:
mv t14, a0
jal string_of_int
mv t13, a0
mv t4, t13
la t15, L_str_0
mv t3, t15
mv t17, a0
mv t18, a1
jal concat
mv t16, a0
la t19, L_str_1
mv t2, t19
j L3
L3:
mv t0, t20
mv t22, a0
jal print
mv t21, a0
li t23, 0
