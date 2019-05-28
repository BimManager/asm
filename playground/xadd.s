#
#	xadd instruction exchanges two values
#	and stores their sum in the dest operand
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	movq	$0x2a, %rax
	movq	$0x10, %rbx
	xaddq	%rbx, %rax
	retq
	