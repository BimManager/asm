#
#	ft_isalpha.s
#	AT&T syntax
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _ft_isalpha
_ft_isalpha:
	xorq	%rcx, %rcx
	callq	_ft_islower
	cmpq	$0x0, %rax
	jne	end
	callq	_ft_isupper
	cmpq	%rcx, %rax
	cmovz	%rcx, %rax
end:	
	retq



	