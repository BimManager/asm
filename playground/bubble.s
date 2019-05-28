#
#	bubble.s
#	The implementation of
#	the bubble sort
#	AT&T syntax
#

.section __DATA,__data
size:	
	.int 4
arr:
	.int -1,43,42,55,11,7,8
	.set len,(. - arr) / $size
.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	
.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	leaq	arr(%rip), %rdi
	movq	$0x7, %rsi
	callq	_bubble
	retq

_bubble:
loop1:
	cmpq	$0x1, %rsi		# len > 1
	jbe	end			
	decq	%rsi			# --len
	movq	$0x0, %r9		# i = 0
loop2:					
	movq	%r9, %r8		
	incq	%r9			# ++i
	cmpq	%r9, %rsi		# len < i
	jb	loop1
	movl	(%rdi, %r8, 4), %ecx	# arr[i - 1]
	movl	(%rdi, %r9, 4), %edx	# arr[i]
	cmpl	%ecx, %edx		# arr[i] >= arr[i - 1]
	jge	loop2
	xchgl	%ecx, %edx		# swap(arr[i], arrp[i - 1])
	movl	%ecx, (%rdi, %r8, 4)
	movl	%edx, (%rdi, %r9, 4)
	jmp	loop2
end:
	movq	%rdi, %rax
	retq