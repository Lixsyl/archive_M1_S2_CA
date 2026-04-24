// Routine main
li t0, 1
li t4, 1
beq t0, t4, L7
L10:
j L8
L7:
li t6, 1
mv t3, t6
j L9
L8:
li t7, 0
mv t3, t7
L9:
li t8, 0
bne t3, t8, L4
L11:
j L5
L4:
li t10, 1
mv t2, t10
j L6
L5:
li t11, 0
mv t2, t11
L6:
li t12, 0
bne t2, t12, L1
L12:
j L2
L1:
li t14, 3
mv t1, t14
j L3
L2:
li t15, 4
mv t1, t15
L3:
