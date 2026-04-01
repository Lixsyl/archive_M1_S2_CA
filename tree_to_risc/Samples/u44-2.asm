// Routine main
li t5, 4
mv t3, t5
mv t4, t6
mv t8, a0
jal float_of_int
fmv.d f7, fa0
fmv.d f1, f7
li f10, 4.0
feq.s t11, t9, f10
bne t11, x0, L4
L5:
li t12, 0
mv t2, t12
j L6
L4:
li t13, 1
mv t2, t13
j L6
L6:
li t15, 0
bne t14, t15, L1
L2:
la t17, L_str_1
mv t1, t17
j L3
L1:
la t18, L_str_0
mv t1, t18
j L3
L3:
mv t0, t19
mv t21, a0
jal print
mv t20, a0
li t22, 0
