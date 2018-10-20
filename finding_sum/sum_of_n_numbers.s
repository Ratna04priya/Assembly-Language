
####      SUM OF FIRST N NUMBERS         ###

###      INPUT_BY_USER       ###



.data
input: .asciiz "enter no. : "
output: .asciiz "sum : "

.text
main:
	li $v0, 4
	la $a0, input
	syscall

	li $v0, 5
	syscall

	move $t0, $v0
	li $t1, 1
	li $t2, 0
	add $t0, $t0, 1
	jal suml

	li $v0, 4
	la $a0, output
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 10
	syscall
	

suml:
	beq $t1, $t0, ret
	add $t2, $t2, $t1
	addi $t1, $t1, 1
	j suml
ret:	
	jr $ra




