// Routine main
li t1, 22
li t2, 1
li t3, 0
bne t2, t3, L1
L4:
j L2
L1:
li t5, 1
mv t0, t5
mv t0, a0
jal ra, float_of_int
fmv.d f6, fa0
fmv.d f1, f6
j L3
L2:
la t7, L_float_0
flw f8, 0(t7)
fmv.d f1, f8
L3:
