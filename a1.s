         .data
A:       .word 31
B:       .word 53
C:       .word 11
S:       .word 0
         .text
main:    lw   $8, A 
         lw   $9, B
         lw   $10, C
         add  $11, $8, $9
         sub  $11, $11, $10
         sw   $11, S
exit: j  exit