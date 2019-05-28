#
#	cmpxchg.s
#	cmpxchg instruction compares the dest operand
#	with the value in the rax, eax, ax, al registers.
#	If the values are equal, the value of the src operand
#	is loaded into the dest operand.	
#	If the values are not equal, then the dest operand
#	is loaded into rax, eax, ax, al.
#	using AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	movq	$0x2a, %rax	# 42
	movq	$0x1, %rbx
	movq	$0x2a, %rcx
	cmpxchgq %rbx, %rcx
	retq
	