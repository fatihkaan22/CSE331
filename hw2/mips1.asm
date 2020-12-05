.text

main:
	la $t2, arr
	
	# cin >> arraySize
	li $v0, 5
	syscall
	move $t1, $v0
	# cin >> num
	li $v0, 5
	syscall
	move $t4, $v0
	
	# for (int i = 0; i < arraySize; ++i)
	li $t3, 0		#index
L1:	bge $t3,$t1, L1Exit
	# cin >> *arr
	li $v0, 5
	syscall
	move $t0, $v0
	sw $t0, 0($t2)		
	addi $t2, $t2, 4	#arr++
	addi $t3, $t3, 1	#index++
	j L1
	
L1Exit:
	sll $t3 ,$t1 ,2		# set size
	sub $t2, $t2, $t3	# set array to beginning 

	move $a0, $t4
	move $a1, $t2
	move $a2, $t1
	jal checkSumPossibility
	
	beq $v0, 1, res1
	
	li $v0, 4		# print string
	la $a0, notPossible
	syscall
	j exit
	
res1: 	la $a0, possible
	li $v0, 4		# print string
	syscall
	
exit:
	li $v0, 10          # system call to exit program
   	syscall
		

checkSumPossibility:
	# if (num == 0) return 1
	beq $a0, $zero, R1
	# if (num < 0) return 0
	blt $a0, $zero, R0
	# if (size <= 0) return 0
	ble $a2, $zero, R0
	
	# if (num == *arr)
	lw $t0, 0($a1)
	bne $a0, $t0, notInArray
	
	# cout << *arr << ' '
	lw $a0, 0($a1)
	li $v0, 1
	syscall
	la $a0, spaceChar
	li $v0, 4
	syscall
	j R1
	
notInArray:
	
	# save parameters
	addi $sp, $sp, -16
	sw $ra, 12($sp)
	sw $a2, 8($sp)
	sw $a1, 4($sp)
	sw $a0, 0($sp)	

	# if (isSubsetSum(num, arr + 1, size - 1) == 1)
	addi $a1, $a1, 4		# arr + 1
	addi $a2, $a2, -1		# size - 1
	jal checkSumPossibility
	beq $v0, 1, incStackAndR1	# return 1
	
	lw $a2, 8($sp)
	lw $a1, 4($sp)
	lw $a0, 0($sp)

	# else if (isSubsetSum(num - *arr, arr + 1, size - 1) == 1)
	lw $t1, 0($a1)			# *arr
	sub $a0, $a0, $t1		# num - *arr
	addi $a1, $a1, 4		# arr + 1
	addi $a2, $a2, -1		# size - 1
	jal checkSumPossibility
	bne $v0, 1, incStackAndR0	# != 1 return 0
	
	# cout << *arr << ' '
	lw $a1, 4($sp)
	
	lw $a0, 0($a1)
	syscall
	la $a0, spaceChar
	li $v0, 4
	syscall
	j incStackAndR1
		
exitF:	lw $ra, 12($sp)
	addi $sp, $sp, 16
	jr $ra
	
	# return 0
incStackAndR0:
	li $v0, 0
	j exitF
	
	# return 1
incStackAndR1:
	li $v0, 1
	j exitF
	
R0:	li $v0, 0
	jr $ra

R1:	li $v0, 1
	jr $ra


.data
#test1:	.word	41 67 34 0 69 24 78 58 	#Not possible!
#test2:	.word	62 64 5 45 81 27 61 91	#Not possible!
#test3:	.word	95 42 27 36 91 4 2 53	#Possible!
#test4:	.word	92 82 21 16 18 95 47 26	#Possible!
#test5:	.word	71 38 69 12 67 99 35 94	#Possible! 
#test6:	.word	11 22 33 73 64 41 11	#Possible! 
#test7:	.word	33 24 8 24 6 21 16 20 17 28
#test8:	.word	14 12 1 22 30 33 2 24 33 10
#test9:	.word	6 3 30 32 1 22 15 31 16 13
arr:	.space	400			# MAX_SIZE=100



spaceChar:	.asciiz	" "
possible:	.asciiz "Possible! "
notPossible:	.asciiz "Not Possible! "
