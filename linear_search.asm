section	.text
   global _start  
	
_start:	
 		
   mov  eax, len     ;number bytes to be summed 
   mov  ebx,0      ;EBX will store the sum
   mov  ecx, x     ;ECX will point to the current element to be summed

top:  add  ebx, [ecx]
   cmp qword[ecx], 7 ; compare the next element with the key
   je found
   add  ecx, 1      ;move pointer to next element
   cld
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
   db  2
   db  3
   db  4
   db  1
   db  7
   db  0
len:    equ $-x

sum: 
   db  0