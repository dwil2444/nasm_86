#!/bin/sh
nasm -f elf64 -o absolute.o absolute.asm
# ld -s -o absolute absolute.o
ld absolute.o -o absolute
./absolute

#clean up
rm -rf ./absolute absolute.o