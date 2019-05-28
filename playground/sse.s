#
#	sse.s
#	streaming SIMD extension
#

	.text
	.globl _main
	.p2align 4,0x90
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0x20, %rsp
	movq	$0xffff, -0x8(%rbp)
	movq	$0x1001, -0x10(%rbp)
	movdqa	-0x10(%rbp), %xmm0
	fbld	arr(%rip)
	movq	$0x0, %rdi
	not	%rdi
	movq	%rdi, -0x18(%rbp)
	fbld	-0x18(%rbp)
	xorq	%rax, %rax
	movq	%rbp, %rsp
	popq	%rbp
	retq

	.data
arr:	
	.int 1,4,5,1,5
	.bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	