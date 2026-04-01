// Routine L1
mv i0, a0
li t5, 1
add t6, t4, t5
mv t1, t6
li t7, 2
mul t9, t7, t8
mv rv, t9
end:
// Routine main
li t10, 3
mv t3, t10
mv t12, a0
jal L1
mv t11, a0
mv t2, t11
mv t14, a0
jal string_of_int
mv t13, a0
mv t0, t13
mv t16, a0
jal print
mv t15, a0
li t17, 0
