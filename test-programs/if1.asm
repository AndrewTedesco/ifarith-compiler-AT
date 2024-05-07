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
	mov esi, 1
	mov [rbp-72], esi
	mov esi, 0
	mov [rbp-8], esi
	mov edi, [rbp-8]
	mov eax, [rbp-72]
	cmp eax, edi
	mov [rbp-72], eax
	jz lab1270
	jmp lab1274
lab1270:	mov esi, 1
	mov [rbp-16], esi
	mov esi, 2
	mov [rbp-64], esi
	mov esi, [rbp-16]
	mov [rbp-56], esi
	mov edi, [rbp-64]
	mov eax, [rbp-56]
	add eax, edi
	mov [rbp-56], eax
	mov esi, [rbp-56]
	lea rdi, [rel int_format]
	mov eax, 0
	call printf
	mov rax, 0
	jmp finish_up
lab1274:	mov esi, 3
	mov [rbp-48], esi
	mov esi, 4
	mov [rbp-40], esi
	mov esi, [rbp-48]
	mov [rbp-32], esi
	mov edi, [rbp-40]
	mov eax, [rbp-32]
	imul eax, edi
	mov [rbp-32], eax
	mov esi, [rbp-32]
	lea rdi, [rel int_format]
	mov eax, 0
	call printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 160
	leave 
	ret 

