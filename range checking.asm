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
    
    L:
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    
    CMP BL,5
    JGE L1
    
                  
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    JMP L
    
    L1:   
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    JMP EXIT  

    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN