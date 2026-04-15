// Routine L1
mv i0, a0
li t3, 2
mul t5, t3, t4
mv rv, t5
end:
// Routine main
li t6, 27
mv t2, t6
mv t8, a0
jal L1
mv t7, a0
mv t1, t7
mv t10, a0
jal string_of_int
mv t9, a0
mv t0, t9
mv t12, a0
jal print
mv t11, a0
li t13, 0
