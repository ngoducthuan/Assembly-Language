SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3
STDOUT equ 1
STDIN equ 0
section .bss
    num1    resb 5
    num2    resb 5
    result  resb 5
section .data
    msg1    db  "Enter first number: "
    len1    equ $ - msg1
    msg2    db "Enter second number: "
    len2    equ $ - msg2
    msg3    db "Sum of two number: "
    len3    equ  $ -msg3

section .text
    global  _start
_start:
    ;Print message 1
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg1
    mov     edx, len1
    int     0x80

    ;Input number 1
    mov     eax, SYS_READ
    mov     ebx, 2
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
    mov     ebx, 2
    mov     ecx, num2
    mov     edx, 5
    int     0x80

    ;Convert num1 and num2 to decimal number
    mov     eax, [num1]
    sub     eax, '0'

    mov     ebx, [num2]
    sub     ebx, '0'
    ;Add two number
    add     eax, ebx
    ;Convert sum from decimal number to ASCII
    add     eax, '0'
    ;Storing in result
    mov     [result], eax

    ;Print messagr 3
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
