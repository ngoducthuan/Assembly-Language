SYS_WRITE equ 4
SYS_READ  equ 3
SYS_EXIT  equ 1
STDOUT    equ 1
STDIN     equ 2

section .data
    msg     db  "Enter number from 0 to 9: "
    len     equ $ - msg
    msg1    db  "The number is odd."
    len1    equ $ - msg1
    msg2    db  "The number is even."
    len2    equ $ - msg2 
section .bss
    num     resb  5
section .text
    global  _start
_start:
    ;Print message 
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg
    mov     edx, len
    int     0x80

    ;Input number
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, num
    mov     edx, 5
    int     0x80
    
    ;Start check number
    mov     eax, [num]
    and     eax, 1
    jz      even_step
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg1
    mov     edx, len1
    int     0x80
    jmp     exit_program

even_step:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg2
    mov     edx, len2
    int     0x80

exit_program:
    mov     eax, SYS_EXIT
    int     0x80   
