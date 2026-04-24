// Routine main
li t5, 5
mv t1, t5
L1:
li t6, 53
blt t1, t6, L4
L13:
j L5
L4:
li t8, 1
mv t2, t8
j L6
L5:
li t9, 0
mv t2, t9
L6:
li t10, 0
bne t2, t10, L2
L14:
j L3
L2:
mv t1, a0
jal ra, string_of_int
mv t12, a0
mv t4, t12
mv t4, a0
jal ra, print
mv t13, a0
li t14, 0
li t15, 2
mul t16, t15, t1
mv t1, t16
L7:
li t17, 53
blt t17, t1, L10
L15:
j L11
L10:
li t19, 1
mv t3, t19
j L12
L11:
li t20, 0
mv t3, t20
L12:
li t21, 0
bne t3, t21, L8
L16:
j L9
L8:
mv t1, a0
jal ra, string_of_int
mv t23, a0
mv t0, t23
mv t0, a0
jal ra, print
mv t24, a0
li t25, 0
li t26, 3
sub t27, t1, t26
mv t1, t27
j L7
L9:
li t28, 0
j L1
L3:
li t29, 0
