section .data   
    input   db "Enter number: ", 0xa
    len_in  equ $ - input
    disMe   db "You enter number: "
    len_ou  equ $ - disMe
section .bss
    num resb 5
section .text
    global _start
_start:
    ;Print message input
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, len_in
    int 0x80

    ;User input
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    int 0x80

    ;Print message output
    mov eax, 4
    mov ebx, 1
    mov ecx, disMe
    mov edx, len_ou
    int 0x80

    ;Print number output
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80

    ;Exit code
    mov eax, 1
    mov ebx, 0
    int 0x80
