// Routine main
li t0, 50
mv t1, t0
L1:
li t3, 52
blt t1, t3, L4
L5:
li t5, 0
mv t2, t5
j L6
L4:
li t6, 1
mv t2, t6
j L6
L6:
li t7, 0
bne t8, t2, t7
beq t8, x0, L2
L3:
li t9, 0
j Lend
L2:
li t10, 1
add t11, t1, t10
mv t1, t11
j L1
Lend:
