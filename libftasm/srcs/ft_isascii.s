#
#	ft_isascii.s
#	AT&T syntax
#

.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isascii
_ft_isascii:
	movq	fst(%rip), %rsi
	movq	lst(%rip), %rdx
	callq	_ft_isbtwn
	retq

.section __DATA,__data
fst:	.quad 0
lst:	.quad 0x7f
	
.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	