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
	sub rsp, 256
	mov esi, 1
	mov [rbp-104], esi
	mov esi, 2
	mov [rbp-96], esi
	mov esi, [rbp-104]
	mov [rbp-88], esi
	mov edi, [rbp-96]
	mov eax, [rbp-88]
	add eax, edi
	mov [rbp-88], eax
	mov esi, [rbp-88]
	mov [rbp-16], esi
	mov esi, 2
	mov [rbp-40], esi
	mov esi, [rbp-16]
	mov [rbp-24], esi
	mov edi, [rbp-40]
	mov eax, [rbp-24]
	imul eax, edi
	mov [rbp-24], eax
	mov esi, [rbp-24]
	mov [rbp-48], esi
	mov esi, [rbp-48]
	mov [rbp-8], esi
	mov edi, [rbp-16]
	mov eax, [rbp-8]
	imul eax, edi
	mov [rbp-8], eax
	mov esi, 13
	mov [rbp-80], esi
	mov esi, [rbp-48]
	mov [rbp-72], esi
	mov edi, [rbp-80]
	mov eax, [rbp-72]
	add eax, edi
	mov [rbp-72], eax
	mov esi, 5
	mov [rbp-64], esi
	mov esi, [rbp-16]
	mov [rbp-56], esi
	mov edi, [rbp-64]
	mov eax, [rbp-56]
	add eax, edi
	mov [rbp-56], eax
	mov esi, [rbp-72]
	mov [rbp-128], esi
	mov edi, [rbp-56]
	mov eax, [rbp-128]
	add eax, edi
	mov [rbp-128], eax
	mov esi, [rbp-48]
	mov [rbp-120], esi
	mov edi, [rbp-128]
	mov eax, [rbp-120]
	add eax, edi
	mov [rbp-120], eax
	mov esi, [rbp-8]
	mov [rbp-112], esi
	mov edi, [rbp-120]
	mov eax, [rbp-112]
	add eax, edi
	mov [rbp-112], eax
	mov esi, [rbp-112]
	mov [rbp-32], esi
	mov esi, [rbp-32]
	lea rdi, [rel int_format]
	mov eax, 0
	call printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 256
	leave 
	ret 

