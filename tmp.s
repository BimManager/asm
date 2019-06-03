#
#	tmp.s
#	AT&T syntax template
#	as -arch x86_64 tmp.s -o tmp.o &&
#	ld -arch x86_64 -macosx_version_min 10.13 -lc tmp.o	
#	OS X Assembler Reference	
#

#.section __DATA,__data
	.data
L01:		
	.byte 42
	.short 42
	.long 42
	.quad 42
	
	.float 42.00
	.double 42.00

	.fill 69,4,0xfeadface # .fill rep_expr,fill_size,fill_expr

	
	.const_data
L02:
	.asciz "42"
	.equ len, .-L02

	
#.section __DATA,__bss
	.bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	.comm g_buffer,256,4	# common symbol

	
#.section __TEXT,__text,regular,pure_instructions
	.text
	.macosx_version_min 10,13
	.globl _main
_main:
	movq	$0x2a, %rax	# return 42
	retq
