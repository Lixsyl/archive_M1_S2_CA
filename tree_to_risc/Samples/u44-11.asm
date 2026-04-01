// Routine main
la t32, L_str_0
mv t17, t32
la t33, L_str_1
mv t16, t33
mv t19, t34
mv t18, t35
mv t37, a0
mv t38, a1
jal strcmp
mv t36, a0
mv t15, t36
li t40, 0
blt t39, t40, L4
L5:
li t42, 0
mv t2, t42
j L6
L4:
li t43, 1
mv t2, t43
j L6
L6:
li t45, 0
bne t44, t45, L1
L2:
la t47, L_str_3
mv t1, t47
j L3
L1:
la t48, L_str_2
mv t1, t48
j L3
L3:
mv t14, t49
mv t51, a0
jal print
mv t50, a0
li t52, 0
la t53, L_str_0
mv t23, t53
la t54, L_str_1
mv t22, t54
mv t25, t55
mv t24, t56
mv t58, a0
mv t59, a1
jal strcmp
mv t57, a0
mv t21, t57
li t61, 0
bge t61, t60, L10
L11:
li t63, 0
mv t4, t63
j L12
L10:
li t64, 1
mv t4, t64
j L12
L12:
li t66, 0
bne t65, t66, L7
L8:
la t68, L_str_3
mv t3, t68
j L9
L7:
la t69, L_str_2
mv t3, t69
j L9
L9:
mv t20, t70
mv t72, a0
jal print
mv t71, a0
li t73, 0
la t74, L_str_0
mv t29, t74
la t75, L_str_1
mv t28, t75
mv t31, t76
mv t30, t77
mv t79, a0
mv t80, a1
jal strcmp
mv t78, a0
mv t27, t78
li t82, 0
blt t82, t81, L16
L17:
li t84, 0
mv t6, t84
j L18
L16:
li t85, 1
mv t6, t85
j L18
L18:
li t87, 0
bne t86, t87, L13
L14:
la t89, L_str_3
mv t5, t89
j L15
L13:
la t90, L_str_2
mv t5, t90
j L15
L15:
mv t26, t91
mv t93, a0
jal print
mv t92, a0
li t94, 0
la t95, L_str_0
mv t11, t95
la t96, L_str_1
mv t10, t96
mv t13, t97
mv t12, t98
mv t100, a0
mv t101, a1
jal strcmp
mv t99, a0
mv t9, t99
li t103, 0
bge t102, t103, L22
L23:
li t105, 0
mv t8, t105
j L24
L22:
li t106, 1
mv t8, t106
j L24
L24:
li t108, 0
bne t107, t108, L19
L20:
la t110, L_str_3
mv t7, t110
j L21
L19:
la t111, L_str_2
mv t7, t111
j L21
L21:
mv t0, t112
mv t114, a0
jal print
mv t113, a0
li t115, 0
