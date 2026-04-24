// Routine main
li t4, 5
mv t1, t4
j L1
L1:
li t5, 42
blt t1, t5, L4
L5:
li t7, 0
mv t2, t7
j L6
L6:
li t8, 0
beq t2, t8, L3
L2:
li t10, 1
add t11, t1, t10
mv t1, t11
j L1
L4:
li t12, 1
mv t2, t12
j L6
L3:
li t13, 0
mv t3, t1
mv t3, a0
jal ra, string_of_int
mv t14, a0
mv t0, t14
mv t0, a0
jal ra, print
mv t15, a0
li t16, 0
