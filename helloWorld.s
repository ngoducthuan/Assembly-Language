section .data
    msg db "Hello World", 0xa
    len equ $ - msg
    input db 100
section .text
global  _start
_start:
    ;Print Hello World message
    mov  eax, 4
    mov  ebx, 1
    mov  ecx, msg
    mov  edx, len
    int  0x80

    ;Exit program
    mov  eax, 1
    int  0x80
