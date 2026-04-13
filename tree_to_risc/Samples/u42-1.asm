// Routine main
li t1, 1
mv t3, t1
mv t4, a0
jal float_of_int
fmv.d f3, fa0
fmv.d f2, f3
li f5, 2.5
fsub.d f7, f5, t6
fmv.d f1, f7
mv t9, a0
jal string_of_float
mv t8, a0
mv t0, t8
mv t11, a0
jal print
mv t10, a0
li t12, 0
