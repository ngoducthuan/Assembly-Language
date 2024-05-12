;Note, %assign can be used to define numberic constant.
;We can redefinition.
;%define allow define both numberic and string constant
%assign TOTAL 0
;%assign TOTAL 20

section .data
    msg     db "Call me Stone", 0xa
    %assign TOTAL $ - msg
section .text
    global _start
_start:
    ;Print Total
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, msg
    mov     edx, TOTAL
    int     0x80

    ;Change Character
    mov     [msg+5], byte "M"
    ;Print message 2
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, msg
    mov     edx, TOTAL
    int     0x80

    ;Exit program
    mov     eax, 1
    int     0x80
