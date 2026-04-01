// Routine L1
mv i0, a0
li t1, 2
mul t3, t1, t2
mv rv, t3
end:
// Routine main
li t4, 27
mv t0, t4
mv t6, a0
jal L1
mv t5, a0
