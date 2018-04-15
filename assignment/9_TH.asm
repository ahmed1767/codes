.MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB 'Input a number: $'
MSG2 DB 'The sum is: $'

.CODE

MAIN PROC
    MOV CL,0
    
       
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H   
    MOV BL,AL 
    
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
    MOV BH,AL 
    
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
    MOV CH,AL
    
    
    ADD CL,BH
    SUB BL,48
    ADD CL,CH
    SUB BL,48
    ADD CL,BL
    ;SUB CL,48    

    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,13
    INT 21H 

    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,CL
    INT 21H 
    
    
    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN