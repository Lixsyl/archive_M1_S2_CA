// Routine main
li t4, 5
mv t1, t4
L1:
li t5, 42
blt t1, t5, L4
L5:
li t7, 0
mv t2, t7
j L6
L4:
li t8, 1
mv t2, t8
j L6
L6:
li t9, 0
bne t2, t9, L2
L3:
li t11, 0
mv t3, t1
mv t3, a0
jal ra, string_of_int
mv t12, a0
mv t0, t12
mv t0, a0
jal ra, print
mv t13, a0
li t14, 0
j Lend
L2:
li t15, 1
add t16, t1, t15
mv t1, t16
j L1
Lend:
