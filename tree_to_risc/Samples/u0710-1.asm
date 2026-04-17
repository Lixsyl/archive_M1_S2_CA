// Routine main
li t0, 0
li t3, 0
bne t0, t3, L1
L2:
li t5, 710
li t6, 1
li t7, 0
bne t6, t7, L4
L5:
li t9, 2
li t10, 1
mv t2, t10
j L6
L1:
li t11, 1
mv t1, t11
j L3
L4:
li t12, 1
mv t2, t12
j L6
L6:
mv t1, t2
L3:
