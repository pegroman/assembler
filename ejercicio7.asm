        org $80
        db $04,$FF,$03,$E5,$00
        org $90
        db $00,$00,$00  ;90 --> ceros - 91--> negativos - 92-->postivos
        
        org $EE00
        clra
        ldx #$81 ;que voy a empezar a recorrer desde pos $81
        
dato:   lda ,x
        beq cero   
        bmi neg
        inc $92 
        bra iter
        
neg:    inc $91
        bra iter

cero:   inc $90
        bra iter
        
iter:   incx
        dec $80
        beq fin
        bra dato

fin:    swi
        
        org $FFFA
        dw $EE00
