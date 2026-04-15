// Routine main
li t2, 2
mv t4, t2
mv t5, a0
jal float_of_int
fmv.d f4, fa0
fmv.d f3, f4
la f7, L_float_0
flw f7, 0(t6)
fdiv.d f9, f7, t8
fmv.d f2, f9
mv t11, a0
jal string_of_float
mv t10, a0
mv t1, t10
la t12, L_str_0
mv t0, t12
mv t14, a0
mv t15, a1
jal concat
mv t13, a0
