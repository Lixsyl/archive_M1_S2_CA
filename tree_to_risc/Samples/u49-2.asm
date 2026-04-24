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
mv t3, t1
mv t3, a0
jal ra, string_of_int
mv t9, a0
mv t2, t9
la t10, L_str_0
mv t0, t10
mv t2, a0
mv t0, a1
jal ra, concat
mv t11, a0
