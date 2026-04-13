// Routine main
li t4, 1
mv t3, t4
mv t6, a0
jal float_of_int
fmv.d f5, fa0
fmv.d f1, f5
li f7, 1.0
feq.s t9, f7, t8
beq t9, x0, L4
L5:
li t10, 0
mv t2, t10
j L6
L4:
li t11, 1
mv t2, t11
j L6
L6:
li t13, 0
bne t12, t13, L1
L2:
la t15, L_str_1
mv t1, t15
j L3
L1:
la t16, L_str_0
mv t1, t16
j L3
L3:
mv t0, t17
mv t19, a0
jal print
mv t18, a0
li t20, 0
