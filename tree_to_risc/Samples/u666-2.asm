// Routine L1
mv i0, a0
li t5, 0
beq i0, t5, L5
L8:
j L6
L5:
li t7, 1
mv t2, t7
j L7
L6:
li t8, 0
mv t2, t8
L7:
li t9, 0
bne t2, t9, L2
L9:
j L3
L2:
li t11, 1
mv t1, t11
j L4
L3:
li t12, 1
sub t13, i0, t12
mv t3, t13
mv t3, a0
jal ra, L1
mv t14, a0
mv t0, t14
mul t15, i0, t0
mv t1, t15
L4:
mv rv, t1
end:
// Routine main
li t16, 5
mv t4, t16
mv t4, a0
jal ra, L1
mv t17, a0
