        org $C0
        db $07,$00
        
        org $EE00
        lda $C0 ;directo. cargo en accu contenido de pos $C0 --> accu=E7
        ;tengo que determinar si MSB es 1 o 0. Si es cero ROLA ROLA. Se es 1 --> SEC ROLA ROLA
        bmi carry ; (if N=1) --> salto a la etiqueta carry. SINO, sigo abajo 
        rola
        rola
        sta $C1
        bra fin

carry:  sec
        rola
        rola             
        sta $C1
        bra fin
        
fin:    swi
        
        org $FFFA
        dw $EE00
        dw $EE00
        dw $EE00
