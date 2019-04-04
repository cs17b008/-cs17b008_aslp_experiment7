.data
	k: .word 10
	l: .word 10
	m: .word 2
	n: .word 10
	r: .word 0 
.text

main:
	lw $t0,k
	lw $a0,l
	lw $a1,m
	lw $t3,n
	jal multiply
	div $v1,$t3
	mflo $s1
	add $s2,$t0,$s1
	sw $s2,r
	li $v0,10
	syscall
multiply:
	mult $a0,$a1
	mflo $v1
	jr $ra
	
