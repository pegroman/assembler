        org $90
        db $48,$6F,$4C,$61,$0D
        
        org $EE00
        clra
        ldx #$90
        
letra:  lda ,x
        cbeqa #$0D,fin ;comparo accu con 0D --> si son iguales, salta a fin. Sino, busca mayus o minus
        cmp #$60      ; accu - 60 > 0 --> encontre minuscula. accu - 60 < 0 -->encontre mayus    
        bgt minus     ;todos los valores mayores a 60 son minuscula.
        incx
        bra letra

minus:  sub #$20   ;lo que hay en pos de memoria que indica x, resto 20
        sta ,x
        incx
        bra letra

fin:    swi
    
        org $FFFA
        dw $EE00
