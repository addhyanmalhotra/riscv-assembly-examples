.data
num:
	.half 10

.text
main:
	li t0, 0 # value of sum
	li t1, 1 # value of looping variable
	la t2, num
	lh t3, (t2)
	loop_start:
		bge t1, t3, loop_end
		add t0, t0, t1
		addi t1, t1, 1
		j loop_start
	loop_end:
	addi a0, t0, 0
	li a7, 1
	ecall
	li a7, 10
	ecall
	
		