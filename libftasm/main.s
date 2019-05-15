#
#	main.s
#	kkozlov
#

.section __DATA,__data
L_.str:
	.asciz "Foo"

.section __TEXT,__text,regular,pure_instructions
	.globl _main
	.p2align 4, 0x90
_main:
	pushq	%rbx
	pushq	%r12
	pushq	%r13

	movq	%rdi, %rbx
	movq	%rsi, %r12
LL1_S:	
	cmpq	$0, %rbx
	je	LL1_E
	movq	(%r12), %rdi
	callq	_ft_puts
	decq	%rbx
	leaq	0x8(%r12), %r12
	jmp	LL1_S
LL1_E:
	xorq	%rax, %rax
	popq	%r13
	popq	%r12
	popq	%rbx
	retq


#_main:
#	leaq	L_.str(%rip), %rdi
#	callq	_ft_puts
#	xorq	%rax, %rax
#	retq	