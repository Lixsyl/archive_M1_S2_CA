// Routine main
li t10, 1
li t12, 0
blt t12, t10, L4
L5:
li t14, 0
mv t2, t14
j L6
L4:
li t15, 1
mv t2, t15
j L6
L6:
li t17, 0
bne t16, t17, L1
L2:
la t19, L_str_1
mv t1, t19
j L3
L1:
la t20, L_str_0
mv t1, t20
j L3
L3:
mv t8, t21
mv t23, a0
jal print
mv t22, a0
li t24, 0
li t25, 1
mv t11, t25
mv t27, a0
jal float_of_int
fmv.d f26, fa0
fmv.d f10, f26
li f29, 0.
flt.s t30, t28, f29
beq t30, x0, L10
L11:
li t31, 0
mv t4, t31
j L12
L10:
li t32, 1
mv t4, t32
j L12
L12:
li t34, 0
bne t33, t34, L7
L8:
la t36, L_str_1
mv t3, t36
j L9
L7:
la t37, L_str_0
mv t3, t37
j L9
L9:
mv t9, t38
mv t40, a0
jal print
mv t39, a0
li t41, 0
li t42, 0
mv t7, t42
mv t44, a0
jal float_of_int
fmv.d f43, fa0
fmv.d f1, f43
li f45, 1.
flt.s t47, f45, t46
beq t47, x0, L16
L17:
li t48, 0
mv t6, t48
j L18
L16:
li t49, 1
mv t6, t49
j L18
L18:
li t51, 0
bne t50, t51, L13
L14:
la t53, L_str_1
mv t5, t53
j L15
L13:
la t54, L_str_0
mv t5, t54
j L15
L15:
mv t0, t55
mv t57, a0
jal print
mv t56, a0
li t58, 0
