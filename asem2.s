.data
    multiplier: .word 10   # 被乗数
    multiplicand: .word 15 # 乗数
    R: .word 0            # 結果を格納するメモリ
.text

main:
    
    lw $4, multiplier     # 被乗数と乗数をレジスタ $4, $5 にロード
    lw $5, multiplicand
    addi $t2, $0, 1       #　マスクビットを作成
    or $t3, $0, $0        # i = 0　ループ変数
    addi $t5, $0, $31

    or $2, $0, $0         # 積(結果)の初期化

loop1: 
    beq $t3, $t5, exit # 32回シフトすると計算が終了する
    and $t4, $5, $t0      # マスクビットと乗数の論理和をとる
    beq $t4, $0, dontAdd  # 論理和が１の時、被乗数を結果に加える
    
    add $2, $2, $4        # 論理和が１だったので、被乗数を結果に加える

    add $t2, $t2, $t2     # マスクビットを左シフト
    add $4, $4, $4        # 被乗数を左シフト
    addi $t3, $t3, 1      # i++
    j loop1

dontAdd:
    add $t2, $t2, $t2     # マスクビットを左シフト
    add $4, $4, $4        # 被乗数を左シフト
    addi $t3, $t3, 1      # i++
    j loop1


exit: j exit

