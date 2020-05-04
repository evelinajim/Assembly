
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
	
	# Math! Addition
	addition:
	add	$t2, $t0, $t1	# A = A + B
	
	
	#OPERATIONS!!!
	beq $t1, '+',addition #check enter charater is '+'
	beq $t1,'-',subtraction #check enter charater is '-'
	beq $t1,'*',multiplication #check enter charater is '*'
	beq $t1,'/',division #check enter charater is '/'
	beq $t1,'%',modulus #check enter charater is '%'
	#OPERATIONS!!!
	
	
j exit
	
	.data 
msg1:	.asciiz	"Enter the 1st integer:   "
msg2:	.asciiz	"Enter the 2nd integer:   "
msg3:	.asciiz	"Enter an operator:  "
addresult:   .asciiz "The semanticsof the operator + is addition: "
subresult:   .asciiz "The semanticsof the operator + is subtraction: "
divresult:   .asciiz "The semanticsof the operator + is division: "
multresult:   .asciiz "The semanticsof the operator + is multiplication: "
modresult:   .asciiz "The semanticsof the operator + is modulus: "
error:	     .asciiz "Error: Invalid operator!"


\n\n + for Addition :\n - for Subtraction :\n * for Multiplication :\n / for Division :\n