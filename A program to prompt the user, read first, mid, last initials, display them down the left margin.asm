;Example:
;1.print ?
;2.star print
;***********
;***********
;***********
;***********
;***********
;****CSE****
;***********
;***********
;***********
;***********
;***********

.model small
.stack 100h
.data
 
a db '***********',10,13,'$'
b db '****$'
.code
main proc
    ; Initialize data segment.
    mov ax, @data
    mov ds, ax
    
    ;'?'print
    mov dl,'?'
    mov ah,2
    int 21h 
    
    ;3ta input newa.
    mov ah,1
    int 21h   
    mov bl,al
    
     mov ah,1
    int 21h
    mov bh,al
    
     mov ah,1
    int 21h
    mov cl,al
    ;for new line.
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h  
    
    ;5 Times 11 ta star print koro.
    lea dx,a
    mov ah,9
    int 21h 
    int 21h
    int 21h
    int 21h
    int 21h
    ;1 Times 4ta star print koro. 
    mov ah,9
    lea dx,b
    int 21h  
    ;input newa value golo print kora.
    mov ah,2
    lea dl,bl
    int 21h  
    
    mov ah,2
    mov dl,bh
    int 21h  
    
    mov ah,2
    mov dl,cl
    int 21h
    
    ;1 Times 4ta star print koro. 
    mov ah,9
    lea dx,b
    int 21h
     
    ;for new line.
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
     
    ;5 Times 11 ta star print koro. 
    lea dx,a
    mov ah,9
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h  
    
    ;FOR BEEP SOUND
    mov ah,2
    mov dl,007  ;007 ta BEEP sound er decimal.
    int 21h
    
    ; Terminate the program.
    exit:
    mov ah, 4Ch ; DOS interrupt for program termination.
    int 21h
main endp
end main
         
        
        
        
        
;OUTPUT:
;Example:
;1.print ?
;2.star print
;***********
;***********
;***********
;***********
;***********
;****CSE****
;***********
;***********
;***********
;***********
;***********