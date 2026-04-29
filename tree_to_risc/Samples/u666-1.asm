// Routine L1
mv i0, a0
li t4, 0
beq i0, t4, L5
L6:
li t6, 0
mv t2, t6
j L7
L7:
li t7, 0
bne t2, t7, L2
L3:
li t9, 1
sub t10, i0, t9
mv t0, t10
mv a0, t0
jal ra, L1
mv t11, a0
mv t1, t11
j L4
L5:
li t12, 1
mv t2, t12
j L7
L2:
li t13, 1
mv t1, t13
j L4
L4:
mv rv, t1
// Routine main
li t14, 5
mv t3, t14
mv a0, t3
jal ra, L1
