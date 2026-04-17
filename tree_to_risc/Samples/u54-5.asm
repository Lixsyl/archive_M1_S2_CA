// Routine L1
mv i0, a0
add t5, i0, i0
mv rv, t5
end:
// Routine L2
mv i0, a0
mv i0, a0
mv i0, a1
jal concat
mv t6, a0
mv rv, t6
