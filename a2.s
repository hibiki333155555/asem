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
S:      .word 0
        .text

main:    or   $8, $0, $0       # i = 0
         lw   $9, N            
         la   $10, A
         or   $11, $0, $0      # s = 0

loop:    beq  $8, $9, loopend  # i == n なら loopend へ
         addi $8, $8, 1        # i++
         lw   $12, 0($10)
         add  $11, $11, $12    # s += i
         addi $10, $10, 4
         j    loop

loopend: sw   $11, S           # sの値をストア

exit:    j    exit