        org $80
        db $56,$2A,$CA,$AC

        org $EE00
        ldhx #$0082  ;inmediato(#). carga en H y en X --> H=00,X=82
        ;com ,X    ;indexado sin offset(,). CA1  del contenido de la posicion de memoria que 
        com ,x    ; CA1 de lo que hay en la pos de memoria $82. Resultado guarda en $82
        com 01,X  ;indexado con offset. CA1  de lo que hay en la pos de memoria 82 + 01 --> $83
        lda 01,X  ;indexado con offset. contenido de accu = al contenido de pos memoria 83(82+1)
        add #01   ;inmediato. sumar 1 al accu--> accu = accu + 1 --> paso ACCU a CA2
        sta 01,X  ;indexado con offset. guarda contenido de accu en pos de memoria 83(82+1)
        lda ,X    ;indexado. carga en accu = el contenido de la pos memoria $82
        adc #00   ;inmediato. suma con acarreo. lo que habia en $82 + el valor 00. tiene en cuenta Carry
        sta ,X    ;indexado. Guardo en memoria el contenido del accu. Pos que me indica X. en $82 contenido de accu
        ldhx #$0080 ;inmediato. carga en H=00 y en X=80
        lda 01,X    ;indexado offset. cargo en accu lo que hay en la pos de memoria 80 +01 = 81
        add 03,X    ;indexado offset. sumaba sin carry. accu = accu + (contenido de lo que hay en pos 83(80+3)
        sta 01,X    ;indexado offset. guarda contenido de accu en pos $81(80+1)
        lda ,X      ;indexado. carga en accu  lo que hay en $80
        adc 02,X    ;indexado offset. suma con acarreo. Accu = Accu + pos 82(80+2). s
        sta ,X      ;indexado. Almecena resultado en pos de memoria 80
        swi         ;interrupcion por software. FIN

        org $FFFA
        dw $EE00
        dw $EE00
        dw $EE00
