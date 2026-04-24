// Routine L1
mv i0, a0
li t7, 0
beq i0, t7, L5
L8:
j L6
L5:
li t9, 1
mv t2, t9
j L7
L6:
li t10, 0
mv t2, t10
L7:
li t11, 0
bne t2, t11, L2
L9:
j L3
L2:
li t13, 1
mv t1, t13
j L4
L3:
li t14, 1
sub t15, i0, t14
mv t3, t15
mv t3, a0
jal ra, L1
mv t16, a0
mv t0, t16
mul t17, i0, t0
mv t1, t17
L4:
mv rv, t1
end:
// Routine main
li t18, 5
mv t6, t18
mv t6, a0
jal ra, L1
mv t19, a0
mv t5, t19
mv t5, a0
jal ra, string_of_int
mv t20, a0
mv t4, t20
mv t4, a0
jal ra, print
mv t21, a0
li t22, 0
