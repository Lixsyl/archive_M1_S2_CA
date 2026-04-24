// Routine L1
mv i0, a0
li t5, 0
beq i0, t5, L5
L6:
li t7, 0
mv t2, t7
j L7
L7:
li t8, 0
bne t2, t8, L2
L3:
li t10, 1
sub t11, i0, t10
mv t3, t11
mv t3, a0
jal ra, L1
mv t12, a0
mv t0, t12
mul t13, i0, t0
mv t1, t13
j L4
L5:
li t14, 1
mv t2, t14
j L7
L2:
li t15, 1
mv t1, t15
j L4
L4:
mv rv, t1
end:
// Routine main
li t16, 5
mv t4, t16
mv t4, a0
jal ra, L1
mv t17, a0
