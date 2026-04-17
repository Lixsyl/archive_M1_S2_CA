// Routine main
li t5, 5
mv t1, t5
L1:
li t6, 53
blt t1, t6, L4
L5:
li t8, 0
mv t2, t8
j L6
L4:
li t9, 1
mv t2, t9
j L6
L6:
li t10, 0
bne t11, t2, t10
beq t11, x0, L2
L3:
li t12, 0
j Lend
L2:
mv a0, t1
jal ra, string_of_int
mv t13, a0
mv t4, t13
mv a0, t4
jal ra, print
mv t14, a0
li t15, 0
li t16, 2
mul t17, t16, t1
mv t1, t17
L7:
li t18, 53
blt t18, t1, L10
L11:
li t20, 0
mv t3, t20
j L12
L10:
li t21, 1
mv t3, t21
j L12
L12:
li t22, 0
bne t23, t3, t22
beq t23, x0, L8
L9:
li t24, 0
j L1
L8:
mv a0, t1
jal ra, string_of_int
mv t25, a0
mv t0, t25
mv a0, t0
jal ra, print
mv t26, a0
li t27, 0
li t28, 3
sub t29, t1, t28
mv t1, t29
j L7
Lend:
