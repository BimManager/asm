;;
;;	deref.asm
;;

	section .text
	global _main
_main:
	mov	rax, 2000001h
	mov	rdi, [rel foo]
	mov	rsi, foo
	mov	rdx, [abs foo]	
	mov	rcx, [foo]
	syscall
	
	section .data
foo	dw	4