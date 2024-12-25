.mode small ;ekhane akta code segment and akta data segment bujano hocce.
.stack 100h ;eti diye memory size ta bujano hocche.
.code  ; code er maddome bujatee.


main proc 
    ;first input:
    mov ah,1
    int 21h
    mov bl,al  ;eti dara bujacche je ami akta int data ke input hisebe al register e niyechi,and seta ke bl register e store kore rekhechi.
    
    ;akta new line print korte chacchi.
    
    mov ah,2  ;eta display korar jonno use kora hoycche.
    mov dl,10 ;ekhane 10 use kora hoyeche Ascicode e 10=newl bujai,(10+13) doita mile akta new line print korte use hoy.
    int 21h   ;newline ta ke call and execute korar jonno 'int 21h' use kora holo.
    mov dl,13 ;newline print shese return korar jonno eta.  
    int 21h   ;return operation ta call and exicute korar jonno interrept use holo.
    
    ;second input:   
    mov ah,1
    int 21h
    mov bh,al 
    
    ;Arekta newline:
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
    
    ;First input er output:
    mov ah,2
    mov dl,bl   ;dl er maddhomee bl register er value ta ke print kore dibo.
    int 21h
         
    ;arekta new line print korte chacchi.    
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     ;2nd data ta o print kore dilum.
     mov ah,2
     mov dl,bh
     int 21h
     
     
     ;for Beep sound ta ke akebare display/output hisebe show korar jonno.
     mov ah,2
     mov dl,07 ; beep sound er ascci: 07
     int 21h
     
     exit:
     mov ah,4ch
     int 21h
     main endp
end main
