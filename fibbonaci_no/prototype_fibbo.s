.data
input: .asciiz "Enter the number for fibbonaci\n"
output: .asciiz "The Fibonacci value is:\n"
message: .asciiz "The Fibonacci value is:\n0"

.text
main:

	li $v0, 4
	la $a0, input
	syscall


	li $v0, 5
	syscall

	beq $v0, 0, line1


	move $a0, $v0
	jal fibonacci
	move $a1, $v0 


	li $v0, 4
	la $a0, output
	syscall


	li $v0, 1
	move $a0, $a1
	syscall


	li $v0, 10
	syscall




fibonacci:

	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)
	move $s0, $a0
	li $v0, 1 
	ble $s0, 0x2, fibonacciExit 
	addi $a0, $s0, -1 
	jal fibonacci
	move $s1, $v0 
	addi $a0, $s0, -2 
	jal fibonacci
	add $v0, $s1, $v0 
fibonacciExit:

	lw $ra, 8($sp)
	lw $s0, 4($sp)
	lw $s1, 0($sp)
	addi $sp, $sp, 12
	jr $ra


line1:
	li $v0, 4
	la $a0, message
	syscall

