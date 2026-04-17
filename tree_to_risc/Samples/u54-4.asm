// Routine L1
fmv.d fa0, fi0
li t0, 2
mv t1, t0
mv a0, t1
jal ra, float_of_int
fmv.d f1, fa0
fmv.d f0, f1
fmul.d f2, f0, fi0
fmv.d fv, f2
