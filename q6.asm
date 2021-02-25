.data
str:
.string "Enter the value of n : " # message to be printed
output: 
.string "  "
.text
.align 2
.globl print_int, str

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
	jal print_int
	li a7, 10 # sys call to exit
	ecall
	

	
print_int:
	
	li t0, 10
	div t1, a0, t0 # t1 = a0/10 => first digit 
	mul t2, t1, t0 # t2 = first digit*10
	sub t2, a0, t2 # t2 = second digit
	
	addi t2, t2, 48 # convert to ascii
	addi t1, t1, 48 
	
	la a0, output
	sb t1, 0(a0)
	sb t2, 1(a0)
	li a7, 4 # sys call to print string whose address is in a0
	ecall
	
	jalr ra
	
	
