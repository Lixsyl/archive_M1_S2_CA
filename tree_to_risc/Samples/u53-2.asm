// Routine main
li t5, 5
mv t1, t5
L1:
li t7, 53
blt t6, t7, L4
L5:
li t9, 0
mv t2, t9
j L6
L4:
li t10, 1
mv t2, t10
j L6
L6:
li t12, 0
bne t11, t12, L2
L3:
li t14, 0
j Lend
L2:
mv t17, a0
jal string_of_int
mv t16, a0
mv t4, t16
mv t19, a0
jal print
mv t18, a0
li t20, 0
li t21, 2
mul t23, t21, t22
mv t1, t23
L7:
li t26, 53
blt t26, t25, L10
L11:
li t28, 0
mv t3, t28
j L12
L10:
li t29, 1
mv t3, t29
j L12
L12:
li t31, 0
bne t30, t31, L8
L9:
li t33, 0
j L1
L8:
mv t35, a0
jal string_of_int
mv t34, a0
mv t0, t34
mv t37, a0
jal print
mv t36, a0
li t38, 0
li t40, 3
sub t41, t39, t40
mv t1, t41
j L7
Lend:
