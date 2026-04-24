// Routine main
li t5, 5
mv t1, t5
j L1
L1:
li t6, 53
blt t1, t6, L4
L5:
li t8, 0
mv t2, t8
j L6
L6:
li t9, 0
beq t2, t9, L3
L2:
mv t1, a0
jal ra, string_of_int
mv t11, a0
mv t4, t11
mv t4, a0
jal ra, print
mv t12, a0
li t13, 0
li t14, 2
mul t15, t14, t1
mv t1, t15
j L7
L7:
li t16, 53
blt t16, t1, L10
L11:
li t18, 0
mv t3, t18
j L12
L12:
li t19, 0
bne t3, t19, L8
L9:
li t21, 0
j L1
L4:
li t22, 1
mv t2, t22
j L6
L10:
li t23, 1
mv t3, t23
j L12
L8:
mv t1, a0
jal ra, string_of_int
mv t24, a0
mv t0, t24
mv t0, a0
jal ra, print
mv t25, a0
li t26, 0
li t27, 3
sub t28, t1, t27
mv t1, t28
j L7
L3:
li t29, 0
