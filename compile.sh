#!/bin/sh
nasm -f elf64 -o swap.o swap.asm
# ld -s -o absolute absolute.o
ld swap.o -o swap
./swap

#clean up
rm -rf ./swap swap.o