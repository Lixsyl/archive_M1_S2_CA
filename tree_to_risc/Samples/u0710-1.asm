// Routine main
li t0, 0
li t3, 0
bne t0, t3, L1
L7:
j L2
L1:
li t5, 1
mv t1, t5
j L3
L2:
li t6, 710
li t7, 1
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
