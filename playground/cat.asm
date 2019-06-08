;; 
;;	cat.asm
;;	on Mac OS X
;; 	/usr/include/sys/syscall.h
;;	/usr/include/fcntl.h 
;;

	section .data

	section .bss
buffer:
	resb 4096 		; reserve 64 bytes
fd:	
	resq 1			; fd
	
	section .rodata

	section .text
	global _main
_main:
	cmp	rdi, 0x2
	jne	exit
	mov	rdi, [rsi + 8]
	call	_open
	test	rax, rax
	js	exit
	mov	[rel fd], rax
	
	mov	rdi, rax
	lea	rsi, [rel buffer]
	mov	rdx, 0x1000	; 4096
	call	_read
	
	mov	rdi, [rel fd]
	call	_close
exit:	
	ret

	;; int open(char *filepath, int flags, t_mode mode)

_open:
	mov	rax, 0x2000005	; SYS_open 5
	mov	rsi, 0x0	; O_RDONLY 0x0000
	mov	rdx, 0644	; rwxr--r--
	syscall
	ret
	
	;; int close(int fd)
_close:
	mov	rax, 0x2000006	; SYS_close 6
	syscall
	ret

	;; ssize_t read(int fd, void *buffer, size_t nbyte)
_read:
	push	rbx
	push	rbp
	push	r12

	mov	rbx, rdi
	mov	rbp, rsi
	mov	r12, rdx
loop:	
	mov	rax, 0x2000003	; SYS_read 3
	syscall
	mov	rdi, rbx
	mov	rsi, rbp
	mov	rdx, r12
	cmp	rax, 0x0
	jnz	loop
	
	pop	r12
	pop	rbp
	pop	rbx
	xor	rax, rax
	ret

	