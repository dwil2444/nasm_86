#!/bin/sh
nasm -f elf64 -o linear_search.o linear_search.asm
# ld -s -o absolute absolute.o
ld linear_search.o -o linear_search
./linear_search

#clean up
rm -rf ./linear_search linear_search.o