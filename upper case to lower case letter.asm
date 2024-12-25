.model small        ; Specify the small memory model, suitable for small programs with a single code and data segment.
.stack 100h         ; Allocate 256 bytes of stack space.

.data
a db 'Upper form: $' ; Declare a string to display the "Upper form" label.
b db 'Lower form: $' ; Declare a string to display the "Lower form" label.

.code
main proc
    ; Initialize the data segment
    mov ax, @data      ; Load the address of the data segment into AX.
    mov ds, ax         ; Set the data segment register (DS) to AX.

    ; Display the "Upper form" label
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, a          ; Load the effective address of the "a" string into DX.
    int 21h            ; Call interrupt 21h to display the string.

    ; Get the user input (an uppercase letter)
    mov ah, 1          ; DOS interrupt 21h function 1: Read a single character from the keyboard.
    int 21h            ; Call interrupt 21h to get the input.
    mov bl, al         ; Store the input character (in AL) into BL for later processing.

    ; Insert a newline for formatting the output
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, 10         ; ASCII value for newline.
    int 21h            ; Call interrupt 21h to display the newline.
    mov dl, 13         ; ASCII value for carriage return.
    int 21h            ; Call interrupt 21h to display the carriage return.

    ; Display the "Lower form" label
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, b          ; Load the effective address of the "b" string into DX.
    int 21h            ; Call interrupt 21h to display the string.

    ; Convert the uppercase letter to lowercase
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    add bl, 32         ; Add 32 to the ASCII value in BL to convert it to lowercase.
    mov dl, bl         ; Move the converted character from BL to DL for display.
    int 21h            ; Call interrupt 21h to display the lowercase character.

    ; Exit the program
    exit:
    mov ah, 4Ch        ; DOS interrupt 21h function 4Ch: Terminate the program.
    int 21h            ; Call interrupt 21h to terminate the program.

main endp
end main
