.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    
    MOV AH,2 
    MOV DL,10 
    INT 21H
    
    
    MOV AH,2
    MOV DL,AL
    INT 21H
    
    