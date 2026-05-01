// Routine main
li t10, 1
li t12, 0
blt t12, t10, L4
L5:
li t14, 0
mv t2, t14
j L6
L6:
li t15, 0
bne t2, t15, L1
L2:
la t17, L_str_1
mv t1, t17
j L3
L3:
mv t8, t1
mv a0, t8
jal ra, print
mv t18, a0
li t19, 0
li t20, 1
mv t11, t20
mv a0, t11
jal ra, float_of_int
fmv.s f21, fa0
fmv.s f10, f21
la t22, L_float_0
flw f23, 0(t22)
flt.s t24, f10, f23
beq t24, x0, L10
L11:
li t25, 0
mv t4, t25
j L12
L12:
li t26, 0
bne t4, t26, L7
L8:
la t28, L_str_1
mv t3, t28
j L9
L9:
mv t9, t3
mv a0, t9
jal ra, print
mv t29, a0
li t30, 0
li t31, 0
mv t7, t31
mv a0, t7
jal ra, float_of_int
fmv.s f32, fa0
fmv.s f1, f32
la t33, L_float_1
flw f34, 0(t33)
flt.s t35, f34, f1
beq t35, x0, L16
L17:
li t36, 0
mv t6, t36
j L18
L18:
li t37, 0
bne t6, t37, L13
L14:
la t39, L_str_1
mv t5, t39
j L15
L4:
li t40, 1
mv t2, t40
j L6
L1:
la t41, L_str_0
mv t1, t41
j L3
L10:
li t42, 1
mv t4, t42
j L12
L7:
la t43, L_str_0
mv t3, t43
j L9
L16:
li t44, 1
mv t6, t44
j L18
L13:
la t45, L_str_0
mv t5, t45
j L15
L15:
mv t0, t5
mv a0, t0
jal ra, print
mv t46, a0
