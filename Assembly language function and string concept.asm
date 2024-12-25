Assembly language all file:

pre-requisit:
1)';'(semicolon) diyee emu8086 e code likhar somoy comment kora hoy.
2)  1 diye->single key input bujai.
    2 diye->single character output bujai.
    9 diye->character string output bujai.
Example of a Assembly language code:
3) topic:function and string concept:
  code:.model small
.stack 100h
.data
m db 'I am Mohammad iftehr uddin  $'
.code
main proc
    ;1->single key input.
    ;2->single character output.
    ;9->character string output.
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main


///output: I am Mohammad ifteher uddin (enter a number: 5) output this number 5.
