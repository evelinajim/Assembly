.text
.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4 (same as: addi $v0, $zero, 4)
	la	$a0, msg1	# load the address of msg
	syscall
	
	
	# Print \n
	li	$v0, 4		#print string syscall code =4
	la	$a0, newline
	syscall
	
	j exit			#jump to exit
	
	
op4:
	beq	$t1,0, error1 	#if divided by a 0, go to ERROR


#Print msg
	li 	$v0, 4		#print string sys call code =4
	la	$a0, msg7	#load address of msgs
	
	#print addition: x/y*z
	li	$v0, 1		#print string sys call =1
	move	$a0, $t0	#char to print must be loaded into $a0
	syscall
	
	li	$v0,4		#print strig sys call =4
	la 	$a0, open4	#char to print
	syscall
	
	li 	$v0,1		#print int syyscall code =1
	move 	$a0, $t1	#into to print must be loaded into $a0
	syscall
	
	li	$v0, 4		#print istring code 4
	la	$a0, equal	#char to print
	syscall
	
	
	#Math!
	div	$t0, $t1
	
	
	#Print 1