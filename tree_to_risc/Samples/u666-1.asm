// Routine L1
mv i0, a0
li t4, 0
beq t5, i0, t4
bne t5, x0, L5
L6:
li t6, 0
mv t2, t6
j L7
L5:
li t7, 1
mv t2, t7
j L7
L7:
li t8, 0
bne t9, t2, t8
beq t9, x0, L2
L3:
li t10, 1
sub t11, i0, t10
mv t0, t11
mv t0, a0
jal ra, L1
mv t12, a0
mv t1, t12
j L4
L2:
li t13, 1
mv t1, t13
j L4
L4:
mv rv, t1
end:
// Routine main
li t14, 5
mv t3, t14
mv t3, a0
jal ra, L1
mv t15, a0
