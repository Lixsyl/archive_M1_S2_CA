// Routine main
li t0, 711
li t3, 1
li t4, 0
bne t3, t4, L1
L7:
j L2
L1:
li t6, 1
mv t1, t6
j L3
L2:
li t7, 0
li t8, 0
bne t7, t8, L4
L8:
j L5
L4:
li t10, 1
mv t2, t10
j L6
L5:
li t11, 2
li t12, 1
mv t2, t12
L6:
mv t1, t2
L3:
