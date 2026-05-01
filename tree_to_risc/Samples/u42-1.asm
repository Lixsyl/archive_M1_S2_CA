// Routine main
li t1, 1
mv t3, t1
mv a0, t3
jal ra, float_of_int
fmv.s f3, fa0
fmv.s f2, f3
la t4, L_float_0
flw f5, 0(t4)
fsub.s f6, f5, f2
fmv.s f1, f6
fmv.s fa0, f1
jal ra, string_of_float
mv t7, a0
mv t0, t7
mv a0, t0
jal ra, print
mv t8, a0
