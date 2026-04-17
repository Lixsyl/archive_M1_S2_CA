// Routine L1
mv a0, i0
li t1, 2
mul t2, t1, i0
mv rv, t2
end:
// Routine main
li t3, 52
li t4, 3
add t5, t3, t4
mv t0, t5
mv a0, t0
jal ra, L1
mv t6, a0
