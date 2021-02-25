.data
str:

.string "Enter the value of n\n" # message to be printed
.text
main:
	la a0, str # address of string
	li a7, 4 # system call to print string
	ecall
	
	li a7, 5 # sys call to read int, value gets saved into a0
	ecall
	addi t2, a0, 0 # put value of n into t2
	
	li t0, 0 # value of sum
	li t1, 1 # value of looping variable
	loop_start:
		bgt t1, t2, loop_end
		add t0, t0, t1
		addi t1, t1, 1
		j loop_start
	loop_end:
	addi a0, t0, 0
	li a7, 1 # sys call to print int
	ecall
	li a7, 10 # sys call to exit
	ecall
	
