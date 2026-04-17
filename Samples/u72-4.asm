// Routine L1
mv i0, a0
mv i1, a1
add t4, i0, i1
mv rv, t4
end:
// Routine main
li t5, 1
li t6, 0
bne t7, t5, t6
beq t7, x0, L2
L3:
li t8, 1
mv t1, t8
j L4
L2:
li t9, 8
mv t1, t9
j L4
L4:
mv t3, t1
li t10, 8
mv t2, t10
mul t11, t2, t2
mv t0, t11
mv t3, a0
mv t0, a1
jal ra, L1
mv t12, a0
