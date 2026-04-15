// Routine main
li t0, 0
li t2, 0
bne t0, t2, L1
L2:
li t4, 0
mv t1, t4
j L3
L1:
li t5, 0
li t6, 0
bne t5, t6, L4
L5:
li t8, 1
mv t1, t8
j L3
L4:
li t9, 0
mv t1, t9
j L3
L3:
