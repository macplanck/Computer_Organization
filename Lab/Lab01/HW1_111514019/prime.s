# =================================================
#   Register Usage:
#   	s0: n
#		s1: i
# =================================================

.data
	input_msg:	    .asciiz "Please input a number: "
	true_msg:    	.asciiz "It's a prime\n"
	false_msg:   	.asciiz "It's not a prime\n"
	newline: 	    .asciiz "\n"

.text
.globl main
#============================= main ====================================
main:
# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, input_msg		# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s0, $v0      		# store input in $a0 (set arugument of procedure factorial)

# call function prime
	jal     prime



#============================ procedure prime ==============================

prime:

# if n == 1
	addi    $t0, $s0,   -1
	beq     $t0, $zero, Exit_False

# else
	addi    $s1, $zero,  2
	jal     Loop


Loop:

	# i * i <= n
	mul     $t0, $s1,   $s1
	slt     $t0, $s0,   $t0
	bne     $t0, $zero, Exit_True


# if (n % i == 0)
	div     $t0, $s0,   $s1    # lo: n/i   hi: n%i
	mfhi    $t0                # load value from hi
	beq     $t0, $zero, Exit_False
	addi    $s1, $s1,   1
	jal     Loop


#-------------------------- Exit -------------------------------

Exit_False:						# print false_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, false_msg		# load address of string into $a0
	syscall                 	# run the syscall

	jal     Exit


Exit_True:						# print true_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, true_msg		# load address of string into $a0
	syscall                 	# run the syscall

	jal     Exit


Exit: 							# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall