// Routine main
la t24, L_str_0
mv t15, t24
la t25, L_str_1
mv t14, t25
mv t27, a0
mv t28, a1
jal strcmp
mv t26, a0
mv t13, t26
li t30, 0
blt t29, t30, L4
L5:
li t32, 0
mv t2, t32
j L6
L4:
li t33, 1
mv t2, t33
j L6
L6:
li t35, 0
bne t34, t35, L1
L2:
la t37, L_str_3
mv t1, t37
j L3
L1:
la t38, L_str_2
mv t1, t38
j L3
L3:
mv t12, t39
mv t41, a0
jal print
mv t40, a0
li t42, 0
la t43, L_str_0
mv t19, t43
la t44, L_str_1
mv t18, t44
mv t46, a0
mv t47, a1
jal strcmp
mv t45, a0
mv t17, t45
li t49, 0
bge t49, t48, L10
L11:
li t51, 0
mv t4, t51
j L12
L10:
li t52, 1
mv t4, t52
j L12
L12:
li t54, 0
bne t53, t54, L7
L8:
la t56, L_str_3
mv t3, t56
j L9
L7:
la t57, L_str_2
mv t3, t57
j L9
L9:
mv t16, t58
mv t60, a0
jal print
mv t59, a0
li t61, 0
la t62, L_str_0
mv t23, t62
la t63, L_str_1
mv t22, t63
mv t65, a0
mv t66, a1
jal strcmp
mv t64, a0
mv t21, t64
li t68, 0
blt t68, t67, L16
L17:
li t70, 0
mv t6, t70
j L18
L16:
li t71, 1
mv t6, t71
j L18
L18:
li t73, 0
bne t72, t73, L13
L14:
la t75, L_str_3
mv t5, t75
j L15
L13:
la t76, L_str_2
mv t5, t76
j L15
L15:
mv t20, t77
mv t79, a0
jal print
mv t78, a0
li t80, 0
la t81, L_str_0
mv t11, t81
la t82, L_str_1
mv t10, t82
mv t84, a0
mv t85, a1
jal strcmp
mv t83, a0
mv t9, t83
li t87, 0
bge t86, t87, L22
L23:
li t89, 0
mv t8, t89
j L24
L22:
li t90, 1
mv t8, t90
j L24
L24:
li t92, 0
bne t91, t92, L19
L20:
la t94, L_str_3
mv t7, t94
j L21
L19:
la t95, L_str_2
mv t7, t95
j L21
L21:
mv t0, t96
mv t98, a0
jal print
mv t97, a0
li t99, 0
