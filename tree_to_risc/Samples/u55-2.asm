// Routine L1
mv i0, a0
li t1, 2
mul t3, t1, t2
mv rv, t3
end:
// Routine main
li t4, 52
li t5, 3
add t6, t4, t5
mv t0, t6
mv t8, a0
jal L1
mv t7, a0
