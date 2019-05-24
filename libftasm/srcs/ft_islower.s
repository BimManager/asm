#
#	ft_islower.s
#	AT&T syntax
#

.section __TEXT,__text,regular,pure_instructions
	.globl _ft_islower
_ft_islower:
	movq	a(%rip), %rsi
	movq	z(%rip), %rdx
	callq	_ft_isbtwn
	retq

.section __DATA,__data
a:	.quad 0x61
z:	.quad 0x7a
	
.section __DATA,__bss



	