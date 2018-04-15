.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
    
   L:
    
   MOV AH,1
   INT 21H
   MOV BL,AL ;INPUT
   
   MOV AH,2
   MOV DL,BL
   INT 21H    ;OUTPUT
   
    
   MOV DL,10
   INT 21H
   MOV DL,13         ;NEWLINE
   INT 21H
     
   CMP BL,0
   JE EXIT
   JMP L          ;COMPARE
  
    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN