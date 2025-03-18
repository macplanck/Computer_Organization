.data
	input_msg_1:	.asciiz "Please enter option (1: add, 2: sub, 3: mul): "
	input_msg_2:	.asciiz "Please enter the first number: "
	input_msg_3:	.asciiz "Please enter the second number: "
	output_msg:	    .asciiz "The calculation result is: "
	newline: 	    .asciiz "\n"

.text
.globl main
#========================= main =============================

main:

#----------------- input option  -----------------------------

# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, input_msg_1	# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s0, $v0      		# store input in $a0 (set arugument of procedure factorial)

#---------------------- input a  -----------------------------

	li      $v0, 4				# call system call: print string
	la      $a0, input_msg_2	# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s1, $v0      		# store input in $a0 (set arugument of procedure factorial)

#---------------------- input b  -----------------------------

	li      $v0, 4				# call system call: print string
	la      $a0, input_msg_3	# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s2, $v0      		


#---------------------- if else  -----------------------------

# if option == 1
	addi    $t0, $s0,   -1
	beq     $t0, $zero, opt1	

# if opttion == 2
	addi    $t0, $s0,   -2
	beq     $t0, $zero, opt2

# else
	jal     opt3


.text
opt1:
	add     $s1, $s1, $s2
	jal     Exit

.text
opt2:
	sub     $s1, $s1, $s2
	jal     Exit

.text
opt3:
	mul     $s1, $s1, $s2
	jal     Exit


#-------------------------- Exit -----------------------------
.text
Exit:
# print output_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, output_msg		# load address of string into $a0
	syscall                 	# run the syscall

# print the result of procedure factorial on the console interface
	li 		$v0, 1				# call system call: print int
	move 	$a0, $s1			# move value of integer into $a0
	syscall 	

# print a newline at the end
	li		$v0, 4				# call system call: print string
	la		$a0, newline		# load address of string into $a0
	syscall		

# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall

