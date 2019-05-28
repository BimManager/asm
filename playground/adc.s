#
#	adc.s
#	ADC instruction
#	to add large numbers and carry overflow	
#

.section __DATA,__data
	.p2align 4,0x90
num1:
	.int 3123123123
num2:
	.int 2123123123
print:
	.asciz "The value is %qd\n"

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]	

.section __TEXT,__text,regular,pure_instructions
	.p2align 4,0x90
	.globl _main
_main:
	movl	num1(%rip), %eax
	xorl	%ebx, %ebx	
	movl	num2(%rip), %esi
	xorl	%edx, %edx
	addl	%eax, %esi
	adcl	%ebx, %edx
	shlq	$0x1f, %rdx
	addq	%rdx, %rsi
	pushq	%rsp
	andq	$-0x10, %rsp	# align the stack

	leaq	print(%rip), %rdi
	callq	_printf
	popq	%rsp
	retq
