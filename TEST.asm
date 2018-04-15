.MODEL SMALL
.STACK 100H
.CODE 

.DATA

MSG1 DB 'ENTER AN INPUT: $'
MSG2 DB 'GREATER $'
MSG3 DB 'SMALLER $'

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H     ;PRINT MSG_1
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    
    
    
    CMP BL,5
    JL L1  
    
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    JMP EXIT  
    
    
    L1:
    LEA DX,MSG3
    MOV AH,9
    INT 21H 
    
    EXIT:
ENDP MAIN
