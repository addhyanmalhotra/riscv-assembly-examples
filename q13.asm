.data
arr: .word 1, 2, 4, 5, 6, 8, 9 
length: .word 7
key: .word 9
space: .asciz " "
message1: .asciz "\nArray: "
message2: .asciz "\nKey to be searched: "
found_message: .asciz "\nFound\n"
not_found_message: .asciz "\nNot found\n"
.text

main:
	la s0, arr # s0 = base address of arr
	lw s1, length # s1 = length of arr
	la a0, message1
	li a7, 4
	ecall
	jal ra, print_array
	la a0, message2
	ecall
	lw a0, key
	li a7, 1
	ecall
	
	lw t0, key
	li t1, 0 # t1 = l = 0
	addi t2, s1, -1 # t2 = h = length-1
	while_loop:
		bgt t1, t2, exit_while
		add t3, t1, t2 # t3 = m = l+h
		srai t3, t3, 1 # m = (l+h)/2
		
		slli t4, t3, 2
		add t4, t4, s0 # t4 = &arr[m]
		lw t4, 0(t4)
		
		beq t4, t0, found_done
		blt t4, t0, inc_lower
		addi t2, t3, -1 # h = m-1
		j while_loop
		inc_lower: addi t1, t3, 1 # l = m+1
		j while_loop
	exit_while:
	la a0, not_found_message
	li a7, 4
	ecall
	j exit
	
	found_done:
	la a0, found_message
	li a7, 4
	ecall
	
	exit:
	li a7, 10
	ecall
	
print_array:
	li t0, 0 # looping variable (i)
	addi t1, s0, 0 
	loop:
	bge t0, s1, exit_loop # when i>=l, exit loop
	
	lw a0, 0(t1)
	li a7, 1 # env call to print an int
	ecall
	
	la a0, space
	li a7, 4
	ecall
	
	addi t0, t0, 1 # i++
	addi t1, t1, 4 # incrementing address to next word (4 bytes)
	j loop # dont change return address
	exit_loop:
	ret # to main 