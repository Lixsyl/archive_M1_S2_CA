// Routine L1
mv i0, a0
li t12, 0
beq i0, t12, L6
L27:
j L7
L6:
li t14, 1
mv t2, t14
j L8
L7:
li t15, 0
mv t2, t15
L8:
li t16, 0
bne t2, t16, L3
L28:
j L4
L3:
li t18, 1
mv t1, t18
j L5
L4:
li t19, 1
beq i0, t19, L12
L29:
j L13
L12:
li t21, 1
mv t4, t21
j L14
L13:
li t22, 0
mv t4, t22
L14:
li t23, 0
bne t4, t23, L9
L30:
j L10
L9:
li t25, 0
mv t3, t25
j L11
L10:
li t26, 1
sub t27, i0, t26
mv t0, t27
mv t0, a0
jal ra, L2
mv t28, a0
li t29, 1
mv t3, t29
L11:
mv t1, t3
L5:
mv rv, t1
end:
// Routine L2
mv i0, a0
li t30, 0
beq i0, t30, L18
L31:
j L19
L18:
li t32, 1
mv t6, t32
j L20
L19:
li t33, 0
mv t6, t33
L20:
li t34, 0
bne t6, t34, L15
L32:
j L16
L15:
li t36, 0
mv t5, t36
j L17
L16:
li t37, 1
beq i0, t37, L24
L33:
j L25
L24:
li t39, 1
mv t8, t39
j L26
L25:
li t40, 0
mv t8, t40
L26:
li t41, 0
bne t8, t41, L21
L34:
j L22
L21:
li t43, 1
mv t7, t43
j L23
L22:
li t44, 1
sub t45, i0, t44
mv t9, t45
mv t9, a0
jal ra, L1
mv t46, a0
mv t7, t46
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
