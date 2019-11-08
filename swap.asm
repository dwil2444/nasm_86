; CSCI 48 - 01
; Dane A Williamson
; 11/7/19

section	.text
    global_start     ;must be declared for linker (ld)

_start:             ;tell linker entry point
   ; display both strings
   mov	edx,len1       ;message length
   mov	ecx, name   ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	edx,len2       ;message length
   mov	ecx, name2   ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
   mov rbx, [name]   ; copy name into rbx for temporary storage
   mov rax, [name2] ; copy name2 into rax for temporary storage
   mov qword[name], 0h ; clear the register
   mov qword[name2], 0h ; clear the register
   mov	qword[name],   rax   ; copy name2 value from rax into name
   mov qword[name2], rbx ; copy name value from rbx into name2
   int	0x80 
	

   ; display both stringss again 
   mov	edx,len2      ;message length
   mov	ecx,name    ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	edx,len1       ;message length
   mov	ecx,name2    ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
name db 'HI'
len1  equ  $ - name
name2 db 'HO'
len2 equ $ - name2

