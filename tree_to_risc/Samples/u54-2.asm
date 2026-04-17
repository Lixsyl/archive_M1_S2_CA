// Routine L1
mv i0, a0
li t1, 2
mul t2, t1, i0
mv rv, t2
end:
// Routine main
li t3, 27
mv t0, t3
mv t0, a0
jal ra, L1
mv t4, a0
