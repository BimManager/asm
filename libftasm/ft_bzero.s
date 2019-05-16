#
#	ft_bzero.s
#	using AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions

	.globl _ft_bzero
_ft_bzero:
LL1_S:
	cmpq	$0x0, %rsi
	je	LL1_E
	decq	%rsi
	movb	$0x0, (%rdi, %rsi, 1)
	jmp	LL1_S
LL1_E:
	xorq	%rax, %rax
	retq
	