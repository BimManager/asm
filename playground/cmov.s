#
#	cmov.s
#	Conditional move instructions
#	using AT&T syntax
#

.section __DATA,__data
array:
	.int 1, 42, 1, 5
	.set len, (. - array) / 4

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	leaq	array(%rip), %rdi	# rip-relative addressing
	movq	$len, %rsi
	callq	_max
	movq	%rax, %rdi
	movq	$0x2000001, %rax
	syscall
_max:
	xorq	%rax, %rax
loop:
	decq	%rsi
	cmpl	%eax, (%rdi, %rsi, 4)
	cmovge	(%rdi, %rsi, 4), %rax
	cmpq	$0, %rsi
	jne	loop
	retq
	