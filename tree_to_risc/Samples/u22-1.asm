// Routine main
li t1, 22
li t2, 1
li t3, 0
bne t2, t3, L1
L2:
li f5, 1.
fmv.d f1, f5
j L3
L1:
li t6, 1
mv t0, t6
mv t8, a0
jal float_of_int
fmv.d f7, fa0
fmv.d f1, f7
j L3
L3:
