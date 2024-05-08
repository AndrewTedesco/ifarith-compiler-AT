section .data
	int_format db "%ld",10,0


	global _main
	extern printf
section .text


_start:	call main
	mov rax, 60
	xor rdi, rdi
	syscall


main:	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov esi, 42
	mov [rbp-8], esi
	mov rax, [rbp-8]
	jmp finish_up
finish_up:	add rsp, 16
	leave 
	ret 

