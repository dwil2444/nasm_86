section .data
 
numbers_list:
    long 3,76,34,23,68,35,57,89,12,4,99,86,33,144,0
 
section .text
 
global _start
 
_start:
    movl 0, edi
loop:
    movl numbers_list(edi,4), eax
    cmpl 35, eax
    je finish
    cmpl 0, eax
    je not_found
    incl edi
    jmp loop
 
not_found:
    movl 255, ebx
 
finish:
    movl 1, eax
    movl edi, ebx
    int 0x80