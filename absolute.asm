section .data
    text db "Hello, World!", 10
    prompt db "Enter a Number", 10

section .text
    global _start

; section .bss

_start:

    # send hello world to sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 14
    syscall

    

    mov rax, 1
    mov rdi, 1 
    mov rsi, prompt
    mov rdx, 15
    syscall


    # Exit the program - sys_exit(0)
    mov rax, 60
    mov rdi, 0
    syscall