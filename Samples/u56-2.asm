// Routine L1
mv i0, a0
li t11, 0
beq i0, t11, L6
L7:
li t13, 0
mv t2, t13
j L8
L8:
li t14, 0
bne t2, t14, L3
L4:
li t16, 1
beq i0, t16, L12
L13:
li t18, 0
mv t4, t18
j L14
L14:
li t19, 0
bne t4, t19, L9
L10:
li t21, 1
sub t22, i0, t21
mv t0, t22
mv a0, t0
jal ra, L2
mv t23, a0
li t24, 1
mv t3, t24
j L11
L11:
mv t1, t3
j L5
L6:
li t25, 1
mv t2, t25
j L8
L3:
li t26, 1
mv t1, t26
j L5
L12:
li t27, 1
mv t4, t27
j L14
L9:
li t28, 0
mv t3, t28
j L11
L5:
mv rv, t1
// Routine L2
mv i0, a0
li t29, 0
beq i0, t29, L18
L19:
li t31, 0
mv t6, t31
j L20
L20:
li t32, 0
bne t6, t32, L15
L16:
li t34, 1
beq i0, t34, L24
L25:
li t36, 0
mv t8, t36
j L26
L26:
li t37, 0
bne t8, t37, L21
L22:
li t39, 1
sub t40, i0, t39
mv t9, t40
mv a0, t9
jal ra, L1
mv t41, a0
mv t7, t41
j L23
L23:
mv t5, t7
j L17
L18:
li t42, 1
mv t6, t42
j L20
L15:
li t43, 0
mv t5, t43
j L17
L24:
li t44, 1
mv t8, t44
j L26
L21:
li t45, 1
mv t7, t45
j L23
L17:
mv rv, t5
// Routine main
li t46, 56
mv t10, t46
mv a0, t10
jal ra, L2
