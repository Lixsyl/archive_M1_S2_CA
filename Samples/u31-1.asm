// Routine main
li t0, 22
mv t1, t0
la t2, L_float_0
flw f3, 0(t2)
fmv.d f2, f3
mv a0, t1
jal ra, float_of_int
fmv.d f4, fa0
fmv.d f0, f4
fadd.d f5, f2, f0
