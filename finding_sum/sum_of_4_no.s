####     Sum of 4 numbers     ####

###      Input by user       ####


.data

input:	.asciiz "enter 4 no.s : "
output:	.asciiz "result : "


.text
main:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 5
	syscall
	move $t1, $v0

	li $v0, 5
	syscall
	move $t2, $v0

	li $v0, 5
	syscall
	move $t3, $v0

	jal sumsub

	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
sumsub: 
	add $t0, $t0, $t1
	add $t2, $t2, $t3
	sub $a0, $t0, $t2
	jr $ra
  
