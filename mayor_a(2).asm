        ;recorrer una lista de valores. contar los que valores que son mayor a $0A
        org $80
        db $09,$0A,$0B,$0F ;lista con datos
        db $04  ;cantidad de elementos. Puede elegir comenzar en cero y llegar a 4
        db $00 ;cantidad de valores mayores a $0A

        org $EE00
        clra
        ldx #$80
        
dato:   lda $84
        cbeqa #$00,fin
        lda ,x
        cmp #$0A
        bhi mayor  
        bra iter
        
mayor:  inc $85
        bra iter
        
iter:   dec $84
        bra dato
        
fin:    swi

        org $FFFA
        dw $EE00
