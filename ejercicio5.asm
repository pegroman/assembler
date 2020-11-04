        org $80
        db $00,$00 ;en $80 --> 08; y en $81 ---> 07
        org $C0
        db $87  ;dato
        
        org $EE00
        clra
        lda $C0
        and #%00001111 ;poner en accu, la parte baja de 87 -->accu=7
        sta $81
        lda $C0
        and #%11110000
        nsa
        sta $80
        swi
        
        org $FFFA
        dw $EE00
        dw $EE00
        dw $EE00
        
        
        
        
        
