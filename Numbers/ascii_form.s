section .data
    msg     db "Sum of two number: "
    len     equ $ - msg
section .bss
    sum     resb 5
section .text
    global  _start
_start:
    ;Move 5 to eax, 4 to ebx
    mov     eax, "5"
    sub     eax, "0"
    mov     ebx, "4"
    sub     ebx, "0"

    add     eax, ebx
    add     eax, "0"

    mov     [sum], eax

    ;Print message
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, msg
    mov     edx, len
    int     0x80

    ;Move value number to ecx
    mov     ecx, sum
    
    ;Print number
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, sum
    mov     edx, 5
    int     0x80

    ;Exit program
    mov     eax, 1
    int     0x80
