#
#	ft_isdigit.s
#	AT&T syntax
#

.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isdigit
_ft_isdigit:
	movq	zero(%rip), %rsi
	movq	nine(%rip), %rdx
	callq	_ft_isbtwn
	retq

.section __DATA,__data
zero:	.quad 0x30
nine:	.quad 0x39
	
.section __DATA,__bss



	