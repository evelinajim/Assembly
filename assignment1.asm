
### Sample Execution 1: ###
##Enter the 1st integer: 5
#Enter the 2nd integer: 2
#Enter an operator: +The semanticsof the operator + is addition:5+2 = 7
.text
.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4 (same as: addi $v0, $zero, 4)
	la	$a0, msg1	# load the address of msg
	syscall

	# Get input A from user and save
	li	$v0,5		# read_int syscall code = 5 (same as: addi $v0, $zero, 5)
	syscall	
	move	$t0,$v0		# syscall results returned in $v0: move $v0 to $t0 (A)

	# Print string msg2
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg2	# load the address of msg2
	syscall

	# Get input B from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t1,$v0		# syscall results returned in $v0: move $v0 to $t1 (B)
	
	#OPERATIONS!!!
	beq $t1, '+',addition #check enter charater is '+'
	beq $t1,'-',subtraction #check enter charater is '-'
	beq $t1,'*',multiplication #check enter charater is '*'
	beq $t1,'/',division #check enter charater is '/'
	#OPERATIONS!!!


	# Math! Addition
	addition:
	add	$t0, $t0, $t1	# A = A + B
	
	# Subtraction
	subtraction:
	sub	$t0, $t0, $t1	# A = A - B
	
	# Multiplication
	multiplication:
	mul 	$t0,$t0,$t1	# A = A * B
	
	# Division
	division:
	div 	$t0,$t0,$t1	# A = A / B
	

	# Print string msg3
	li	$v0, 4
	la	$a0, msg3
	syscall

	# Print sum
	li	$v0,1		# print_int syscall code = 1
	move	$a0, $t0	# int to print must be loaded into $a0
	syscall

	# Print \n
	li	$v0,4		# print_string syscall code = 4
	la	$a0, newline
	syscall

	# Exit
	li	$v0,10		# exit call
	syscall

### Sample Execution 2: ###
#Enter the 1st integer: 5
#Enter the 2nd integer: 2
#Enter an operator: /The semanticsof the operator / is division (quotient):5/2 = 2
### Sample Execution 3: ###
#Enter the 1st integer: 5
#Enter the 2nd integer: 2
#Enter an operator: %The semanticsof the operator % is modulus (remainder):5/2 = 1
### Sample Execution 4: ###
#Enter the 1st integer: 5
#Enter the 2nd integer: 2
#Enter an operator: &Error -Invalid operator!!
### Sample Execution 5: ###
#Enter the 1st integer: 5
#Enter the 2ndinteger: 0
#Enter an operator: /Error –Division/Modulusby zero is not allowed.

	 
msg1:	.asciiz	"Enter the 1st integer:   "
msg2:	.asciiz	"Enter the 2nd integer:   "
msg3:	.asciiz	"Enter an operator:  "
newline:   .asciiz "The semanticsof the operator + is addition: "
