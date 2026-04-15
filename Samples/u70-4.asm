// Routine main
li t0, 1
li t3, 1
li t4, 0
li t5, 0
bne t4, t5, L4
L5:
li t7, 0
mv t2, t7
j L6
L4:
li t8, 1
mv t2, t8
j L6
L6:
li t10, 0
bne t9, t10, L1
L2:
li t12, 4
mv t1, t12
j L3
L1:
li t13, 3
mv t1, t13
j L3
L3:
