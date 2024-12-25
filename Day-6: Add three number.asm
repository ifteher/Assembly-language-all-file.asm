.model small        ; Specify the small memory model
.stack 100h         ; Allocate 256 bytes of stack space

.data
msg db ?            ; Declare an uninitialized variable `msg` to store the final result

.code
main proc
    ; Read the first digit from user input
    mov ah, 1        ; DOS function to read a single character from the keyboard
    int 21h          ; Call interrupt 21h
    mov bl, al       ; Store the first input character (ASCII) into BL register

    ; Read the second digit from user input
    mov ah, 1        ; DOS function to read a single character from the keyboard
    int 21h          ; Call interrupt 21h
    mov bh, al       ; Store the second input character (ASCII) into BH register

    ; Read the third digit from user input
    mov ah, 1        ; DOS function to read a single character from the keyboard
    int 21h          ; Call interrupt 21h
    mov cl, al       ; Store the third input character (ASCII) into CL register

    ; Add the first two digits
    add bl, bh       ; Perform addition: BL = BL + BH (ASCII values are added)
    sub bl, 48       ; Convert the result from ASCII to numeric: BL = BL - 48

    ; Store the intermediate addition result in CH
    mov ch, bl       ; Copy the result in BL to CH for further calculation

    ; Add the third digit to the intermediate result
    add ch, cl       ; Perform addition: CH = CH + CL (ASCII values are added)
    sub ch, 48       ; Convert the result from ASCII to numeric: CH = CH - 48

    ; Store the final result in `msg`
    mov msg, ch      ; Save the final result into the `msg` variable

    ; Display the result
    mov ah, 2        ; DOS function to display a single character
    mov dl, msg      ; Move the final result (ASCII character) into DL for display
    int 21h          ; Call interrupt 21h to display the result

    ; Exit the program
    exit:
    mov ah, 4Ch      ; DOS function to terminate the program
    int 21h          ; Call interrupt 21h to terminate the program

main endp
end main


;#output:
First digit: 1
Second digit: 2
Third digit: 3

Result: 6
