// Routine main
li t0, 717
li t2, 1
li t3, 0
bne t2, t3, L1
L2:
li t5, 0
mv t1, t5
L1:
li t6, 0
li t7, 0
bne t6, t7, L4
L5:
li t9, 1
mv t1, t9
j L3
L4:
li t10, 0
mv t1, t10
j L3
L3:
