.data
 n: .word 3
 r: .word 0

.text
main:
	lw $a0,n
	jal fact
	
	sw $v0,r	
	li $v0,1
	lw $a0,r
	syscall
     
        li $v0,10
	syscall
          

fact:
	subu $sp,$sp,8
	sw $ra,0($sp)
	sw $s0,4($sp)
	li $v0,1

       	beq $a0,$0,end
	
	addi $s0,$a0,0
	subu $a0,$a0,1
	jal fact
	
	mult $v0,$s0
	mflo $v0


end:
	lw $ra,0($sp)
	lw $s0,4($sp)
	addi $sp,$sp,8
	jr $ra
