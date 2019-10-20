.data
n: .word 1234
space: .asciiz " "
.text
.globl main
main:	la $t0,n
	lw $t1,($t0)
	li $t2,10
	li $t3,0

loop:	div $t1,$t2
	mflo $t1
	mfhi $t4
	move $t5,$t4
	andi $t4,$t4,1
	beq $t4,1,skip
	mul $t5,$t5,$t5
	add $t3,$t3,$t5
skip:	bgt $t1,0,loop
	move $a0,$t3
	li $v0,1
	syscall 
	li $v0,10
	syscall
