    ;; nasm template
    ;; nasm -fmacho64 nasm.s && ld -macosx_version_min 10.13 -lc nasm.o && ./a.out
    ;; $ evaluates to the assembly position at the beginning of
    ;; the line containing the expression
    ;; $$ evaluates to the beginning of the current section
    ;; To get the address of RIP
    ;; call next_line
    ;; next_line:
    ;; pop  rax
    ;; To write to RIP
    ;; jmp  rax

    default rel                 ; use RIP-relative addressing modes by default, so [foo] = [rel foo]
    
    global  _main
    extern  _printf

    section .text
_main:
    mov rax, 0x02000004         ; system call for write
	mov rdi, 1                  ; file descriptor 1 => stdout
	lea rsi, [rel msg]          ; the address of the string to output;
    ;; mov rsi, msg             ; uses absolute addresssing mode
	mov rdx, msg_len            ; the length of the string
	syscall                     ; invoke operating system to do the write
    lea rdi, [rel msg]          ; the address of the string to output
    sub rsp, 0x8                ; to align the stack to a 16-byte boundary
    call    _printf             ; call printf
    add rsp, 0x8                ; restore the rsp
	mov rax, 0x02000001         ; system call for exit
    mov rdi, 0x2a               ; exit code 42
	syscall                     ; invoke operating system to exit

	section .rodata
msg:        db  "Hello, World!",0xa,0x0     ; 0xa = '\n'; 0x0 = '\0'
msg_len:    equ $-msg                       ; $ => the address of the current location

    section .bss
buffer:     resb 64             ; reserve 64 bytes

