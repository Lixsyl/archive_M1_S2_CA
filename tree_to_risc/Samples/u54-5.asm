// Routine L1
mv i0, a0
add t9, t7, t8
mv rv, t9
end:
// Routine L2
mv i0, a0
mv t1, t10
mv t0, t11
mv t13, a0
mv t14, a1
jal concat
mv t12, a0
mv rv, t12
