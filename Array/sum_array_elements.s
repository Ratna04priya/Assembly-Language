# a simple counting for loop and a conditional if-then-else statement
# a simple program that computes the sum of an array of elements

.data
L1:     .word 0x44, 22, 33, 55                  # array for which we will compute the sum

        .text
        .globl main

main:   la		$t0, L1		        # initialize starting address                                   # loads base address of array L1 into $t0
        li		$t1, 4		        # initialize loop count      # $t1 = 4                          # loads the immediate value 4 into $t1
        add		$t2, $t2, $zero		# initialize sum             # $t2 = $t2 + $zero

loop:   lw		$t3, 0($t0)		# load first element
        add		$t2, $t2, $t3		# update sum                # $t2 = $t2 + $t3
        addi	        $t0, $t0, 4		# point to next word        # $t0 = $to + 4    
        addi	        $t1, $t1, -1		# decrement count           # $t1 = $t1 + -1
        bne		$t1, $zero, loop	# check if done             # if $t1 != $zero then loop

        bgt		$t2, $0, then	        # if $t2 > $0 then then     # if the sum > 0, move sum to $s0
        move 	        $s0, $t2		# $s0 = $t2
        j		exit		        # jump to exit

then:   move 	        $s1, $t2		# $s1 = $t2                 # else move sum to $s1              # moves the value in $t2 to the value in $s1
        li		$v0, 1		        # $v0 = 1 
        syscall

exit:   li		$v0, 10		        # $v0 = 10
        syscall
              
        
