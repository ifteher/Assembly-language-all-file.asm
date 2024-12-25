.model small        ; Use the small memory model for simple programs.
.stack 100h         ; Allocate 256 bytes of stack space.

.data
a db 'Input two numbers (one by one): $'  ; Prompt for input of two numbers.
b db 10,13,'Largest Number: $'            ; Message for displaying the largest number.

.code
main proc
    ; Initialize the data segment.
    mov ax, @data      ; Load the address of the data segment into AX.
    mov ds, ax         ; Set DS to AX to access the data segment.

    ; Display the prompt to input two numbers.
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, a          ; Load the effective address of string 'a' into DX.
    int 21h            ; Call interrupt 21h to display the string.

    ; Input the first number.
    mov ah, 1          ; DOS interrupt 21h function 1: Read a character from the keyboard.
    int 21h            ; Call interrupt 21h to get input.
    mov bl, al         ; Store the first number (from AL) into BL.

    ; Input the second number.
    mov ah, 1          ; DOS interrupt 21h function 1: Read a character from the keyboard.
    int 21h            ; Call interrupt 21h to get input.
    mov bh, al         ; Store the second number (from AL) into BH.

    ; Compare the two numbers.
    cmp bl, bh         ; Compare the numbers in BL and BH.
    jg level1          ; If BL > BH, jump to level1.
    jmp level2         ; Otherwise, jump to level2.

level1:
    ; Display the "Largest Number" message.
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, b          ; Load the effective address of string 'b' into DX.
    int 21h            ; Call interrupt 21h to display the message.

    ; Display the first number as the largest.
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, bl         ; Load BL (first number) into DL for output.
    int 21h            ; Call interrupt 21h to display the number.
    jmp exit           ; Jump to exit after displaying.

level2:
    ; Display the "Largest Number" message.
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, b          ; Load the effective address of string 'b' into DX.
    int 21h            ; Call interrupt 21h to display the message.

    ; Display the second number as the largest.
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, bh         ; Load BH (second number) into DL for output.
    int 21h            ; Call interrupt 21h to display the number.

exit:
    ; Exit the program.
    mov ah, 4Ch        ; DOS interrupt 21h function 4Ch: Terminate the program.
    int 21h            ; Call interrupt 21h to terminate.

main endp
end main
