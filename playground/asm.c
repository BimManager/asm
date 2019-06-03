/*
 *	asm.c
 *	Inline assembly
 */

char	*msg = "Hello, world\n";

int	main(void)
{
  asm(
      "\n\tmovq	$0x2000004, %rax"
      "\n\tmovq	$0x1, %rdi"
      "\n\tmovq _msg(%rip), %rsi"
      "\n\tmovq	$0x10, %rdx"
      "\n\tsyscall"
      );
  return (0);
}
