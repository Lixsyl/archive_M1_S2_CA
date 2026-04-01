// Routine main
li t3, 12
mv t2, t3
mv t5, a0
jal string_of_int
mv t4, a0
mv t1, t4
la t6, L_str_0
mv t0, t6
mv t8, a0
mv t9, a1
jal concat
mv t7, a0
