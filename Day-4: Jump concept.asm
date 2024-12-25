.model small  ; Specify the memory model as 'small'
.stack 100h   ; Allocate 256 bytes of stack space
.data         ; Begin the data segment

;string type variable a,b,c nichi jump concept dekhate.
a db 'jump concept $'
b db 'assembly language $'
c db 'programming $'
.code        ; Begin the code segment

main proc 
    ; Initialize the data segment
    mov ax,@data
    mov ds,ax

    ; Display the first string (a)
    ;jump concept kota ta ke execute korar jonno.
   mov ah, 9           ; DOS function to display a string
    lea dx, a           ; Load the address of 'a' into DX
    int 21h             ; Call DOS interrupt to display the string
    
    ; New line
    mov ah, 2           ; DOS function to display a character
    mov dl, 13          ; Carriage return
    int 21h
    mov dl, 10          ; Line feed
    int 21h

    ; Jump to label 'm'
    m:
    mov ah, 9           ; DOS function to display a string
    lea dx, b           ; Load the address of 'b' into DX
    int 21h             ; Call DOS interrupt to display the string

    ; Jump to label 'n'
    jmp n

    ; Label 'n'
    n:
    mov ah, 9           ; DOS function to display a string
    lea dx, c           ; Load the address of 'c' into DX
    int 21h             ; Call DOS interrupt to display the string

    ; Jump to exit label
    jmp exit

    ; Exit the program
    exit:
    mov ah, 4Ch         ; DOS function to terminate the program
    int 21h
    main endp
end main  


;OUTPUT of This code:
jump concept
assembly language programming.
