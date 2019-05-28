#
#	pnt.s
#	A point struct
#	struct s_point
#	{
#	  int x;
#	  int y;
#	}	
#

.section __DATA,__data

.section __DATA,__bss
	.lcomm buffer,256,4	# .lcomm name, size [, align]
	.comm x,4,4
	.comm y,4,4

.section __TEXT,__text,regular,pure_instructions
	.globl _main
_main:
	movq	$1, x(%rip)
	movq	$-2, y(%rip)
	retq
