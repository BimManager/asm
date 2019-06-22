/*
 *	asm.c
 *	Inline assembly
 */

#define MAX(a, b, ret) { __asm__ __volatile__ (	\
		  "cmpq	%%rsi, %%rdi \n\t" \
		  "jge	0f \n\t" \
		  "movq	%%rsi, %%rax \n\t" \
		  "jmp 1f \n\t" \
		  "0: \n\t" \
		  "movq	%%rdi, %%rax \n\t" \
		  "1: \n\t" : \
		  "=a"(ret) : \
		  "D"(a), "S"(b) \
		); }


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
  int	x;
  int	y;
  int	res;
  char	*text;
  
  x = 0;
  y = 42;
  MAX(x, y , res);
  text = "Result: %d\n";
  
  __asm__ __volatile__ (
      "movq	$0x2000004, %rax \n\t"
      "movq	$0x1, %rdi \n\t"
      "movq	_msg(%rip), %rsi \n\t"
      "movq	$0x10, %rdx \n\t"
      "syscall \n\t"
      );

  __asm__ __volatile__ (
	"andq	$-0x10, %%rsp \n\t"
	"call	_printf \n\t" :
	: "D"(text), "S"(res) :
	  "%rsp"
	);

  rnd = 42;
  __asm__ __volatile__ (
	"movq	%%rcx, %%rax \n\t" :
	"=a"(rnd) :
	"c"(rnd)
	);

  return (0);
}
