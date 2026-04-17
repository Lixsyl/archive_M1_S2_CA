// Routine L1
mv i0, a0
li t3, 2
mul t4, t3, i0
mv rv, t4
end:
// Routine main
li t5, 27
mv t2, t5
mv t2, a0
jal L1
mv t6, a0
mv t1, t6
mv t1, a0
jal string_of_int
mv t7, a0
mv t0, t7
mv t0, a0
jal print
mv t8, a0
li t9, 0
