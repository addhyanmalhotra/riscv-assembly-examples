.data
str: .string "Enter the value of n :" # promt user
space: .string " "
.text
main:
	la a0, str # address of string
	li a7, 4 # system call to print string
	ecall
	
	li a7, 5 # sys call to read int, value gets saved into a0
	ecall
	
	li t0, 0 	# prev=0
	li t1, 1 	# cur=1
	li t2, 1 	# next=1
	li t3, 1 	# iterator i
	addi t4, a0, 0 	# store value of n in t4
	FORI:
		bge t3, t4, ENDI
		addi a0, t0, 0
		li a7, 1 # sys call to print int
		ecall
		
		la a0, space # address of blank space
		li a7, 4 # system call to print string
		ecall
		
		add t2, t0, t1 		# next = prev + cur
		add t0, x0, t1 		# prev = cur 
		add t1, x0, t2 		# cur = next
		addi t3, t3, 1 		# i++
		j FORI
	ENDI:
	addi a0, t0, 0
	li a7, 1 # sys call to print int
	ecall
	li a7, 10 # sys call to exit
	ecall
	
