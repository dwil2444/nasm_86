section .data ;Data segment
    userMsg db "Enter A Number: " ;Ask the user to enter a number
    lenUserMsg equ $-userMsg ;The length of the message
    dispMsg db "The Absolute Value Is: "
    lenDispMsg equ $-dispMsg

section .bss ;Uninitialized data
    num resb 5

section .text ;Code Segment

global main
main:
    ;User prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 80h
    ;Read and store the user input
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5 ;5 bytes (numeric, 1 for sign) of that information
    int 80h
    ;Output the message 'The entered number is: '

    ;
    cmp byte[num], 0
    test byte[num], 0x80000000
    jns output_answer
    js display_message

    isnegative:
        ; return the unsigned version of the number

    display_message:
        
        mov eax, 4
        mov ebx, 1
        mov ecx, dispMsg
        mov edx, lenDispMsg
        int 80h
        jmp exit


    output_answer:
        ;Output the answer string
        mov eax, 4
        mov ebx, 1
        mov ecx, dispMsg
        mov edx, lenDispMsg
        int 80h

        ; Output the number entered
        mov eax, 4
        mov ebx, 1
        mov ecx, num
        mov edx, 5
        int 80h
    
        jmp exit
    
    ; Exit code
    exit:
        mov eax, 1
        mov ebx, 0
        int 80h