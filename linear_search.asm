section	.text
   global _start  
	
_start:	
 		
   mov  eax, len     ;number bytes to be summed 
   mov  ebx,0      ;EBX will store the sum
   mov  ecx, x     ;ECX will point to the current element to be summed

top: mov  ebx, [ecx]
   cmp ebx, 2
   je found
   add  ecx, 1      ;move pointer to next element
   dec  eax        ;decrement counter
   jnz  top        ;if counter not 0, then loop again

jmp exit


; display success message
found:
   mov  edx, len1      ;message length
   mov  ecx, msg   ;message to write
   mov  ebx, 1     ;file descriptor (stdout)
   mov  eax, 4     ;system call number (sys_write)
   int  0x80       ;call kernel
	
   mov  eax, 1     ;system call number (sys_exit)
   int  0x80       ;call kernel

; display error message
exit:
    mov  edx, len2 
    mov  ecx, failmsg  
    mov  ebx, 1     
    mov  eax, 4     
    int  0x80       
    mov eax, 1
    mov ebx, 0
    int 80h

section	.data
msg db 'Found'
len1  equ  $ - msg
failmsg db 'Not Found'
len2  equ  $ - failmsg
global x
x:    
   dd  2
   dd  3
   dd  4
   dd  1
   dd  7
   dd  0
len:    equ $-x