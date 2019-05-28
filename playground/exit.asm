;;
;;	exit.asm
;; 	Intel syntax
;;
	global _main
	
	section .text
_main:
	mov rax, 2000001h
	mov rdi, 42
	syscall
