;; 
;;	ft_strmanip.asm
;;
extern _malloc
extern _free
	
	section .data
L01:
	db "4242",0
	
	section .bss
buffer:	resb 42
	
	section .rodata
L02:
	db "4242",0
len	equ $-L02		; a constant value

	section .text
	global _main
_main:	
	lea	rdi, [rel L02]
	call	_ft_strlen
	lea	rdi, [rel L01]
	xor	rsi, rsi
	mov	rdx, rax
	call	_ft_memset
	lea	rdi, [rel buffer]
	lea	rsi, [rel L02]
	call	_ft_strcpy
	lea	rdi, [rel L02]
	call	_ft_strdup
	mov	rdi, rax
	push	rdi
	call	_ft_puts
	pop	rdi
	sub	rsp, 0x8
	call	_free
	add	rsp, 0x8
	xor	rax, rax
	ret

;; size_t strlen(const char *s)
_ft_strlen:
	xor	al, al		; search for z
	mov	ecx, -0x1
	lahf
	and	ah, ~0x40	; clear ZF
	sahf
	cld			; clear DF
	repne scasb		; AL - byte ptr [RDI]
	neg	ecx
	sub	ecx, 0x2
	mov	eax, ecx
	ret

;; void *memset(void *b, int c, size_t len)
_ft_memset:
	mov	al, sil
	mov	ecx, edx
	mov	rdx, rdi	; store rdi
	cld			; clear DF
	rep stosb
	mov	rax, rdx
	ret

;;  char *strcpy(char *dst, char *src)
_ft_strcpy:
	mov	rdx, rdi
	mov	rdi, rsi
	call	_ft_strlen
	mov	ecx, eax
	inc	ecx
	mov	rdi, rdx
	rep movsb
	mov	rax, rdx
	ret
	
;; char *strdup(const char *s1)
_ft_strdup:
	push	rbp
	mov	rbp, rsp
	push	rbx
	mov	rbx, rdi
	
	call	_ft_strlen
	
	mov	rdi, rax
	inc	rdi
	and	rsp, -0x10	; align the stack
	call	_malloc
	
	mov	rdi, rax
	mov	rsi, rbx
	mov	rbx, rdi
	call	_ft_strcpy

	mov	rax, rbx
	pop	rbx
	mov	rsp, rbp
	pop	rbp
	ret

_ft_puts:
	push	rbx
	push	r12
	mov	rbx, rdi
	xor	r12, r12
loop:
	cmp	byte [rdi + r12], 0x0
	je	end
	mov	eax, 0x2000004
	lea	rsi, [rdi + r12]
	mov	rdi, 0x1
	mov	rdx, 0x1
	syscall
	inc	r12
	mov	rdi, rbx
	jmp	loop
end:
	xor	eax, eax
	pop	r12
	pop	rbx
	ret
	
	