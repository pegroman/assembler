        org $80
        db $00,$04,%00001111,%11110000,%10010100,%00000000
        
        org $EE00
        clra
        ldx #$82
        
dato:   lda ,x
        and #%00000001
        ;si el resultado de la operacion AND activo al flag Z=1 --> encotre un par. Sino, un impar.
        beq par
        bra iter
        
par:    inc $80
        bra iter
        
iter:   incx
        dec $81
        beq fin
        bra dato
        
fin:    swi
        
        org $FFFA
        dw $EE00
        
