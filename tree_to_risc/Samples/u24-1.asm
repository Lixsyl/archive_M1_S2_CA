// Routine main
li t0, 1
li t2, 0
bne t3, t0, t2
beq t3, x0, L1
L2:
li t4, 2
mv t1, t4
j L3
L1:
li t5, 1
mv t1, t5
j L3
L3:
