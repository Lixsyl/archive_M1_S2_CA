// Routine main
li t4, 1
li t5, 0
bge t4, t5, L1
L2:
li t7, 0
mv t1, t7
j L3
L1:
li t8, 1
mv t1, t8
j L3
L3:
mv t3, t9
mv t11, a0
jal string_of_int
mv t10, a0
mv t2, t10
la t12, L_str_0
mv t0, t12
mv t14, a0
mv t15, a1
jal concat
mv t13, a0
