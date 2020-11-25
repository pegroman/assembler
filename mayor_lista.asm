        org $80             ;incializo memoria de programa
        db $04               ;cantidad elementos
        db $00               ;comparador. donde guardo el mayor de todos. si me piden menor $FF
        db $10,$00,$aa,$05    ; lista de elementos

        org $EE00    ;inicializo memoria programa        
        clra        ;limpio accu. direccionamiento inherente
        ldx #$82    ;cargo en x el valor 82--> se utiliza como "puntero". inmediato
        
dato:   lda $80        ;cargo en accu cantidad de elemntos y... . directo
        cbeqa #$00,fin  ;comparo si es igual a cero. Si se cumple, termino. inmediato
        lda ,x          ;carga en accu lo que me indica x como posicion de memoria.indexado sin offset
        cmp $81         ;comparo para saber si el elemento en lista es el "nuevo" mayor. directo
        bhi mayor       ;verifico si accu > comparador  ; si me piden el menor BLO
        bra iter
        
mayor:  sta $81
        bra iter
        
iter:   dec $80
        incx
        bra dato

fin:    swi           ;fin programa. interrupcion por soft

        org $FFFA
        dw $EE00
        
        
