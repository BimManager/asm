#
#	exit.s
#
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	# prologue
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0x4, %rsp
	###
	movq	$0x29, -0x4(%rbp)
	incq	-0x4(%rbp)
	movl	-0x4(%rbp), %eax
	# epilogue
	popq	%rbp
	addq	$0x4, %rsp
	retq
	###
	