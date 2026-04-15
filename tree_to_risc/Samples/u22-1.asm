// Routine main
li t1, 22
li t2, 1
li t3, 0
bne t2, t3, L1
L2:
la f6, L4
flw f6, 0(t5)
fmv.d f1, f6
j L3
L1:
li t7, 1
mv t0, t7
mv t9, a0
jal float_of_int
fmv.d f8, fa0
fmv.d f1, f8
j L3
L3:
