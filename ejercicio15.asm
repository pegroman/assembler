        org $80
        db $00,$01,$02,$03   ;tabla 1. Donde voy a poner los menores de la pila
        db $03,$01,$05,$00   ;tabla2
        db $00              ;contador. corto cuando llego a 4
        
        org $EE00
        clra
        ldx #$80
        
dato:   lda $88
        cbeqa #$04,ipila ;c -->"comparar" beq --> "salta si z=1" = salta si lo que hay en accu = 04
        lda ,x         ;accu = 00
        cmp 4,x        ;accu - pos(80+4) --> 00 - 03
        bls menor      ;accu < 4,x
        lda 4,x        ;accu > 4,x
        inc $88
        psha           ;push del contenido del accu a la pila
        incx
        bra dato
        
menor:  inc $88
        psha
        incx
        bra dato
        
ipila:  ldx #$80
        bra pila
       
pila:   lda $88         ;va a tener el valor
        cbeqa #$00,fin
        pula            ;llevo de la pila al accu. "saco ultima silla para usar"
        sta ,x
        incx
        dec $88
        bra pila
       
fin:    swi
        
        org $FFFA
        dw $EE00
        
