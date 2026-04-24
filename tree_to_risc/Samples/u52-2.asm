// Routine main
li t0, 50
mv t1, t0
L1:
li t3, 52
blt t1, t3, L4
L7:
j L5
L4:
li t5, 1
mv t2, t5
j L6
L5:
li t6, 0
mv t2, t6
L6:
li t7, 0
bne t2, t7, L2
L8:
j L3
L2:
li t9, 1
add t10, t1, t9
mv t1, t10
j L1
L3:
li t11, 0
