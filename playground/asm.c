/*
 *	asm.c
 *	Inline assembly
 */

char	*msg = "Hello, world\n";

/*  inline assembly language code */
/* __asm__ [__volatile__] ("asm code"); */

/* extended assembly language code */
/* __asm__ [__volatile__] ( */
/* "asm code" : */
/* output locations : */
/* input operands : */
/* changed registers ) */
/* "constraints"(variable) */
/* To reference registers use %%rax syntax */

int	main(void)
{
  int	rnd;
  
  __asm__ __volatile__ (
      "movq	$0x2000004, %rax \n\t"
      "movq	$0x1, %rdi \n\t"
      "movq	_msg(%rip), %rsi \n\t"
      "movq	$0x10, %rdx \n\t"
      "syscall \n\t"
      );

  rnd = 42;
  __asm__ __volatile__ (
	"movq	%%rcx, %%rax \n\t" :
	"=a"(rnd) :
	"c"(rnd)
	);
  return (0);
}
