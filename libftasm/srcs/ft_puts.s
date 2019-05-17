#
#	ft_puts.s
#	kkozlov
#
.section __DATA,__data

.section __TEXT,__text,regular,pure_instructions
	.globl	_ft_puts
	.p2align 4, 0x90
_ft_puts:
	pushq	%rbx
	pushq	%r12

	movq	%rdi, %rbx
	movq	$0, %r12
LL1B:
	movq	$0x2000004, %rax
	movq	$1, %rdi	
	movq	%rbx, %rsi
	addq	%r12, %rsi
	movq	$1, %rdx
	
	cmpb	$0, (%rsi)
	je 	LL1E
	syscall

	incq	%r12
	jmp	LL1B
LL1E:
	popq	%r12
	popq	%rbx
	retq