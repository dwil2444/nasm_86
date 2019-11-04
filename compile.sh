#!/bin/sh
nasm -f macho64 absolute.asm && ld -macosx_version_min 10.7.0 -lSystem -o 64 absolute.o && ./64
