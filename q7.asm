# program to find gcd of 2 numbers n1, n2
.data
# n1 and n2 values can be initialized here
n1: .word 24
n2: .word 36
message: .string "GCD = "

.text

main:
	# load n1, n2 into t0, t1
	lw t0, n1
	lw t1, n2
loop:	
	beq t0, t1, loop_end # if t0=t1 then t0 itself is the gcd
	ble t0, t1, else # if t0>t1
	sub t0, t0, t1 # t0 = t0 - t1
	j continue # skip else condition
	else: # else 
	sub t1, t1, t0 # t1 = t1 - t0
	continue: 
	j loop # go into next iteration
loop_end:

	la a0, message 
	li a7, 4 # system call to print string 
	ecall
	addi a0, t0, 0
	li a7, 1 # system call to print int
	ecall
	
	li a7, 10 # system call to exit with code 0
	ecall