SYS_WRITE equ 4
SYS_READ  equ 3
SYS_EXIT  equ 1
STDIN     equ 2
STDOUT    equ 1

section .data
    msg     db "The largest number is "
    len     equ $ - msg
    msg1    db "Enter number 1: "
    len1    equ $ - msg1
    msg2    db "Enter number 2: "
    len2    equ $ - msg2
    msg3    db "Enter number 3: "
    len3    equ $ - msg3
section .bss
    num1    resb 5
    num2    resb 5
    num3    resb 5
    largest resb 5
section .text
    global _start
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

    ;Print message 3
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg3
    mov     edx, len3
    int     0x80

    ;Input number 3
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, num3
    mov     edx, 5
    int     0x80

    ;Start find largest number
    mov     ecx, [num1]
    cmp     ecx, [num2]
    jg      compare_3th_number
    mov     ecx, [num2]

compare_3th_number:
    cmp     ecx, [num3]
    jg      print_message
    mov     ecx, [num3]

print_message:
    mov     [largest], ecx

    ;Print message 
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg
    mov     edx, len
    int     0x80

    ;Print message 
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, largest
    mov     edx, 5
    int     0x80

    ;Exit program
    mov     eax, 1
    int     0x80


