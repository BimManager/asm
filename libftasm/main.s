#
#	main.s
#	kkozlov
#

.section __DATA,__data
L_.str:
	.asciz "Foo"
	.set len, . - L_.str
	
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
	# add a new line char
	subq	$0x4, %rsp
	movq	$0xa, 0x4(%rsp)
	leaq	0x4(%rsp), %rdi
	callq	_ft_puts
	addq	$0x4, %rsp

	# zero out a memory block
	leaq	L_.str(%rip), %rdi
	movq	$len, %rsi
	callq	_ft_bzero
	
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