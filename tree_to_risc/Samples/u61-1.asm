// Routine main
li t5, 1
mv t1, t5
li t7, 1
li t8, 0
bne t7, t8, L1
L2:
la f11, L_float_0
flw f11, 0(t10)
fmv.d f5, f11
mv t13, a0
jal string_of_float
mv t12, a0
mv t2, t12
j L3
L1:
mv t15, a0
jal string_of_int
mv t14, a0
mv t4, t14
la t16, L_str_0
mv t3, t16
mv t18, a0
mv t19, a1
jal concat
mv t17, a0
la t20, L_str_1
mv t2, t20
j L3
L3:
mv t0, t21
mv t23, a0
jal print
mv t22, a0
li t24, 0
