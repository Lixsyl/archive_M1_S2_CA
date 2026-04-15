// Routine main
li t0, 1
li t1, 0
bne t0, t1, L1
L2:
la f4, L4
flw f4, 0(t3)
fmv.d f1, f4
j L3
L1:
la f6, L5
flw f6, 0(t5)
fmv.d f1, f6
j L3
L3:
