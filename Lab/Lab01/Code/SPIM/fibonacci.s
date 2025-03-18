.data
	input_msg:	.asciiz "Please input a number: "
	output_msg:	.asciiz "The result of fibonacci(n) is "
	newline: 	.asciiz "\n"

.text
.globl main


#------------------------- main -----------------------------

main:
# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, input_msg		# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $a0, $v0      		# store input in $a0 (set arugument of procedure factorial)

# jump to procedure factorial
	jal 	fibonacci
	move 	$t0, $v0			# save return value in t0 (because v0 will be used by system call) 

# print output_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, output_msg		# load address of string into $a0
	syscall                 	# run the syscall

# print the result of procedure factorial on the console interface
	li 		$v0, 1				# call system call: print int
	move 	$a0, $t0			# move value of integer into $a0
	syscall 					# run the syscall

# print a newline at the end
	li		$v0, 4				# call system call: print string
	la		$a0, newline		# load address of string into $a0
	syscall						# run the syscall

# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall


#------------------------- procedure factorial -----------------------------
# load argument n in $a0, return value in $v0. 

.text
fibonacci:
	addi 	$sp, $sp, -12		        # adiust stack for 3 items
    sw      $zero, 8($sp)
	sw 		$ra,   4($sp)			    
	sw 		$a0,   0($sp)			    

    #  Search for f(n-1)
	addi 	$t0, $zero,   1		        # test for n > 1
    slt     $t0, $t0,    $a0
	bne 	$t0, $zero,  first_prev		# if n > 1, find f(n-1)

    slt     $v0, $zero,  $a0            # return  (n > 0)  ~  (n == 1) ?  v0 = 1 : v0 = 0
	addi 	$sp, $sp, 12			    # pop 3 items off stack
    jr      $ra

first_prev:
    addi    $a0, $a0,  -1
    jal     fibonacci
    lw      $t1, 8($sp)
    lw      $ra, 4($sp)
    lw      $a0, 0($sp)

    # update v0  f(n-1) + 0
    add     $v0, $v0, $t1
    sw      $v0, 8($sp)

    # Search for f(n-2)
    jal     second_prev
	addi 	$sp, $sp, 12		    	# pop 2 items off stack
    jr      $ra

second_prev:
    addi    $a0, $a0,  -2
    jal     fibonacci
    lw      $t1, 8($sp)
	lw 		$ra, 4($sp)			        
	lw 		$a0, 0($sp)			        
	addi 	$sp, $sp, 12		        # adjust stack pointer to pop 3 items

    # Update v0 f(n-1) + f(n-2)
    add     $v0, $v0, $t1
	jr 		$ra	




