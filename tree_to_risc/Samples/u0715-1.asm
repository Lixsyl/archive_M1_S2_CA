// Routine main
li t0, 0
li t2, 1
li t3, 0
bne t2, t3, L1
L6:
j L2
L1:
li t5, 0
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
li t10, 0
mv t1, t10
L3:
