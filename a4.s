       .data
N:      .word 10    # The length of Array
A:      .word 9     # A[0] = 9
        .word 3     # A[1] = 3
        .word 12
        .word 7
        .word 23
        .word 1
        .word 23
        .word 43
        .word 54    # A[8] = 54
        .word 31    # A[9] = 31

main:    or $8, $0, $0
         lw $9, N
         addi $9, $9, -1
         
         lw $11, N 
         addi $11, $11, -2

         la $10, A 

loop1:   beq $8, $9, exit
         j loop2

loop2:   beq $11, $8, loop2end
         lw $12, $11        # $12に a[j]のアドレスを格納
         add $12, $12, $12  #４倍
         add $12, $12, $12
         lw $13, 0($12)     # $13 = a[j]
         lw $14, 4($12)     # $14 = a[j+1]
         slt $15, $14, $13
         beq $15, 1 swap
         j loop2

loop2end: addi $8, $8, 1
          j loop1

swap:    lw $15, $13
         sw $14, 0($12)
         sw $13, 4($12)
         
         

        
         

exit: j exit

