#
#	ft_islower.s
#	AT&T syntax
#

.section __DATA,__data
	.set a,0x61
	.set z,0x7a
.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_islower
_ft_islower:
	movq	$a, %rsi
	movq	$z, %rdx
	callq	_ft_isbtwn
	retq



	