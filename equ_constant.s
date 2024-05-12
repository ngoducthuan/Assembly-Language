SYS_WRITE   equ 4
STDIN       equ 0
STOUT       equ 1

section .data
    msg1    db "Hello, My name is Thuan", 0xa
    len1    equ $ - msg1
    msg2    db "You can call me Stone", 0xa
    len2    equ $ - msg2
    msg3    db "I want to become SOC analysis"
    len3    equ $ - msg3

section .text
    global _start

_start:
    ;Print message 1
    mov     eax, SYS_WRITE
    mov     ebx, STOUT
    mov     ecx, msg1
    mov     edx, len1
    int     0x80

    ;Print message 2
    mov     eax, SYS_WRITE
    mov     ebx, STOUT
    mov     ecx, msg2
    mov     edx, len2
    int     0x80

    ;Print messalsge 3
    mov     eax, SYS_WRITE
    mov     ebx, STOUT
    mov     ecx, msg3
    mov     edx, len3
    int     0x80

    ;Exit program
    mov     eax, SYS_EXIT
    int     0x80
