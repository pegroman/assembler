        org $C0
        db $F7,$00
        
        org $EE00
        clra
        lda $C0
        asla
        asla
        sta $C1
        swi
        
        org $FFFA
        dw $EE00
        dw $EE00
        dw $EE00
