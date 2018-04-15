.MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB 'ENTER AN INPUT: $'
MSG2 DB ' IN RANGE $'
MSG3 DB ' OUT OF RANGE $'


.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    MOV CL,AL
    SUB CL,48  
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
        
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    CMP BL,CL
    JGE L
    CMP CL,BH
    JGE L3
    ADD BH,48
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT
    
    L3:
    ADD CL,48
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP EXIT
    
         
    L:     
    CMP BL,BH
    JGE L2
    ADD BH,48
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT
    
       
    L2:
    ADD BL,48
    MOV AH,2
    MOV DL,BL
    INT 21H

    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN