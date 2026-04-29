// Routine L1
mv i0, a0
li t7, 0
beq i0, t7, L5
L6:
li t9, 0
mv t2, t9
j L7
L7:
li t10, 0
bne t2, t10, L2
L3:
li t12, 1
sub t13, i0, t12
mv t3, t13
mv a0, t3
jal ra, L1
mv t14, a0
mv t0, t14
mul t15, i0, t0
mv t1, t15
j L4
L5:
li t16, 1
mv t2, t16
j L7
L2:
li t17, 1
mv t1, t17
j L4
L4:
mv rv, t1
// Routine main
li t18, 5
mv t6, t18
mv a0, t6
jal ra, L1
mv t19, a0
mv t5, t19
mv a0, t5
jal ra, string_of_int
mv t20, a0
mv t4, t20
mv a0, t4
jal ra, print
mv t21, a0
