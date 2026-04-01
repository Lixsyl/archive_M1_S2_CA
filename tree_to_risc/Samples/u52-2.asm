// Routine main
li t0, 50
mv t1, t0
L1:
li t4, 52
blt t3, t4, L4
L5:
li t6, 0
mv t2, t6
j L6
L4:
li t7, 1
mv t2, t7
j L6
L6:
li t9, 0
bne t8, t9, L2
L3:
li t11, 0
j Lend
L2:
li t14, 1
add t15, t13, t14
mv t1, t15
j L1
Lend:
