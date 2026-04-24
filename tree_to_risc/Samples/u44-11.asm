// Routine main
la t24, L_str_0
mv t15, t24
la t25, L_str_1
mv t14, t25
mv t15, a0
mv t14, a1
jal ra, strcmp
mv t26, a0
mv t13, t26
li t27, 0
blt t13, t27, L4
L5:
li t29, 0
mv t2, t29
j L6
L6:
li t30, 0
bne t2, t30, L1
L2:
la t32, L_str_3
mv t1, t32
j L3
L3:
mv t12, t1
mv t12, a0
jal ra, print
mv t33, a0
li t34, 0
la t35, L_str_0
mv t19, t35
la t36, L_str_1
mv t18, t36
mv t19, a0
mv t18, a1
jal ra, strcmp
mv t37, a0
mv t17, t37
li t38, 0
bge t38, t17, L10
L11:
li t40, 0
mv t4, t40
j L12
L12:
li t41, 0
bne t4, t41, L7
L8:
la t43, L_str_3
mv t3, t43
j L9
L9:
mv t16, t3
mv t16, a0
jal ra, print
mv t44, a0
li t45, 0
la t46, L_str_0
mv t23, t46
la t47, L_str_1
mv t22, t47
mv t23, a0
mv t22, a1
jal ra, strcmp
mv t48, a0
mv t21, t48
li t49, 0
blt t49, t21, L16
L17:
li t51, 0
mv t6, t51
j L18
L18:
li t52, 0
bne t6, t52, L13
L14:
la t54, L_str_3
mv t5, t54
j L15
L15:
mv t20, t5
mv t20, a0
jal ra, print
mv t55, a0
li t56, 0
la t57, L_str_0
mv t11, t57
la t58, L_str_1
mv t10, t58
mv t11, a0
mv t10, a1
jal ra, strcmp
mv t59, a0
mv t9, t59
li t60, 0
bge t9, t60, L22
L23:
li t62, 0
mv t8, t62
j L24
L24:
li t63, 0
bne t8, t63, L19
L20:
la t65, L_str_3
mv t7, t65
j L21
L4:
li t66, 1
mv t2, t66
j L6
L1:
la t67, L_str_2
mv t1, t67
j L3
L10:
li t68, 1
mv t4, t68
j L12
L7:
la t69, L_str_2
mv t3, t69
j L9
L16:
li t70, 1
mv t6, t70
j L18
L13:
la t71, L_str_2
mv t5, t71
j L15
L22:
li t72, 1
mv t8, t72
j L24
L19:
la t73, L_str_2
mv t7, t73
j L21
L21:
mv t0, t7
mv t0, a0
jal ra, print
mv t74, a0
li t75, 0
