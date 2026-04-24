// Routine main
li t0, 1
li t4, 1
beq t0, t4, L7
L8:
li t6, 0
mv t3, t6
j L9
L9:
li t7, 0
bne t3, t7, L4
L5:
li t9, 0
mv t2, t9
j L6
L6:
li t10, 0
bne t2, t10, L1
L2:
li t12, 4
mv t1, t12
j L3
L7:
li t13, 1
mv t3, t13
j L9
L4:
li t14, 1
mv t2, t14
j L6
L1:
li t15, 3
mv t1, t15
j L3
L3:
