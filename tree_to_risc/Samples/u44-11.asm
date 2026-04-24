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
L25:
j L5
L4:
li t29, 1
mv t2, t29
j L6
L5:
li t30, 0
mv t2, t30
L6:
li t31, 0
bne t2, t31, L1
L26:
j L2
L1:
la t33, L_str_2
mv t1, t33
j L3
L2:
la t34, L_str_3
mv t1, t34
L3:
mv t12, t1
mv t12, a0
jal ra, print
mv t35, a0
li t36, 0
la t37, L_str_0
mv t19, t37
la t38, L_str_1
mv t18, t38
mv t19, a0
mv t18, a1
jal ra, strcmp
mv t39, a0
mv t17, t39
li t40, 0
bge t40, t17, L10
L27:
j L11
L10:
li t42, 1
mv t4, t42
j L12
L11:
li t43, 0
mv t4, t43
L12:
li t44, 0
bne t4, t44, L7
L28:
j L8
L7:
la t46, L_str_2
mv t3, t46
j L9
L8:
la t47, L_str_3
mv t3, t47
L9:
mv t16, t3
mv t16, a0
jal ra, print
mv t48, a0
li t49, 0
la t50, L_str_0
mv t23, t50
la t51, L_str_1
mv t22, t51
mv t23, a0
mv t22, a1
jal ra, strcmp
mv t52, a0
mv t21, t52
li t53, 0
blt t53, t21, L16
L29:
j L17
L16:
li t55, 1
mv t6, t55
j L18
L17:
li t56, 0
mv t6, t56
L18:
li t57, 0
bne t6, t57, L13
L30:
j L14
L13:
la t59, L_str_2
mv t5, t59
j L15
L14:
la t60, L_str_3
mv t5, t60
L15:
mv t20, t5
mv t20, a0
jal ra, print
mv t61, a0
li t62, 0
la t63, L_str_0
mv t11, t63
la t64, L_str_1
mv t10, t64
mv t11, a0
mv t10, a1
jal ra, strcmp
mv t65, a0
mv t9, t65
li t66, 0
bge t9, t66, L22
L31:
j L23
L22:
li t68, 1
mv t8, t68
j L24
L23:
li t69, 0
mv t8, t69
L24:
li t70, 0
bne t8, t70, L19
L32:
j L20
L19:
la t72, L_str_2
mv t7, t72
j L21
L20:
la t73, L_str_3
mv t7, t73
L21:
mv t0, t7
mv t0, a0
jal ra, print
mv t74, a0
li t75, 0
