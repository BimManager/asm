#
#	ft_isdigit.s
#	AT&T syntax
#

.section __DATA,__data
	.set zero,0x30
	.set nine,0x39
.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isdigit
_ft_isdigit:
	movq	$zero, %rsi
	movq	$nine, %rdx
	callq	_ft_isbtwn
	retq



	