// Routine L1
mv i0, a0
add t7, t5, t6
mv rv, t7
end:
// Routine L2
mv i0, a0
mv t9, a0
mv t10, a1
jal concat
mv t8, a0
mv rv, t8
