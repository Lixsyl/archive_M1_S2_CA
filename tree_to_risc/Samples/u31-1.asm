// Routine main
li t0, 22
mv t1, t0
li f1, 6.3
fmv.d f2, f1
mv t2, t4
mv t3, t5
mv t7, a0
jal float_of_int
fmv.d f6, fa0
fmv.d f0, f6
fadd.d t10, t8, t9
