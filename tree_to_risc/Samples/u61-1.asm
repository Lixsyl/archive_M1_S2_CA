// Routine main
li t5, 1
mv t1, t5
li t6, 1
li t7, 0
bne t6, t7, L1
L2:
la t9, L_float_0
flw f10, 0(t9)
fmv.d f5, f10
fmv.d fa0, f5
jal ra, string_of_float
mv t11, a0
mv t2, t11
j L3
L1:
mv a0, t1
jal ra, string_of_int
mv t12, a0
mv t4, t12
la t13, L_str_0
mv t3, t13
mv a0, t4
mv a1, t3
jal ra, concat
mv t14, a0
la t15, L_str_1
mv t2, t15
j L3
L3:
mv t0, t2
mv a0, t0
jal ra, print
mv t16, a0
