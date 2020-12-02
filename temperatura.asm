
        org $80
        db $00  ;flag25
        db $00  ;flag15
        
        org $90
        db $14   ;temperatura
        
        org $EE00
        clra
        lda $90
        cmp #$25
        bgt mayor
        cmp #$15
        blt menor
        bra fin
        
mayor:  inc $80
        bra fin

menor:  inc $81
        bra fin

fin:   swi

       org $FFFA
       dw $EE00

