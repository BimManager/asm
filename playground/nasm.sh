nasm -fmacho64 $EXE.asm -o $EXE.o && ld -arch x86_64 -lc $EXE.o && ./a.out
