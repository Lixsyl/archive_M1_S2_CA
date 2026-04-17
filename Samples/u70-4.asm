// Routine main
li t0, 1
li t4, 1
beq t5, t0, t4
bne t5, x0, L7
L8:
li t6, 0
mv t3, t6
j L9
L7:
li t7, 1
mv t3, t7
j L9
L9:
li t8, 0
bne t9, t3, t8
beq t9, x0, L4
L5:
li t10, 0
mv t2, t10
j L6
L4:
li t11, 1
mv t2, t11
j L6
L6:
li t12, 0
bne t13, t2, t12
beq t13, x0, L1
L2:
li t14, 4
mv t1, t14
j L3
L1:
li t15, 3
mv t1, t15
j L3
L3:
