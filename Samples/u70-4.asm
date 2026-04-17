// Routine main
li t0, 1
li t3, 1
li t4, 0
li t5, 0
bne t6, t4, t5
beq t6, x0, L4
L5:
li t7, 0
mv t2, t7
j L6
L4:
li t8, 1
mv t2, t8
j L6
L6:
li t9, 0
bne t10, t2, t9
beq t10, x0, L1
L2:
li t11, 4
mv t1, t11
j L3
L1:
li t12, 3
mv t1, t12
j L3
L3:
