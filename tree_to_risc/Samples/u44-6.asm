// Routine main
li t4, 1
mv t3, t4
mv a0, t3
jal ra, float_of_int
fmv.s f5, fa0
fmv.s f1, f5
la t6, L_float_0
flw f7, 0(t6)
feq.s t8, f7, f1
beq t8, x0, L4
L5:
li t9, 0
mv t2, t9
j L6
L6:
li t10, 0
bne t2, t10, L1
L2:
la t12, L_str_1
mv t1, t12
j L3
L4:
li t13, 1
mv t2, t13
j L6
L1:
la t14, L_str_0
mv t1, t14
j L3
L3:
mv t0, t1
mv a0, t0
jal ra, print
mv t15, a0
