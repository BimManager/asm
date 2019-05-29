;; 
;;	ft_strlen.asm
;;

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