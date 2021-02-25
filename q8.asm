.data
str:
.string "Enter the value of n : " # message to be printed
output: 
.string "  "
.text
.align 2
.globl multiply_proc, str

main:
	la a0, str # address of string
	li a7, 4 # system call to print string
	ecall
	
	li a7, 5 # sys call to read int, value gets saved into a0
	ecall
	addi s1, a0, 0 # put value of n1 into s0
	
	la a0, str # address of string
	li a7, 4 # system call to print string
	ecall
	
	li a7, 5 # sys call to read int, value gets saved into a0
	ecall
	addi s2, a0, 0 # put value of n2 into s1
	
	jal multiply_proc # call to multiply_proc
	
	add a0, x0, s3 	# load returned value from previous into a0
	
	li a7, 1	#system call to print a0 as integer
	ecall
	
	li a7, 10 # sys call to exit
	ecall
	
	
multiply_proc:
	li s3, 0
	li t6, 0
	start_loop:
		beqz s1, end_loop
		andi t5,s1,1
		beqz t5 if_zero
		add s3, s3, s2
		if_zero:
		srli s1,s1,1
		slli s2, s2, 1
		j start_loop
	end_loop:
	jalr ra