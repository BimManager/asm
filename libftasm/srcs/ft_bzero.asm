;;
;;	ft_bzero.asm
;;

	global _ft_bzero
	
	section .text
_ft_bzero:
	mov	rcx, rsi
	jrcxz	end
loop1:
	mov	byte [rdi + rcx], 0h
	loop	loop1
	mov	byte [rdi], 0h
end:
	mov	rax, rdi
	ret