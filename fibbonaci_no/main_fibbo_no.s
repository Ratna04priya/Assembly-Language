######################
#                    #
# 😁 Fibbonaci  😁  #
#        Number      #
#                    #
######################
.data
input: .asciiz "Enter the number find it's fibbonaci\n"         # taking input
output: .asciiz "The Fibonacci value is:\n"                      #  output
message: .asciiz "The Fibonacci value is:\n0"                    # message

.text
main:

	li $v0, 4                                                 # displaying input
	la $a0, input
	syscall


	li $v0, 5                                                 # scanning input
	syscall

	beq $v0, 0, L1                                            # equal to zero condition


	move $a0, $v0    
	jal fibbo                                                 # function call
	move $a1, $v0 


	li $v0, 4
	la $a0, output                                           # displaying output
	syscall


	li $v0, 1
	move $a0, $a1
	syscall


	li $v0, 10
	syscall                                                 # exit




fibbo:

	addi $sp, $sp, -12                                   # using stack pushing down the register and values
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0, $a0
	li $v0, 1                                            # Giving the termional condition
	ble $s0, 0x2, fibboExit                             # branch if s0 is less thsn equal to address previously 1 then exit
	addi $a0, $s0, -1                                   # calling for (n-1)
	jal fibbo
	move $s1, $v0                                       # storing (n-1) value
	addi $a0, $s0, -2                                   # calling (n-2)
	jal fibbo
	add $v0, $s1, $v0                                  # adding (n-1) and (n-2)
fibboExit:

	lw $ra, 8($sp)                                     # poping elements
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $sp, $sp, 12
	jr $ra


L1:
	li $v0, 4                                             # equal to condition (n=0)
	la $a0, message
	syscall




