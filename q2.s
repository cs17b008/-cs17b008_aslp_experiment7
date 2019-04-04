main:
	li $a0,6
	jal fib

	add $t4,$v0,$0
	li $v0,10
	syscall



fib:
	sub $sp,$sp,12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	
	add $s0,$a0,$0
        
	addi $t0,$0,1
	beq $s0,$0,Exit1
	beq $s0,$t0,Exit2

	sub $a0,$a0,1
	jal fib

	add $s1,$0,$v0
	sub $a0,$s0,2
	jal fib

	add $v0,$v0,$s1

fib_end:
        lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,$sp,12
	jr $ra

Exit1:
	li $v0,0
	j fib_end
Exit2: 
	li $v0,1
	j fib_end
