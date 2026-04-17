// Routine main
li t2, 2
mv t4, t2
mv t4, a0
jal float_of_int
fmv.d f4, fa0
fmv.d f3, f4
la t5, L_float_0
flw f6, 0(t5)
fdiv.d f7, f6, f3
fmv.d f2, f7
fmv.d f2, fa0
jal string_of_float
mv t8, a0
mv t1, t8
la t9, L_str_0
mv t0, t9
mv t1, a0
mv t0, a1
jal concat
mv t10, a0
