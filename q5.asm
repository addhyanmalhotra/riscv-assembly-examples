# program to 
.data
.align 2
.globl print_int, str
message: .string "Enter a 2 digit integer\n"
str: .string ""
.text
main:
	la a0, message
	li a7, 4 # system call to print 
	ecall
	
	li a7, 5 # sys call to read an int
	ecall
	
	jal print_int # go to function print_int, parameter passed in a0
	
	li a7, 4 # sys call to print string whose address is in a0
	ecall
	
	li a7, 10 # sys call to exit
	ecall
	
print_int:
	
	li t0, 10
	div t1, a0, t0 # t1 = a0/10 => first digit 
	mul t2, t1, t0 # t2 = first digit*10
	sub t2, a0, t2 # t2 = second digit
	
	addi t2, t2, 48 # convert to ascii
	addi t1, t1, 48 
	
	la a0, str
	sb t1, 0(a0)
	sb t2, 1(a0)
	
	
	jalr ra
	
	
