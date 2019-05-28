;; 
;;	tmp.asm
;; 	Intel syntax template
;; 	nasm -fmacho64 tmp.asm -o tmp.o &&
;; 	ld -lc tmp.o
;; 	nasm.us (Chapter 3)
;;

	extern printf
	
	section .data
L01:
	db 42
	dw 42
	dd 42
	dq 42
	
	dd 1.234
	dq 1.234
	dt 1.234

	section .bss
buffer:	resb 64 		; reserve 64 bytes
	resw 1			; reserve a word
	resq 10			; reserve ten quads
	resy 1			; one YMM register
	resz 32			; 32 ZMM registers
	
	section .rodata
L02:
	db "42",0
len	equ $-L02		; a constant value

	section .text
	global _main
_main:
	mov	rax, 0x2a
	ret