// Routine main
li t0, 0
li t2, 0
bne t3, t0, t2
beq t3, x0, L1
L2:
li t4, 3
li t5, 1
mv t1, t5
j L3
L1:
li t6, 3
li t7, 1
li t8, 0
bne t9, t7, t8
beq t9, x0, L4
L5:
li t10, 1
mv t1, t10
j L3
L4:
li t11, 0
mv t1, t11
j L3
L3:
