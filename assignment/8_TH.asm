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
    MOV CL,AL  
    
    
    
    
    ADD BL,BH
    SUB BL,48
    ADD BL,CH
    SUB BL,48
    ADD BL,CL
    SUB BL,48
            
    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,13
    INT 21H 

    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BL
    INT 21H 
    
    
    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN