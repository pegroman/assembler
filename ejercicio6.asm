        org $80
        db $00,$04,$FF,$03,$E5,$01
        
        org $EE00
        clra
        ldx #$82 ;que voy a empezar a recorrer desde pos $82
        
dato:   lda ,x   
        bmi neg  
        bra iter
        
neg:    inc $80
        bra iter

iter:   incx
        dec $81
        beq fin
        bra dato

fin:    swi
        
        org $FFFA
        dw $EE00

              
