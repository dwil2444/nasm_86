#!/bin/sh
nasm -f elf64 -o minimax.o minimax.asm
# ld -s -o absolute absolute.o
ld minimax.o -o minimax
./minimax

#clean up
rm -rf ./minimax minimax.o