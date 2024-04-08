
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
B:      .space 40   # 配列B の格納先　大きさは40バイト
        .text
main:    or $8, $0, $0
         lw $9, N
         lw $10, A
         lw $11, B 

loop:    beq  $8, $9, exit  
         addi $8, $8, 1
         sw   $11, 0($10)
         addi $10, $10, 4

exit: j exit


