// Routine main
la t0, L_float_0
flw f3, 0(t0)
fmv.d f1, f3
la t4, L_float_1
flw f5, 0(t4)
fmv.d f2, f5
fadd.d f6, f1, f2
