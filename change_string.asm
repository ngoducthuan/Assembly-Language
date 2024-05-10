section .data 
    name    db "Zara Ali", 0xa
    len     equ $ - name
    len2    equ  10
section .text
    global  _start
_start:
    ;Writing the name Zara Ali
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, name
    mov     edx, len
    int     0x80

    ;Change characters in strings
    mov     [name], dword "Nuhu"   ;Dword has 4 byte, so maximum characters are 4
    
    ;Replace A to H
    mov     [name+5], byte "H"     

    ;Writing the name Nuha  Ali
    mov     eax, 4
    mov     ebx, 1
    mov     ecx, name
    mov     edx, len2
    int     0x80

    mov     eax, 1
    int     0x80
