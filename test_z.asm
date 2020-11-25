        org $80
        db $00
        
        org $EE00 
        clra
        lda #$80  ; Z=0
        lda #$00  ; Z=1
        swi
        
        org $FFFA
        dw $EE00
