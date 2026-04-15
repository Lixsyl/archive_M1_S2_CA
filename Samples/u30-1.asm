// Routine main
li t0, 22
mv t1, t0
li f1, 3.3
fmv.d f2, f1
mv t4, a0
jal float_of_int
fmv.d f3, fa0
fmv.d f0, f3
fadd.d f7, t5, t6
