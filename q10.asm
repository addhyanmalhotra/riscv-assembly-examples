.data
ar1: .word 1,2,3,4,5		#INIT ARR1
ar2: .word 16,32,48,64,80	#INIT ARR2
ar3: .word 0,0,0,0,0		#INIT ARR3
str: .ascii "Answer ARR3 can be found at : "
.text
.align 2

main:
	la t0, ar1			#LOAD ADD OF ARR1
	la t1, ar2			#LOAD ADD OF ARR2
	la t2, ar3			#LOAD ADD OF ARR3
	li t3, 5			# t3 = size_of_array = 5
	loop:				# LOOP TO ADD ARRAYS
		lw t4, 0(t0)		# LOAD ARR1[i]
		lw t5, 0(t1)		# LOAD ARR2[i]
		add t4, t5, t4		# t4 = ARR1[i] + ARR2[1]
		sw t4, 0(t2)		# store ARR3[i] = t4
		addi t3, t3, -1		# updaate counter
		addi t0, t0, 4		# &ARR1[i+1]
		addi t1, t1, 4		# &ARR2[i+1]
		addi t2, t2, 4		# &ARR3[i+1]
		blt x0, t3, loop	# loop if counter less than 5
	
	la a0, str			# Load PROMPT
	li a7, 4			# SYS CALL TO PRINT STRING
	ecall				# EXEC SYS CALL
	
	la a0, ar3			# LOAD &ARR3[0]
	li a7, 34			# Print Address to stdio
	ecall				#EXEC SYS CALL
	
	li a7, 10 			# sys call to exit
	ecall				# EXEC CALL
	
