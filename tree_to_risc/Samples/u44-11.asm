// Routine main
la t24, L_str_0
mv t15, t24
la t25, L_str_1
mv t14, t25
mv a0, t15
mv a1, t14
jal ra, strcmp
mv t26, a0
mv t13, t26
li t27, 0
blt t13, t27, L4
L5:
li t29, 0
mv t2, t29
j L6
L4:
li t30, 1
mv t2, t30
j L6
L6:
li t31, 0
bne t32, t2, t31
beq t32, x0, L1
L2:
la t33, L_str_3
mv t1, t33
j L3
L1:
la t34, L_str_2
mv t1, t34
j L3
L3:
mv t12, t1
mv a0, t12
jal ra, print
mv t35, a0
li t36, 0
la t37, L_str_0
mv t19, t37
la t38, L_str_1
mv t18, t38
mv a0, t19
mv a1, t18
jal ra, strcmp
mv t39, a0
mv t17, t39
li t40, 0
bge t40, t17, L10
L11:
li t42, 0
mv t4, t42
j L12
L10:
li t43, 1
mv t4, t43
j L12
L12:
li t44, 0
bne t45, t4, t44
beq t45, x0, L7
L8:
la t46, L_str_3
mv t3, t46
j L9
L7:
la t47, L_str_2
mv t3, t47
j L9
L9:
mv t16, t3
mv a0, t16
jal ra, print
mv t48, a0
li t49, 0
la t50, L_str_0
mv t23, t50
la t51, L_str_1
mv t22, t51
mv a0, t23
mv a1, t22
jal ra, strcmp
mv t52, a0
mv t21, t52
li t53, 0
blt t53, t21, L16
L17:
li t55, 0
mv t6, t55
j L18
L16:
li t56, 1
mv t6, t56
j L18
L18:
li t57, 0
bne t58, t6, t57
beq t58, x0, L13
L14:
la t59, L_str_3
mv t5, t59
j L15
L13:
la t60, L_str_2
mv t5, t60
j L15
L15:
mv t20, t5
mv a0, t20
jal ra, print
mv t61, a0
li t62, 0
la t63, L_str_0
mv t11, t63
la t64, L_str_1
mv t10, t64
mv a0, t11
mv a1, t10
jal ra, strcmp
mv t65, a0
mv t9, t65
li t66, 0
bge t9, t66, L22
L23:
li t68, 0
mv t8, t68
j L24
L22:
li t69, 1
mv t8, t69
j L24
L24:
li t70, 0
bne t71, t8, t70
beq t71, x0, L19
L20:
la t72, L_str_3
mv t7, t72
j L21
L19:
la t73, L_str_2
mv t7, t73
j L21
L21:
mv t0, t7
mv a0, t0
jal ra, print
mv t74, a0
li t75, 0
