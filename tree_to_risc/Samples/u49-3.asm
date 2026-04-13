// Routine main
li t2, 2
mv t4, t2
mv t5, a0
jal float_of_int
fmv.d f4, fa0
fmv.d f3, f4
li f6, 5.0
fdiv.d f8, f6, t7
fmv.d f2, f8
mv t10, a0
jal string_of_float
mv t9, a0
mv t1, t9
la t11, L_str_0
mv t0, t11
mv t13, a0
mv t14, a1
jal concat
mv t12, a0
