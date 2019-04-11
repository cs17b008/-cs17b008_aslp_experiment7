.data
	m: .float 0.1
	n: .float 4.0
	p: .float 0.0
	q: .float 1.0
.text

main:
	l.s $f4,n
	l.s $f5,p
	l.s $f6,q

	addi $t1,$0,1
	addi $t2,$0,2
	addi $t3,$0,3
	addi $t4,$0,4
	addi $t5,$0,1
	jal loop

	

	li $v0,10
	syscall
        
loop:
	sub $sp,$sp,8
	sw $ra,0($sp)
	s.s $f0,4($sp)
	
	c.lt.s $f5,$f4
	bc1f Exit
	
	l.s $f0,m
	
	sub.s $f4,$f4,$f6
	
	jal loop
	
        beq $t5,$t1,loop1
	beq $t5,$t2,loop2
	beq $t5,$t3,loop3
	beq $t5,$t4,loop4


Exit:
	lw $ra,0($sp)
	l.s $f0,4($sp)
	addi $sp,$sp,8
	j $ra

loop1:
        li.s $f1,6.67
	mul.s $f7,$f0,$f1
	addi $t5,$t5,1
	j Exit
loop2:
	mul.s $f1,$f7,$f7
	mul.s $f8,$f1,$f7
	add.s $f7,$f1,$f8
	addi $t5,$t5,1
	j Exit
loop3:
	mul.s $f1,$f7,$f7
	mul.s $f1,$f1,$f7
	li.s $f8,2.718
	add.s $f7,$f8,$f1
	addi $t5,$t5,1
	j Exit
loop4:
	mul.s $f1,$f7,$f7
	mul.s $f1,$f1,$f7
	mul.s $f1,$f1,$f7
	li.s $f8,3.14
	add.s $f7,$f8,$f1
	addi $t5,$t5,1
	j Exit
