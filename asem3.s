.data
A:  .word  0, 0, 0, 1
    .word  0, 2, 0, 0
    .word  0, 0, 3, 0
    .word  4, 0, 0, 0
B:  .word  0, 1, 2, 3
    .word  4, 5, 6, 7
    .word  8, 9, 10, 11
    .word  12, 13, 14, 15
C:  .space 64  # 4x4 matrix (4 rows x 4 columns x 4 bytes each)
N:  .word 4

.text
main:
    or $17, $0, $0
    lw $19, N
    la $20, A
    la $16 C

loopi: 
    beq $17, $19, loopendi
    or  $18, $0, $0
    la $21, B

loopj: 
    beq $18, $19, loopendj
    or $22, $0, $0
    or $23, $0, $0

loopk: 
    beq $22, $19, loopendk
    lw $4, 0($20)
    lw $5, 0($21)
    jal multiply
    add $23, $23, $2   # s += A[i][k] + B[k][j]
    addi $20, $20, 4   # A next
    addi $21, $21, 16  # B next
    addi $22, $22, 1   # k++
    j loopk

loopendk: 
    sw $23, 0($16)
    addi $16, $16, 4
    addi $20, $20, -16
    addi $21, $21, -60
    addi $18, $18, 1
    j loopj

loopendj:
    addi $17, $17, 1
    addi $20, $20, 16
    j loopi

loopendi:

exit: j exit



multiply:
    addi $10, $0, 1         # マスクビットを作成
    or $2, $0, $0           # 積(結果)の初期化

loop1: 
    beq $4, $0, endMultiply # 32回シフトすると計算が終了する(被乗数のオーバーフロウ判定)
    and $12, $5, $10        # マスクビットと乗数の論理和をとる
    beq $12, $0, dontAdd    # 論理和が１の時、被乗数を結果に加える
    
    add $2, $2, $4          # 論理和が１だったので、被乗数を結果に加える

    add $10, $10, $10       # マスクビットを左シフト
    add $4, $4, $4          # 被乗数を左シフト
    j loop1

dontAdd:
    add $10, $10, $10       # マスクビットを左シフト
    add $4, $4, $4          # 被乗数を左シフト
    j loop1

endMultiply:
    jr $ra                  # 戻りアドレスに戻る

