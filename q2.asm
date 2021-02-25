.data
str: .string "Hello World # promt user"
space: .string " "
.text
main:
	la a0, str # address of string
	li a7, 4 # system call to print string
	ecall
	
	li a0, 0
	li a7, 10 # sys call to exit
	ecall
	
