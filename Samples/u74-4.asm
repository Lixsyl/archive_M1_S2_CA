// Routine L1
mv i0, a0
li t8, 74
blt i0, t8, L8
L9:
li t10, 0
mv t2, t10
j L10
L8:
li t11, 1
mv t2, t11
j L10
L10:
li t12, 0
bne t13, t2, t12
beq t13, x0, L5
L6:
mv t1, i0
j L7
L5:
li t14, 2
mul t15, t14, i0
mv t1, t15
j L7
L7:
mv rv, t1
end:
// Routine L2
mv i0, a0
mv i0, a0
jal ra, L4
mv t16, a0
mv t3, t16
mv t3, a0
jal ra, L1
mv t17, a0
mv t0, t17
mv t0, a0
jal ra, L4
mv t18, a0
mv rv, t18
