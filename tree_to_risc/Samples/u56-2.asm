// Routine L1
mv i0, a0
li t12, 0
beq i0, t12, L6
L7:
li t14, 0
mv t2, t14
j L8
L6:
li t15, 1
mv t2, t15
j L8
L8:
li t16, 0
bne t2, t16, L3
L4:
li t18, 1
beq i0, t18, L12
L13:
li t20, 0
mv t4, t20
j L14
L3:
li t21, 1
mv t1, t21
j L5
L12:
li t22, 1
mv t4, t22
j L14
L14:
li t23, 0
bne t4, t23, L9
L10:
li t25, 1
sub t26, i0, t25
mv t0, t26
mv t0, a0
jal ra, L2
mv t27, a0
li t28, 1
mv t3, t28
j L11
L9:
li t29, 0
mv t3, t29
j L11
L11:
mv t1, t3
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
L18:
li t33, 1
mv t6, t33
j L20
L20:
li t34, 0
bne t6, t34, L15
L16:
li t36, 1
beq i0, t36, L24
L25:
li t38, 0
mv t8, t38
j L26
L15:
li t39, 0
mv t5, t39
j L17
L24:
li t40, 1
mv t8, t40
j L26
L26:
li t41, 0
bne t8, t41, L21
L22:
li t43, 1
sub t44, i0, t43
mv t9, t44
mv t9, a0
jal ra, L1
mv t45, a0
mv t7, t45
j L23
L21:
li t46, 1
mv t7, t46
j L23
L23:
mv t5, t7
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
