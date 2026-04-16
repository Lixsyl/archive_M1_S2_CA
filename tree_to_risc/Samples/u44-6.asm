// Routine main
li t4, 1
mv t3, t4
mv t6, a0
jal float_of_int
fmv.d f5, fa0
fmv.d f1, f5
la t7, L_float_0
flw f8, 0(t7)
feq.s t10, f8, t9
beq t10, x0, L4
L5:
li t11, 0
mv t2, t11
j L6
L4:
li t12, 1
mv t2, t12
j L6
L6:
li t14, 0
bne t13, t14, L1
L2:
la t16, L_str_1
mv t1, t16
j L3
L1:
la t17, L_str_0
mv t1, t17
j L3
L3:
mv t0, t18
mv t20, a0
jal print
mv t19, a0
li t21, 0
