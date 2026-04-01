// Routine main
la t3, L_str_0
mv t2, t3
li t4, 2
mv t1, t4
mv t6, a0
jal string_of_int
mv t5, a0
mv t0, t5
mv t8, a0
mv t9, a1
jal concat
mv t7, a0
