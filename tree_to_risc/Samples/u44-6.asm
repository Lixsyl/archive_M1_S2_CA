// Routine main
li t4, 1
mv t3, t4
mv t3, a0
jal ra, float_of_int
fmv.d f5, fa0
fmv.d f1, f5
la t6, L_float_0
flw f7, 0(t6)
feq.s t8, f7, f1
beq t8, x0, L4
L7:
j L5
L4:
li t9, 1
mv t2, t9
j L6
L5:
li t10, 0
mv t2, t10
L6:
li t11, 0
bne t2, t11, L1
L8:
j L2
L1:
la t13, L_str_0
mv t1, t13
j L3
L2:
la t14, L_str_1
mv t1, t14
L3:
mv t0, t1
mv t0, a0
jal ra, print
mv t15, a0
li t16, 0
