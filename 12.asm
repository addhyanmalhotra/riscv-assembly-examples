.data
    prompt: .string "Input a positive integer n: "
    sep: .string " 	"

.text
main:
	la a0, prompt			#prompt user for input
	li a7, 4			#sys call to get user input
	ecall				#exec sys call
			
	li a7, 5			#sys call to read int
	ecall				#exec syscall
	addi t0, a0, 1 			#stor input n
	li t6, 1			# t6=n+1 used to check exit condition
	
	# FOR(INT I=1;I<N;I++)
	LOOP:
		bgt t6, t0, END_LOOP 	#EXIT CONDITION FOR LOOP
		add a0, t6, x0		#STORE VALUE a0 FOR FUNC CALL
		jal FIB_R		#CALL RECURSIVE FUNC TO FIND NTH FIB
		jal print_ans		#PRINT ANSWER	
		addi t6, t6, 1		#INCREMENT COUNTER
		j LOOP			#LOOP TO TOP
	END_LOOP:
	
	# SYSTEM CALL TO EXIT
	li a7, 10	
	ecall

FIB_R:                     
        addi    sp, sp, -32		#allocate space
        sd      ra, 24(sp)		#store return address
        sd      s0, 16(sp)		#store pointer
        addi    s0, sp, 32		#offset pointer
        add     a1, x0, a0		#a1=a0 [n]
        sw      a0, -24(s0)		#store n to memmory
        addi    a2, x0, 3		#used to check exit condition 
        bge     a0, a2, ELSE		# IF CONDITION
IF:					# IF x==1 or x==2
        addi    a0, x0, 1		# return 1
        sw      a0, -20(s0)		
        j       RETURN_FIB_R
ELSE:					# ELSE x>=3
        lw      a0, -24(s0)		# a0 = n
        addi   	a0, a0, -1		# a0=n-1
        jal    	FIB_R			# call fib(n-1)
	sd      a0, -32(s0)		# store fib(n-1) onto memmory
        lw      a1, -24(s0)		# a1=n
        addi   	a1, a1, -2		# a1=n-2
        add     a0, x0, a1		# a0=n-2 [param is passed via a0]
        jal    	FIB_R			# call fib(n-2)
        ld      a1, -32(s0)		# store result
        add     a0, a0, a1		# calculate fib(n) = fib(n-1) +fib(n-2) 
        sw      a0, -20(s0)		# store fib(n) in memmory
RETURN_FIB_R:
        ld      s0, 16(sp)		#update pointer
        ld      ra, 24(sp)		#update return address
        addi    sp, sp, 32		#resest stackpointer
        ret
        
print_ans:				#aux func to print answer
	li a7, 1			#system call to print int a0
	ecall
	la a0, sep			#print blank space to seperate output
	li a7, 4			#stsrem call to print string
	ecall
	ret
	
