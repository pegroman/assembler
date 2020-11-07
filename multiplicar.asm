        org $80
        db $85,$F2 
        
        org $EE00
        lda $80   
        ldx $81   
        mul       
        swi       
        
        org $FFFA
        dw $EE00
