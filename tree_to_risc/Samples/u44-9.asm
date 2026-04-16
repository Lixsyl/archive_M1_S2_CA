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
la f30, L_float_0
flw f30, 0(t29)
flt.s t31, t28, f30
beq t31, x0, L10
L11:
li t32, 0
mv t4, t32
j L12
L10:
li t33, 1
mv t4, t33
j L12
L12:
li t35, 0
bne t34, t35, L7
L8:
la t37, L_str_1
mv t3, t37
j L9
L7:
la t38, L_str_0
mv t3, t38
j L9
L9:
mv t9, t39
mv t41, a0
jal print
mv t40, a0
li t42, 0
li t43, 0
mv t7, t43
mv t45, a0
jal float_of_int
fmv.d f44, fa0
fmv.d f1, f44
la f47, L_float_1
flw f47, 0(t46)
flt.s t49, f47, t48
beq t49, x0, L16
L17:
li t50, 0
mv t6, t50
j L18
L16:
li t51, 1
mv t6, t51
j L18
L18:
li t53, 0
bne t52, t53, L13
L14:
la t55, L_str_1
mv t5, t55
j L15
L13:
la t56, L_str_0
mv t5, t56
j L15
L15:
mv t0, t57
mv t59, a0
jal print
mv t58, a0
li t60, 0
