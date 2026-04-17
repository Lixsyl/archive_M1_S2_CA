// Routine L1
mv i0, a0
li t4, 2
mul t5, t4, i0
mv rv, t5
end:
// Routine L2
mv i0, a0
mv i0, a0
jal L1
mv t6, a0
mv t0, t6
mv t0, a0
jal L1
mv t7, a0
mv rv, t7
