#
#	ft_isupper.c
#	AT&T syntax
#

.section __DATA,__data
	.set A,0x41
	.set Z,0x5a
.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isupper
_ft_isupper:
	movq	$A, %rsi
	movq	$Z, %rdx
	callq	_ft_isbtwn
	retq



	