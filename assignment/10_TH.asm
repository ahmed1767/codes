.MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB 'Input a number: $'
MSG2 DB 'The sum is: $'

.CODE

MAIN PROC   
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H   
    MOV BX,AX 
    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,13
    INT 21H  
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
           
    MOV AH,1 
    INT 21H
    MOV AX,AX 
     
    ADD BX,AX
    SUB BX,48 
    
    MOV CX,BX
            
    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,13
    INT 21H 

    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DX,CX
    INT 21H 
    
    
    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN