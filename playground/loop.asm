;; 
;;	loop.asm
;; 	LOOP instruction
;; 

	global _main

	section .text
_main:
	;; write(int fd, char *s, int len)
	mov	rbx, 10
loop1:
	mov	rax, 2000004h
	mov	rdi, 1
	mov	rsi, $msg
	mov	rdx, 13
	syscall
	dec	rbx
	cmp	rbx, 0
	jne	loop1

	mov	rdi, $msg
	mov	rsi, 0
	call	_ft_bzero
	
	mov	rax, 2000001h
	mov	rbx, 0h
	syscall

_ft_bzero:	
	mov	rcx, rsi
	jrcxz	end
loop2:
	mov	byte [rdi + rcx], 0
	loop	loop2
	mov	byte [rdi + rcx], 0
	mov	rax, rdi
end:	
	ret
	
	section .data
msg:
	db	"Hello, world", 10 ; note the newline at the end
len:
	db	$ - msg
	