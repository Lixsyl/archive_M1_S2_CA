// Routine main
li t0, 0
li t2, 1
li t3, 0
bne t4, t2, t3
beq t4, x0, L1
L2:
li t5, 0
mv t1, t5
j L3
L1:
li t6, 0
li t7, 0
bne t8, t6, t7
beq t8, x0, L4
L5:
li t9, 1
mv t1, t9
j L3
L4:
li t10, 0
mv t1, t10
j L3
L3:
