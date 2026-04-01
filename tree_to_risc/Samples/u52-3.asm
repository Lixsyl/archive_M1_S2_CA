// Routine main
li t4, 5
mv t1, t4
L1:
li t6, 42
blt t5, t6, L4
L5:
li t8, 0
mv t2, t8
j L6
L4:
li t9, 1
mv t2, t9
j L6
L6:
li t11, 0
bne t10, t11, L2
L3:
li t13, 0
mv t3, t14
mv t16, a0
jal string_of_int
mv t15, a0
mv t0, t15
mv t18, a0
jal print
mv t17, a0
li t19, 0
j Lend
L2:
li t21, 1
add t22, t20, t21
mv t1, t22
j L1
Lend:
