#
#	malloc.s
#	Dynamic memory allocation
#	using malloc	
#

.section __DATA,__data
success:
	.asciz "%#lx bytes has been allocated. The content is %d.\n"

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]	

.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	push	%rbp
	movq	%rsp, %rbp
	pushq	%rbx		# callee-saved
	andq	$-0x10, %rsp	# align the stack
	subq	$0x10, %rsp
	
	movq	$0x10, %rdi
	callq	_malloc
	cmp	$0x0, %rax
	je	end
	
	leaq	success(%rip), %rdi
	movq	%rax, %rbx
	movq	$0x2a, (%rbx)
	movq	$0x10, %rsi
	movq	(%rbx), %rdx
	callq	_printf
	
	movq	%rbx, %rdi
	callq	_free	
end:
	popq	%rbx
	movq	%rbp, %rsp
	popq	%rbp
	xorq	%rax, %rax	# return 0
	retq
