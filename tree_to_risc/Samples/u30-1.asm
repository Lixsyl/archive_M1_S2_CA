// Routine main
li t0, 22
mv t1, t0
la f3, L1
flw f3, 0(t2)
fmv.d f2, f3
mv t5, a0
jal float_of_int
fmv.d f4, fa0
fmv.d f0, f4
fadd.d f8, t6, t7
