        org $80
        db $25,$20 ;en pos de mem 80 --> dividendo. En 81 al divisor
        
        org $EE00
        lda $80   ;cargo dividendo en accu --> accu=$25
        ldx $81   ;cargas divisor en X ---> X=$20
        div       ;dividir
        swi       ;fin
        
        org $FFFA
        dw $EE00
        
