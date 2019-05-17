#
#	ft_is.s
#	using AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_is
_ft_is:
	xorq	%rax, %rax
	cmpq	%rsi, %rdi
	jl	END
	cmpq	%rdx, %rdi
	jg	END
	movq	$0x1, %rax
END:
	retq



	