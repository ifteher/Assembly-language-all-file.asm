;By Using loop concept print this pattern.
;**********   
;**********
;**********
;**********
;**********
;**********
;**********
;**********
;**********

.model small
.stack 100h
.data
a db 10,13,'Star related problem:$'
.code
main proc
    ; Initialize data segment.
    mov ax,@data
    mov ds,ax
     
   ;for print 'a' string.
   mov ah,9
   lea dx,a
   int 21h 
     
    ; Insert another newline.
    mov ah,2
    mov dl, 10 ; Line feed (LF)
    int 21h 
    mov dl, 13 ; Carriage return (CR)
    int 21h
    
   ;for loop concept.
   mov cx,10;loop er jonno 'cx' register and loop count. 
   
   level:
   mov dl,'*'
   mov ah,2
   int 21h 
   int 21h
   int 21h
   int 21h
   int 21h
   int 21h
   int 21h
   int 21h
   int 21h
   int 21h
   
    mov ah,2
    mov dl, 10 ; Line feed (LF)
    int 21h 
    mov dl, 13 ; Carriage return (CR)
    int 21h   
    
    loop level
    
   ; Terminate the program.
    exit:
    mov ah, 4Ch ; DOS interrupt for program termination.
    int 21h
main endp
end main
