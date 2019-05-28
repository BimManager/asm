#
#	fpu.s
#	Advanced Arithmetic
#	using the FPU-stack	
#

.section __DATA,__data
val1:
	.int 42
val2:
	.float 42.55
val3:
	.double 1.123

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]	

.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	movq	$0x2a, %rax	# return 42
	callq	_fpu
	retq

_fpu:
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-0x10, %rsp	# align the stack

	finit
	fstsw	buffer(%rip)
	leaq	buffer(%rip), %rax
	movq	$0x4, %rdx
	fstcw	(%rax, %rdx, 1)

	filds	val1(%rip)
	flds	val2(%rip)
	fldl	val3(%rip)

	fst	%st(7)
	fxch	%st(1)

	addq	$0x4, %rdx
	fstpl	(%rax, %rdx, 1)
	addq	$0x8, %rdx
	fstps	(%rax, %rdx, 1)
	addq	$0x4, %rdx
	fstps	(%rax, %rdx, 1)

	movq	%rbp, %rsp
	popq	%rbp
	xorq	%rax, %rax
	retq