.data
n: .word 154
yes: .asciiz "yes"
no: .asciiz "no"
.text

main:
	lw $t0,n
	move $t7,$t0
	blt $t0,$zero,end			#if n<=0 => end
	addi $t1,$zero,10
	add $t4,$zero,$zero			#the result
	add $t6,$zero,$zero

	Function:
		div $t0,$t1             #n/10 and n%10
		mflo $t0                #n=n/10
		mfhi $t3                #digit=n%10
		mul $t5,$t3,$t3
		mul $t5,$t5,$t3
		add $t6,$t5,$t6
		bne $t0,$zero,Function   #if n!=0

	end:
		li $v0,1
		move $a0,$t7
		syscall

		li $v0,4
		beq $t6,$t7,skip
		la $a0,no
		syscall
		j skip2
		skip:
		la $a0,yes
		syscall
		skip2:
		li $v0,10
		syscall