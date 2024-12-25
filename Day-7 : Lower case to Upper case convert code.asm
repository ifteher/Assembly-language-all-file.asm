.model small        ; Specify the small memory model, suitable for small programs with a single code and data segment.
.stack 100h         ; Allocate 256 bytes of stack space.

.data
a db 'Lower form: $'  ; Declare a string to display the "Lower form" label.
b db 'Upper form: $'  ; Declare a string to display the "Upper form" label.

.code
main proc
    ; Initialize the data segment
    mov ax, @data      ; Load the address of the data segment into AX.
    mov ds, ax         ; Set the data segment register (DS) to AX.

    ; Display the "Lower form" label
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, a          ; Load the effective address of the "a" string into DX.
    int 21h            ; Call interrupt 21h to display the string.

    ; Get the user input (a lowercase letter)
    mov ah, 1          ; DOS interrupt 21h function 1: Read a single character from the keyboard.
    int 21h            ; Call interrupt 21h to get the input.
    mov bl, al         ; Store the input character (in AL) into BL for later processing.

    ; Insert a newline for formatting the output
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, 10         ; ASCII value for newline.
    int 21h            ; Call interrupt 21h to display the newline.
    mov dl, 13         ; ASCII value for carriage return.
    int 21h            ; Call interrupt 21h to display the carriage return.

    ; Display the "Upper form" label
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, b          ; Load the effective address of the "b" string into DX.
    int 21h            ; Call interrupt 21h to display the string.

    ; Convert the lowercase letter to uppercase
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    sub bl, 32         ; Subtract 32 from the ASCII value in BL to convert it to uppercase.
    mov dl, bl         ; Move the converted character from BL to DL for display.
    int 21h            ; Call interrupt 21h to display the uppercase character.

    ; Exit the program
    exit:
    mov ah, 4Ch        ; DOS interrupt 21h function 4Ch: Terminate the program.
    int 21h            ; Call interrupt 21h to terminate the program.

main endp
end main


Explanation of Key Sections
Data Segment Initialization:

The program initializes the data segment so it can access strings stored in the .data section.
Displaying Strings:

The mov ah, 9 and int 21h combination is used to display strings, with the address of the string provided in the DX register.
User Input:

The program uses int 21h with ah = 1 to read a single character from the keyboard, storing it in the AL register.
Newline Formatting:

A newline and carriage return are added using their ASCII values (10 and 13) to make the output visually clean.
Lowercase to Uppercase Conversion:

Subtracting 32 from the ASCII value of a lowercase letter converts it to uppercase because the ASCII values of uppercase letters are 32 less than their corresponding lowercase letters.
Displaying the Converted Character:

The converted uppercase character is displayed using mov ah, 2 and int 21h.
Program Exit:

The program exits cleanly using int 21h with ah = 4Ch.

Input:
Lower form: a
Output:
Upper form: A





