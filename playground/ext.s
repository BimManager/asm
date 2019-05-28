#
#	ext.s
#	MMX integers, SSE technology and
#	FPU-stack
#

	.text
	.p2align 4
	.globl _main
_main:
	movq	arr1(%rip), %mm0	# MMX 
	movdqa	arr1(%rip), %xmm0	# SSE
	fbld	arr1(%rip)		# BCD
	filds	arr1(%rip)		# load integer into FPU stack

	movss	value1(%rip), %xmm1	# 64-bit mode
#	flds	value1@GOTPCREL(%rip)
	movdqa	value1(%rip), %xmm2
	
	flds	value1(%rip)
	fldl	value2(%rip)
	fldz				# load +0.0
	fld1				# load +1.0
	fldpi				# load 3.141
	
	leaq	buffer(%rip), %rax

	fstl	(%rax)
	fsts	(%rax)
	
	movq	%mm0, (%rax)
	movdqa	%xmm0, (%rax)
	fstl	(%rax)
	fsts	(%rax)
	fbstp	(%rax)
	xorl	%eax, %eax
	retq

	.data
arr1:
	.int 0x2a, 0x1, 0xff, 0xabcdef
data_sp:
	.float 0.25, 0.12, 42.5, 11.11
data_dp:
	.double 42.11, 24.15, 1.0008, 111.777
value1:
	.float 12.34
value2:
	.double 2353.631
	
	.bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]