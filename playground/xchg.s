#
#	xchg.s
#	xchg instruction
#	exchanges the values of two registers,
#	or a register and a memory location
#	using AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	movq	$0x2a, %rax
	movq	$0x0, %rbx
	xchgq	%rax, %rbx
	retq


	