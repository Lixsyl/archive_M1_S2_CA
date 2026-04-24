// Routine L1
mv i0, a0
li t4, 0
beq i0, t4, L5
L8:
j L6
L5:
li t6, 1
mv t2, t6
j L7
L6:
li t7, 0
mv t2, t7
L7:
li t8, 0
bne t2, t8, L2
L9:
j L3
L2:
li t10, 1
mv t1, t10
j L4
L3:
li t11, 1
sub t12, i0, t11
mv t0, t12
mv t0, a0
jal ra, L1
mv t13, a0
mv t1, t13
L4:
mv rv, t1
end:
// Routine main
li t14, 5
mv t3, t14
mv t3, a0
jal ra, L1
mv t15, a0
