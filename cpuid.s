#
#	cpuid.s
#	Get information about the cpu
#	using AT&T syntax
#

.section __DATA,__data
L_.str:
	.asciz "The cpu is xxxxxxxxxxxx"
	.set len, . - L_.str

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	xorq	%rax, %rax
	cpuid
	leaq	L_.str(%rip), %rdi
	movq	%rbx, 0xb(%rdi)
	movq	%rdx, 0xf(%rdi)
	movq	%rcx, 0x13(%rdi)
	movq	%rdi, %rsi
	movq	$1, %rdi
	movq	$len, %rdx
	movq	$0x2000004, %rax
	syscall
	retq
	