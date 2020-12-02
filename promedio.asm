
        org $90
        db $08,$04,$07,$06,$08 ; lista de datos
        db $05                 ;cantidad de elementos --> $95
        db $00                 ; suma de los elementos --> $96
        db $00                 ; promedio  --> $97
        
        org $EE00
        clra
        ldx #$90
        
dato:   lda $95         ;cantidad de elemento a recorrer
        cbeqa #$00,prom
        lda $96
        add ,x
        sta $96          ;suma = suma + elemento
        dec $95
        incx             ;x = x + 1
        bra dato
        
prom:   lda $96
        ldx #$05
        div
        sta $97
        swi
        
        org $FFFA
        dw $EE00
        
        
        
        
        
       
        
        
        
