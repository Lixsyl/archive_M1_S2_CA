// Routine main
li t6, 1
mv t1, t6
li t8, 1
li t9, 0
bne t8, t9, L1
L2:
li f11, 1.5
fmv.d f6, f11
mv t13, a0
jal string_of_float
mv t12, a0
mv t2, t12
j L3
L1:
mv t5, t14
mv t16, a0
jal string_of_int
mv t15, a0
mv t4, t15
la t17, L_str_0
mv t3, t17
mv t19, a0
mv t20, a1
jal concat
mv t18, a0
la t21, L_str_1
mv t2, t21
j L3
L3:
mv t0, t22
mv t24, a0
jal print
mv t23, a0
li t25, 0
