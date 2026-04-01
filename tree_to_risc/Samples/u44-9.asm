// Routine main
li t11, 1
li t14, 0
blt t14, t11, L4
L5:
li t16, 0
mv t2, t16
j L6
L4:
li t17, 1
mv t2, t17
j L6
L6:
li t19, 0
bne t18, t19, L1
L2:
la t21, L_str_1
mv t1, t21
j L3
L1:
la t22, L_str_0
mv t1, t22
j L3
L3:
mv t9, t23
mv t25, a0
jal print
mv t24, a0
li t26, 0
li t27, 1
mv t12, t27
mv t13, t28
mv t30, a0
jal float_of_int
fmv.d f29, fa0
fmv.d f11, f29
li f32, 0.
flt.s t33, t31, f32
beq t33, x0, L10
L11:
li t34, 0
mv t4, t34
j L12
L10:
li t35, 1
mv t4, t35
j L12
L12:
li t37, 0
bne t36, t37, L7
L8:
la t39, L_str_1
mv t3, t39
j L9
L7:
la t40, L_str_0
mv t3, t40
j L9
L9:
mv t10, t41
mv t43, a0
jal print
mv t42, a0
li t44, 0
li t45, 0
mv t7, t45
mv t8, t46
mv t48, a0
jal float_of_int
fmv.d f47, fa0
fmv.d f1, f47
li f49, 1.
flt.s t51, f49, t50
beq t51, x0, L16
L17:
li t52, 0
mv t6, t52
j L18
L16:
li t53, 1
mv t6, t53
j L18
L18:
li t55, 0
bne t54, t55, L13
L14:
la t57, L_str_1
mv t5, t57
j L15
L13:
la t58, L_str_0
mv t5, t58
j L15
L15:
mv t0, t59
mv t61, a0
jal print
mv t60, a0
li t62, 0
