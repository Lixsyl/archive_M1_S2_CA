// Routine main
li t0, 0
li t2, 0
bne t0, t2, L1
L6:
j L2
L1:
li t4, 0
li t5, 0
bne t4, t5, L4
L7:
j L5
L4:
li t7, 0
mv t1, t7
j L3
L5:
li t8, 1
mv t1, t8
j L3
L2:
li t9, 0
mv t1, t9
L3:
