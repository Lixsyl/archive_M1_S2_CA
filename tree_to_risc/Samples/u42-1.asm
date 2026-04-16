// Routine main
li t1, 1
mv t3, t1
mv t4, a0
jal float_of_int
fmv.d f3, fa0
fmv.d f2, f3
la t5, L_float_0
flw f6, 0(t5)
fsub.d f8, f6, t7
fmv.d f1, f8
mv t10, a0
jal string_of_float
mv t9, a0
mv t0, t9
mv t12, a0
jal print
mv t11, a0
li t13, 0
