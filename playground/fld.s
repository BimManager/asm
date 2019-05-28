#
#	fld.s
#	FPU stack for working
#	with floating-point numbers
#

.section __DATA,__data
val1:
	.float 1.5
val2:
	.double 42.5

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]	

.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$0x20, %rsp
	
	flds	val1(%rip)
	fldl	val2(%rip)

	fstpl	-0x8(%rbp)
	fstps	-0xc(%rbp)

	movq	%rbp, %rsp
	popq	%rbp
	retq
