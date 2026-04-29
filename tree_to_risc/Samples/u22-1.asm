// Routine main
li t1, 22
li t2, 1
li t3, 0
bne t2, t3, L1
L2:
la t5, L_float_0
fld f6, 0(t5)
fmv.d f1, f6
j L3
L1:
li t7, 1
mv t0, t7
mv a0, t0
jal ra, float_of_int
fmv.d f8, fa0
fmv.d f1, f8
j L3
