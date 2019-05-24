#
#	ft_isupper.c
#	AT&T syntax
#
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isupper
_ft_isupper:
	movq	A(%rip), %rsi
	movq	Z(%rip), %rdx
	callq	_ft_isbtwn
	retq

.section __DATA,__data
A:	.quad 0x41
Z:	.quad 0x5a
	
.section __DATA,__bss




	