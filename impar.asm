        org $80
        db $00,$04,%00001111,%11110000,%10010100,%00000000
        
        org $EE00
        clra
        ldx #$82
        
dato:   lda ,x
        and #%00000001
        ;si el resultado de la operacion AND NO activa al flag Z=0 --> encotre un impar. Sino,par.
        bne impar
        bra iter
        
impar:  inc $80
        bra iter
        
iter:   incx
        dec $81
        beq fin
        bra dato
        
fin:    swi
        
        org $FFFA
        dw $EE00
        
