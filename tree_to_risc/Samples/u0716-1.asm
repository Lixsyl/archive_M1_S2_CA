// Routine main
li t0, 0
li t2, 0
bne t0, t2, L1
L6:
j L2
L1:
li t4, 3
li t5, 1
li t6, 0
bne t5, t6, L4
L7:
j L5
L4:
li t8, 0
mv t1, t8
j L3
L5:
li t9, 1
mv t1, t9
j L3
L2:
li t10, 3
li t11, 1
mv t1, t11
L3:
