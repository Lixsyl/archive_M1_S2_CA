// Routine L1
mv i0, a0
li t12, 0
beq i0, t12, L6
L7:
li t14, 0
mv t2, t14
j L8
L8:
li t15, 0
bne t2, t15, L3
L4:
li t17, 1
beq i0, t17, L12
L13:
li t19, 0
mv t4, t19
j L14
L14:
li t20, 0
bne t4, t20, L9
L10:
li t22, 1
sub t23, i0, t22
mv t0, t23
mv t0, a0
jal ra, L2
mv t24, a0
li t25, 1
mv t3, t25
j L11
L11:
mv t1, t3
j L5
L6:
li t26, 1
mv t2, t26
j L8
L3:
li t27, 1
mv t1, t27
j L5
L12:
li t28, 1
mv t4, t28
j L14
L9:
li t29, 0
mv t3, t29
j L11
L5:
mv rv, t1
end:
// Routine L2
mv i0, a0
li t30, 0
beq i0, t30, L18
L19:
li t32, 0
mv t6, t32
j L20
L20:
li t33, 0
bne t6, t33, L15
L16:
li t35, 1
beq i0, t35, L24
L25:
li t37, 0
mv t8, t37
j L26
L26:
li t38, 0
bne t8, t38, L21
L22:
li t40, 1
sub t41, i0, t40
mv t9, t41
mv t9, a0
jal ra, L1
mv t42, a0
mv t7, t42
j L23
L23:
mv t5, t7
j L17
L18:
li t43, 1
mv t6, t43
j L20
L15:
li t44, 0
mv t5, t44
j L17
L24:
li t45, 1
mv t8, t45
j L26
L21:
li t46, 1
mv t7, t46
j L23
L17:
mv rv, t5
end:
// Routine main
li t47, 56
mv t11, t47
mv t11, a0
jal ra, L2
mv t48, a0
mv t10, t48
li t49, 1
xor t50, t10, t49
