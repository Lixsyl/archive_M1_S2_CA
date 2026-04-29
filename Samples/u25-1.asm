// Routine main
li t0, 1
li t1, 0
bne t0, t1, L1
L2:
la t3, L_float_0
fld f4, 0(t3)
fmv.d f1, f4
j L3
L1:
la t5, L_float_1
fld f6, 0(t5)
fmv.d f1, f6
j L3
