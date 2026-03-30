// Routine main
li t0, 1
li t4, 1
beq t0, t4, L7
L8:
li t6, 0
mv t3, t6
L7:
li t7, 1
mv t3, t7
j L9
L9:
li t9, 0
bne t8, t9, L4
L5:
li t11, 0
mv t2, t11
L4:
li t12, 1
mv t2, t12
j L6
L6:
li t14, 0
bne t13, t14, L1
L2:
li t16, 4
mv t1, t16
L1:
li t17, 3
mv t1, t17
j L3
L3:
