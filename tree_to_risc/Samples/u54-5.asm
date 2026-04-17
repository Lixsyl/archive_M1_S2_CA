// Routine L1
mv a0, i0
add t5, i0, i0
mv rv, t5
end:
// Routine L2
mv a0, i0
mv a0, i0
mv a1, i0
jal ra, concat
mv t6, a0
mv rv, t6
