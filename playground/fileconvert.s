#
#	fileconvert.s
#	mac OS X
#

#.section __DATA,__data
	.data
L01:
	.asciz "Foo, Bar, Baz"
	.byte 42
	
	.const_data
	
	.bss
	.lcomm fd,8,4
	.lcomm size,8,4
	.lcomm addr,8,4
	
	.text
	.macosx_version_min 10,13
	.globl _main
_main:
	cmpq	$0x2, %rdi
	jnz	exit

	# get a fd
	movq	0x8(%rsi), %rdi
	callq	_ft_open
	testq	%rax, %rax
	js	exit
	movq	%rax, fd(%rip)

	# work out the size
	movq	%rax, %rdi
	callq	_filesize
	testq	%rax, %rax
	js	exit
	movq	%rax, size(%rip)

	# map the file into memory
	movq	fd(%rip), %rdi
	movq	size(%rip), %rsi
	callq	_ft_mmap
	cmpq	$0x1, %rax
	je	close
	movq	%rax, addr(%rip)

	# modify the content
#	movq	%rax, %rdi
#	callq	_ft_toupper

	# unmap
	movq	fd(%rip), %rdi
	movq	size(%rip), %rsi
	callq	_ft_munmap
close:	
	movq	fd(%rip), %rdi
	callq	_ft_close
	movq	$0x0, fd(%rip)
exit:
	movq	fd(%rip), %rax
	testq	%rax, %rax
	jnz	close
	retq

# off_t lseek(int fildes, off_t offset, int whence) 
_filesize:
	movq	$0x0, %rsi		# offset = 0
	movq	$0x2, %rdx		# SEEK_END = 0x2
	movq	$0x2000199, %rax	# SYS_lseek = 199
	syscall
	ret
	
# int open(const char *path, int oflag, mod_t mode)
_ft_open:
	movq	$0x2000005, %rax	# SYS_open = 0x5
	movq	$0x2, %rsi		# O_RDWR = 0x2
	movq	$0644, %rdx		# rwxr--r--
	syscall
	ret
	
_ft_close:	
	movq	$0x2000006, %rax	# SYS_close = 0x6
	syscall
	ret

# mmap(void *addr, size_t len, int prot, int flags, int fd, off_t offset)
_ft_mmap:
	movq	%rdi, %r8		# fd 
	xorl	%edi, %edi		# addr = 0
	movq	$0x1, %rdx		# prot = PROT_READ | PROT_WRITE
	movq	$0x0, %rcx		# flags = MAP_SHARED (1) [MAP_FILE (0)]
	xorl	%r9d, %r9d		# offset = 0
	movq	$0x20000c5, %rax	# SYS_mmap = 197
	syscall
	retq

# int mummap(void *addr, size_t len)
_ft_munmap:
	movq	$0x2000049, %rax	# SYS_munmap (73)
	syscall
	retq

# int msync(void *addr, size_t len, int flags)
_ft_msync:
	movq	$0x0, %rdx		# flags = 0
	movq	$0x2000041, %rax	# SYS_msync (65)
	syscall
	retq

_ft_toupper:
	xorq	%rax, %rax
loop1:
	cmpb	$0x61, (%rdi)
	jl	skip
	cmpb	$0x7a, (%rdi)
	jg	skip
	subq	$0x20, (%rdi)
skip:	
	scasb
	jnz	loop1
	retq