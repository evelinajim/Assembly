	.data 
msg1: .asciiz "\nEnter the first integer : " 
msg2: .asciiz "\nEnter the second integer : " 
msg3: .asciiz "\nEnter an operator: "
addresult: .asciiz "\nThe semantics of the operator + is addition : " 
subresult: .asciiz "\nThe semantics of the operator - is subtraction : " 
multresult: .asciiz "\nThe semantics of the operator * is multiplication  : " 
divresult: .asciiz "\nThe semantics of the operator / is division (quotient) : " 
remresult: .asciiz "\nThe semantics of the operator % is modulus (remainder) : " 
result: .asciiz "\nFinal result is : " 
error: .asciiz "\nError - Invalid operator!! : " 
error2: .asciiz "\nError - Division/Modulus by zero is not allowed " 
continue: .asciiz "\nContinue? (Y/N) " 
.text

again :
	#prints out first message and prompts for number
	li 	$v0, 4		#prints string
	la 	$a0, msg1 	#loads string to print
	syscall			#executes the command

	#asks for user input
	li 	$v0,5
	syscall 	
	move 	$s0,$v0		#moves number read from the user input to a saved value
	
	#prints out second message 
	li 	$v0, 4
	la 	$a0, msg2 
	syscall
	
	#asks for user to input second postive number
	li 	$v0,5
	syscall 
	move 	$s1,$v0		#moves second number from v0 to s1
	
	#prompts for operation
	li 	$v0, 4
	la 	$a0, msg3 
	syscall

	# reads operation
	li 	$v0, 12
	syscall

	bne 	$v0,'+',subtraction
	add 	$s2,$s0,$s1
	syscall
	
	# Print string for addition
	li	$v0, 4
	la	$a0, addresult
	syscall
	
	
	j 	skipAll 
subtraction:

	bne 	$v0,'-',multiplication
	sub 	$s2,$s0,$s1
	
	# Print string for subtraction
	li	$v0, 4
	la	$a0, subresult
	syscall
	
	j skipAll
multiplication:
	
	bne 	$v0,'*',division
	mul 	$s2,$s0,$s1
	
	# Print string for multiplication
	li	$v0, 4
	la	$a0, multresult
	syscall
	
	j skipAll
division:
	beq 	$v0,'/',div2
	
div2:
	beq	$s1,0,error0
	
	j div3
	
div3:
	bne 	$v0,'/',modulus
	div 	$s2,$s0,$s1
	# Print string for division
	li	$v0, 4
	la	$a0, divresult
	syscall
	
	j skipAll
modulus:
	beq 	$v0,'%',mod2
	
mod2:
	beq	$s1,0,error0
	
	j mod3
	
mod3:
	bne 	$v0,'%',invalid
	rem 	$s2,$s0,$s1
	# Print string for modulus
	li	$v0, 4
	la	$a0, remresult
	syscall
	
	j skipAll

error0: 
	li	$v0, 4
	la	$a0, error2
	syscall

	j continue1

invalid:
	# Print string msg3
	li	$v0, 4
	la	$a0, error
	syscall
	
	j continue1

	
skipAll :
	#show the results
	li 	$v0, 4
	la 	$a0, result
	syscall
	
	#prints out the results of all computations
	li 	$v0, 1 
	move 	$a0,$s2
	syscall
	
	j continue1
	
continue1 :	
	#prompts the continue question which loops back to the beginning
	li 	$v0, 4
	la 	$a0, continue
	syscall
	
	#user input for character yes or no
	li 	$v0, 12 
	syscall

	beq $v0,'Y',again 
	beq $v0,'y',again