# =================================================
#   Register Usage:
#   	s0: op
#		s1: n
#       s2: i
#       s3: l
#       s4: j
#       t5: n-l
#       t6: n+l
# =================================================

.data
	input_msg_1:	.asciiz "Please enter option (1: triangle, 2: inverted triangle): "
	input_msg_2:	.asciiz "Please input a triangle size: "
	star:           .asciiz "*"
	blank:          .asciiz " "
	newline: 	    .asciiz "\n"

.text
.globl main

#============================= main ====================================
main:

# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, input_msg_1	# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s0, $v0      		# store input in $a0 (set arugument of procedure factorial)


# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, input_msg_2	# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s1, $v0      		# store input in $a0 (set arugument of procedure factorial)

# int i = -1
    addi    $s2, $zero, -1


#----------------------- main loop -----------------------------

main_loop:

	addi    $s2, $s2,    1

    # if (i < n)
    slt     $t0, $s2,   $s1
    beq     $t0, $zero  Exit

    # l = i
    move    $s3, $s2

	# j = 0
	move    $s4, $zero

    # if (op == 1)
    addi    $t0, $s0,   -1
    beq     $t0, $zero  Print

    # l = n - i + 1
    sub     $t0, $s1,   $s2
    addi    $s3  $t0,   -1

	jal     Print


Print:
    addi    $s4, $s4,    1
    sub     $t5, $s1,   $s3
    add     $t6, $s1,   $s3
    addi    $t6, $t6,    1

# if (j > n + l + 1)
	slt     $t0, $t6,   $s4
	bne     $t0, $zero, main_loop

# else if (j == n + l + 1)
	beq     $s4, $t6,   print_newline

# else if (j >= n - l)
	slt     $t0, $s4,   $t5
	beq     $t0, $zero, print_star

# else print blank
	li      $v0, 4
	la      $a0, blank
	syscall 

	jal Print


print_star:
	li      $v0, 4
	la      $a0, star
	syscall

	jal Print


print_newline:
	li      $v0, 4
	la      $a0, newline
	syscall

	jal Print


Exit:							# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall