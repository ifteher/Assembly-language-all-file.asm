;From three numbers,Finding bigger number between two inputs.asm

.model small        ; Use the small memory model for simple programs.
.stack 100h         ; Allocate 256 bytes of stack space.

.data
prompt db 'Input three numbers (one by one): $'  ; Prompt for input.
largest_msg db 10, 13, 'Largest Number: $'      ; Message for the largest number.

.code
main proc
    ; Initialize the data segment
    mov ax, @data      ; Load the address of the data segment into AX.
    mov ds, ax         ; Set DS to AX to access the data segment.

    ; Display the prompt message
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, prompt     ; Load the effective address of 'prompt' into DX.
    int 21h            ; Call interrupt 21h to display the message.

    ; Input the first number
    mov ah, 1          ; DOS interrupt 21h function 1: Read a character from the keyboard.
    int 21h            ; Call interrupt 21h to get input.
    mov bl, al         ; Store the first input character in BL.

    ; Input the second number
    mov ah, 1          ; DOS interrupt 21h function 1: Read a character from the keyboard.
    int 21h            ; Call interrupt 21h to get input.
    mov bh, al         ; Store the second input character in BH.

    ; Input the third number
    mov ah, 1          ; DOS interrupt 21h function 1: Read a character from the keyboard.
    int 21h            ; Call interrupt 21h to get input.
    mov cl, al         ; Store the third input character in CL.

    ; Compare BL (first number) with BH (second number)
    cmp bl, bh         ; Compare the first and second numbers.
    jge check_bl_cl    ; If BL >= BH, check BL against CL.
    jmp check_bh_cl    ; Otherwise, check BH against CL.

check_bl_cl:
    cmp bl, cl         ; Compare BL (first number) with CL (third number).
    jge print_bl       ; If BL >= CL, BL is the largest.
    jmp print_cl       ; Otherwise, CL is the largest.

check_bh_cl:
    cmp bh, cl         ; Compare BH (second number) with CL (third number).
    jge print_bh       ; If BH >= CL, BH is the largest.
    jmp print_cl       ; Otherwise, CL is the largest.

print_bl:
    ; Display "Largest Number" message
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, largest_msg; Load the effective address of 'largest_msg' into DX.
    int 21h            ; Call interrupt 21h to display the message.

    ; Display the largest number (BL)
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, bl         ; Load BL into DL for output.
    int 21h            ; Call interrupt 21h to display the number.
    jmp exit           ; Exit the program.

print_bh:
    ; Display "Largest Number" message
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, largest_msg; Load the effective address of 'largest_msg' into DX.
    int 21h            ; Call interrupt 21h to display the message.

    ; Display the largest number (BH)
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, bh         ; Load BH into DL for output.
    int 21h            ; Call interrupt 21h to display the number.
    jmp exit           ; Exit the program.

print_cl:
    ; Display "Largest Number" message
    mov ah, 9          ; DOS interrupt 21h function 9: Display a string.
    lea dx, largest_msg; Load the effective address of 'largest_msg' into DX.
    int 21h            ; Call interrupt 21h to display the message.

    ; Display the largest number (CL)
    mov ah, 2          ; DOS interrupt 21h function 2: Display a single character.
    mov dl, cl         ; Load CL into DL for output.
    int 21h            ; Call interrupt 21h to display the number.

exit:
    ; Exit the program
    mov ah, 4Ch        ; DOS interrupt 21h function 4Ch: Terminate the program.
    int 21h            ; Call interrupt 21h to terminate.

main endp
end main


;OUTPUT:
Input three numbers (one by one): 
5
9
3
Largest Number: 9
