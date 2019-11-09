section .text
    global _start 

_start:
    mov eax, len
    mov ebx, 0
    mov ecx, x
    ; mov word[largest], 0

top: mov ebx, [ecx]
    cmp ebx, [largest]
    jl greater
    add ecx, 1
    dec eax
    jnz top

; mov msg, largest
jmp exit
    
greater: mov [largest], ebx
    mov  edx, 2
    mov  ecx, largest
    mov  ebx, 1   
    mov  eax, 4   
    jmp top

exit:
    mov  edx, largelen
    mov  ecx, msg
    mov  ebx, 1   
    mov  eax, 4     
    int  0x80
    mov  edx, 2
    mov  ecx, largest
    mov  ebx, 1   
    mov  eax, 4   
    int 0x80
    mov eax, 1
    mov ebx, 0
    int 80h

section .data
    msg db "The largest digit is: "
    largelen equ $- msg
    msg2 db "The smallest digit is: "
    smallen equ $- msg2
    global x
    x:    
        dd  2
        dd  3
        dd  4
        dd  1
        dd  7
        dd  0
    len:    equ $-x

segment .bss
    largest resb 2