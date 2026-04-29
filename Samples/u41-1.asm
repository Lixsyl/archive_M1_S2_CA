// Routine main
li t2, 20
li t3, 1
add t4, t2, t3
mv t1, t4
mv a0, t1
jal ra, string_of_int
mv t5, a0
mv t0, t5
mv a0, t0
jal ra, print
mv t6, a0
