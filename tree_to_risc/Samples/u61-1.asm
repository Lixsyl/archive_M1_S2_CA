// Routine main
li t5, 1
mv t1, t5
li t6, 1
li t7, 0
bne t6, t7, L1
L4:
j L2
L1:
mv t1, a0
jal ra, string_of_int
mv t9, a0
mv t4, t9
la t10, L_str_0
mv t3, t10
mv t4, a0
mv t3, a1
jal ra, concat
mv t11, a0
la t12, L_str_1
mv t2, t12
j L3
L2:
la t13, L_float_0
flw f14, 0(t13)
fmv.d f5, f14
fmv.d f5, fa0
jal ra, string_of_float
mv t15, a0
mv t2, t15
L3:
mv t0, t2
mv t0, a0
jal ra, print
mv t16, a0
li t17, 0
