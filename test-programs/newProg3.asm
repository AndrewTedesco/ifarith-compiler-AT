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
	sub rsp, 160
	mov esi, 6
	mov [rbp-56], esi
	mov esi, [rbp-56]
	mov [rbp-64], esi
	mov esi, 12
	mov [rbp-48], esi
	mov esi, [rbp-48]
	mov [rbp-72], esi
	mov esi, [rbp-64]
	mov [rbp-40], esi
	mov edi, [rbp-72]
	mov eax, [rbp-40]
	imul eax, edi
	mov [rbp-40], eax
	mov esi, [rbp-40]
	mov [rbp-80], esi
	mov esi, 1
	mov [rbp-32], esi
	mov esi, [rbp-72]
	mov [rbp-24], esi
	mov edi, [rbp-32]
	mov eax, [rbp-24]
	sub eax, edi
	mov [rbp-24], eax
	mov esi, [rbp-64]
	mov [rbp-16], esi
	mov edi, [rbp-24]
	mov eax, [rbp-16]
	add eax, edi
	mov [rbp-16], eax
	mov esi, [rbp-80]
	mov [rbp-8], esi
	mov edi, [rbp-16]
	mov eax, [rbp-8]
	add eax, edi
	mov [rbp-8], eax
	mov esi, [rbp-8]
	lea rdi, [rel int_format]
	mov eax, 0
	call printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 160
	leave 
	ret 

