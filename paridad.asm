        org $80
        db $00,%1100111 ;80 --> contador de unos - 81--> dato a agregar paridad --> $67 - --> $E7
        
        org $EE00
        clra
        lda $81
        
bit:    asla
        bcs uno
        beq par
        bra bit
        
uno:    inc $80
        bra bit
        
par:    lda $80
        and #$01
        beq fin
        lda $81
        ora #$80
        sta $81
        bra fin
               
fin:    swi
        
        org $FFFA
        dw $EE00
        
