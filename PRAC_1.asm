.MODEL SMALL
.STACK 100H
.DATA
 
.CODE

MAIN PROC 
    
    
    MOV AH,1
    
    INT 21H
    MOV BL,AL
    
    INT 21H
    MOV BH,AL
    
    INT 21H
    MOV CL,AL
    
    
    ADD CL,BL
    ;SUB CL,48
    
    SUB CL,BH
    ;ADD CL,48
    
    
    
    MOV AH,2
    
    MOV DL,10
    INT 21H
    
    MOV DL,CL 
    INT 21H