// Routine L1
mv a0, i0
li t1, 2
mul t2, t1, i0
mv rv, t2
end:
// Routine main
li t3, 27
mv t0, t3
mv a0, t0
jal ra, L1
mv t4, a0
