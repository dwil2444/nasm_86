In order to compile and run the code, use the following instructions on a Linux x86_64 machine: 

nasm -f elf64 -o [filename].o [filename].asm
ld [filename].o -o [filename]
./[filename]