// Routine main
li t10, 1
li t12, 0
blt t12, t10, L4
L5:
li t14, 0
mv t2, t14
j L6
L4:
li t15, 1
mv t2, t15
j L6
L6:
li t16, 0
bne t2, t16, L1
L2:
la t18, L_str_1
mv t1, t18
j L3
L1:
la t19, L_str_0
mv t1, t19
j L3
L3:
mv t8, t1
mv t8, a0
jal ra, print
mv t20, a0
li t21, 0
li t22, 1
mv t11, t22
mv t11, a0
jal ra, float_of_int
fmv.d f23, fa0
fmv.d f10, f23
la t24, L_float_0
flw f25, 0(t24)
flt.s t26, f10, f25
beq t26, x0, L10
L11:
li t27, 0
mv t4, t27
j L12
L10:
li t28, 1
mv t4, t28
j L12
L12:
li t29, 0
bne t4, t29, L7
L8:
la t31, L_str_1
mv t3, t31
j L9
L7:
la t32, L_str_0
mv t3, t32
j L9
L9:
mv t9, t3
mv t9, a0
jal ra, print
mv t33, a0
li t34, 0
li t35, 0
mv t7, t35
mv t7, a0
jal ra, float_of_int
fmv.d f36, fa0
fmv.d f1, f36
la t37, L_float_1
flw f38, 0(t37)
flt.s t39, f38, f1
beq t39, x0, L16
L17:
li t40, 0
mv t6, t40
j L18
L16:
li t41, 1
mv t6, t41
j L18
L18:
li t42, 0
bne t6, t42, L13
L14:
la t44, L_str_1
mv t5, t44
j L15
L13:
la t45, L_str_0
mv t5, t45
j L15
L15:
mv t0, t5
mv t0, a0
jal ra, print
mv t46, a0
li t47, 0
