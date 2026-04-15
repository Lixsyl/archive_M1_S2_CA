// Routine main
li t2, 20
li t3, 1
add t4, t2, t3
mv t1, t4
mv t6, a0
jal string_of_int
mv t5, a0
mv t0, t5
mv t8, a0
jal print
mv t7, a0
li t9, 0
