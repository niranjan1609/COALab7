.data
n: .word 23235

.text

main:
	lw $t0,n
	blt $t0,$zero,end			
	addi $t1,$zero,10
	add $t4,$zero,$zero		

	Function:
		div $t0,$t1             #n/10 and n%10
		mflo $t0                #n=n/10
		mfhi $t3                #digit=n%10
		andi $t4,$t3,1
		beq $t4,0,skip
		move $a0,$t3
		li $v0,1
		syscall
		skip:
		bne $t0,$zero,Function   #if n!=0

	end:
		li $v0,10
		syscall