SYS_WRITE equ 4
SYS_READ  equ 3
SYS_EXIT  equ 1
STDOUT    equ 1
STDIN     equ 2

section .data
    msg1     db "Enter number 1: "
    len1     equ $ - msg1
    msg2     db "Enter number 2: "
    len2     equ $ - msg2
    msg3     db "Multi two number: "
    len3     equ $ - msg3

section .bss
    num1     resb 5
    num2     resb 5
    result   resb 5

section .text
    global   _start

_start:
    ;Print message 1
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg1
    mov     edx, len1
    int     0x80

    ;Input number 1
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, num1
    mov     edx, 5
    int     0x80

    ;Print message 2
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg2
    mov     edx, len2
    int     0x80

    ;Input number 2
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, num2
    mov     edx, 5
    int     0x80

    ;Convert ASCII to number decimal
    mov     al, [num1]
    sub     al, '0'
    mov     bl, [num2]
    sub     bl, '0'
    ;MUl num1 and num2
    mul     bl
    ;COnvert to ASCII
    add     al, '0'
    mov     [result], al

    ;Print message 3
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg3
    mov     edx, len3
    int     0x80

    ;Print result
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, result
    mov     edx, 5
    int     0x80

    ;Exit program
    mov     eax, SYS_EXIT
    int     0x80
