;; 
;;	ft_cat.asm
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
buffer:
	resb 4096 		; reserve 4 KB
bufsize equ $ - buffer	

	section .text
	global _main
_main:
	push	rbx
	xor	rbx, rbx
	cmp	rdi, 2h
	jnz	stdin
	mov	rdi, [rsi + 8h]
	xor	rsi, rsi
	mov	rax, 2000005h	; sys_open 5
	syscall
	test	rax, rax
	js	end
	mov	rbx, rax
	mov	rdi, rbx
	jmp	cat
stdin:	
	xor	rdi, rdi
cat:	
	call	_ft_cat
	test	rbx, rbx
	jz	exit
	mov	rdi, rbx
	mov	rax, 2000006h	; sys_close 6
	syscall
exit:	
	mov	rax, 0x2a
	pop	rbx
	ret

_ft_cat:
	push	rbx
	mov	rbx, rdi	; keep fd
loop1:
	mov	rdi, rbx
	lea	rsi, [rel buffer]
	mov	rdx, bufsize
	mov	rax, 2000003h	; sys_read 3
	syscall
	test	rax, rax
	jz	end
	mov	rdi, 1
	lea	rsi, [rel buffer]
	mov	rdx, rax
	mov	rax, 2000004h	; sys_write 4
	syscall
	jmp	loop1
end:
	pop	rbx
	ret
	