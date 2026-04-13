// Routine L1
mv i0, a0
li t4, 2
mul t6, t4, t5
mv rv, t6
end:
// Routine L2
mv i0, a0
mv t8, a0
jal L1
mv t7, a0
mv t0, t7
mv t10, a0
jal L1
mv t9, a0
mv rv, t9
