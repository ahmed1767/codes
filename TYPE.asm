.MODEL SMALL

.STACK 100H

.CODE

MAIN PROC
    
    MOV AH,1
    
    INT 21H
    MOV BL,AL
    
    ADD BL,32
    
    MOV AH,2
    
    MOV DL,0AH
    INT 21H
    
    MOV DL,BL
    INT 21H 
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN