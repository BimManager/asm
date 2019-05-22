#
#	ft_isbtwn.s
#	AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isbtwn
_ft_isbtwn:
	xorq	%rax, %rax
	cmpq	%rdi, %rsi
	jg	end
	cmpq	%rdi, %rdx
	cmovgeq	%rdx, %rax
end:
	retq



	