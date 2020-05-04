
# MIPS if-else- statement example


# Enter integer #1		
li	$v0,5		# read 1st int syscall $v0 code = 5
syscall	
move	$t0,$v0		# save/copy the 1st integer from $v0 to $t0

# Enter integer #2	
li	$v0,5		# read 2st int syscall $v0 code = 5
syscall	
move	$t1,$v0		# save/copy the 2st integer from $v0 to $t1

# Enter/read an operator
li   	$v0, 12       	# read char (operator) syscall code $v0 = 12
syscall            	
move 	$t2, $v0	# save/copy the operator from $v0 to $t2		
			
#check enter charater is '/'


j exit

# label op1: to perform addition
op1:
add	$t2, $t0, $t1	# now $t2=$t0+$t1 


