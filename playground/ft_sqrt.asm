;; 
;;	ft_sqrt.asm
;;

	extern _printf
	
	section .data
L01:
	dq 42.00
	
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
L03:
	db "The sqrt of %f is %f.",0ah,0h

	section .text
	global _main
_main:
	push	rbp
	mov	rbp, rsp
	
	movsd	xmm0, [rel L01]
	call	_ft_sqrt
	lea	rdi, [rel L03]
	movsd	xmm1, xmm0
	movsd	xmm0, qword [rel L01]
	
	and	rsp, -0x10
	call	_printf
	mov	rax, 0x2a

	mov	rsp, rbp
	pop	rbp
	ret

;; 	.type _ft_sqrt,@function 
;; double sqrt(double x)
;; %xmm0-%xmm1 for passing and
;; retutrning floating-point arguments
_ft_sqrt:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 0x20
	
	finit
	movsd	[rbp - 0x8], xmm0
	fld	qword [rbp - 0x8]
	fld1
	fld1
	faddp
	fld1
	fld1
	mov	rcx, 0x20
loop:
	fdivr	st0, st3	; S / Xn
	fdiv	st0, st2	; (S / Xn) / 2
	fxch	st2		;
	fdiv	st1, st0	; Xn / 2
	fxch	st2
	faddp			; (S / Xn) / 2 + Xn / 2
	fst	qword [rbp - 0x8]
	fld	qword [rbp - 0x8]
	fcomi	st3		; (Xn + S / Xn) /2 - S
	loop	loop
	movsd	xmm0, qword [rbp - 0x8]
	
	mov	rsp, rbp
	pop	rbp
	ret