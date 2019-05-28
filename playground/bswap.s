#
#	bswap.s
#	bswap instuction reverses the byte order in a register
#	using AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	movq	$0x2a, %rax	# return 42
	bswapq	%rax
	retq
	