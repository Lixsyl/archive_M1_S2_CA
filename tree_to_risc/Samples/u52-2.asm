// Routine main
li t0, 50
mv t1, t0
j L1
L1:
li t3, 52
blt t1, t3, L4
L5:
li t5, 0
mv t2, t5
j L6
L6:
li t6, 0
beq t2, t6, L3
L2:
li t8, 1
add t9, t1, t8
mv t1, t9
j L1
L4:
li t10, 1
mv t2, t10
j L6
L3:
