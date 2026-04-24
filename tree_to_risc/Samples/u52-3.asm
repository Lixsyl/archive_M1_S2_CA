// Routine main
li t4, 5
mv t1, t4
L1:
li t5, 42
blt t1, t5, L4
L7:
j L5
L4:
li t7, 1
mv t2, t7
j L6
L5:
li t8, 0
mv t2, t8
L6:
li t9, 0
bne t2, t9, L2
L8:
j L3
L2:
li t11, 1
add t12, t1, t11
mv t1, t12
j L1
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
