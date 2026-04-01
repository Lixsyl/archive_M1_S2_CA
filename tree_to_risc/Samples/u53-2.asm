// Routine main
li t7, 5
mv t1, t7
L1:
li t9, 53
blt t8, t9, L4
L5:
li t11, 0
mv t2, t11
j L6
L4:
li t12, 1
mv t2, t12
j L6
L6:
li t14, 0
bne t13, t14, L2
L3:
li t16, 0
j Lend
L2:
mv t6, t18
mv t20, a0
jal string_of_int
mv t19, a0
mv t5, t19
mv t22, a0
jal print
mv t21, a0
li t23, 0
li t24, 2
mul t26, t24, t25
mv t1, t26
L7:
li t29, 53
blt t29, t28, L10
L11:
li t31, 0
mv t3, t31
j L12
L10:
li t32, 1
mv t3, t32
j L12
L12:
li t34, 0
bne t33, t34, L8
L9:
li t36, 0
j L1
L8:
mv t4, t37
mv t39, a0
jal string_of_int
mv t38, a0
mv t0, t38
mv t41, a0
jal print
mv t40, a0
li t42, 0
li t44, 3
sub t45, t43, t44
mv t1, t45
j L7
Lend:
