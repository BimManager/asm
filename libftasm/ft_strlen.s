#
#	ft_strlen.s
#	AT&T
#

.section __DATA,__data
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_strlen
	.p2align 4, 0x90
_ft_strlen:
	xorq	%rax, %rax
LL1B:
	cmpq	$0, (%rdi, %rax, 1)
	je	LL1E
	incq	%rax
	jmp	LL1B
LL1E:
	retq