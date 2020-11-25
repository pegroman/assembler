        org $80  ;incializo memoria de programa
        db $04,$00,$80,$05,$07,$04  ;80--> cantidad elementos, 81->cant pares, 82->comienzan datos
        
        org $EE00  ;inicializo memoria de programa
        clra      ;limpio accu. inherente
        ldx #$82  ;cargo x con el valor 82. direccionamiento inmediato
        
dato:   lda $80          ;cargo en accu la cantidad de elementos recorridos
        cbeqa #$00,fin  ;si la cantidad de elementos recorridos es cero, voy a fin. direcc. inmediato
        lda ,x         ;cargar en accu lo que me indica x como pos de memoria. indexado, sin offset
        and #$01      ;aplico mascara. me quedo con LSB para determinar si es par o no
        beq par       ;si z=1 (accu=00) LSB=0 ..> encontre par
        dec $80       ;resto 1 a cantidad de elementos por visitar. direccionamiento directo
        incx         ;aumentas indice en 1. direccionamiento inherente
        bra dato     ;comienza rutina nuevamente. direccionamiento relativo a la direccion
        
par:    inc $81   ;aumento en uno la cantidad de pares. Encontre un par. direcc directo
        dec $80
        incx
        bra dato

fin:    swi      ;fin. interrupcion por software

        org $FFFA
        dw $EE00
        
        
       
        
        
        
