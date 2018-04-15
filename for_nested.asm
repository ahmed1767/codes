.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC   
    MOV AH,2
    MOV BL,0
    MOV CL,0
    
    TOP:
        INC BL
        CMP BL,10
        JGE EXIT
        MOV CL,BL
        MOV DL,10
        INT 21H 
        MOV DL,13
        INT 21H
        T1:
            CMP CL,10
            JGE TOP
            MOV DL,'*'
            INT 21H
            INC CL
            JMP T1 
    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN      
              