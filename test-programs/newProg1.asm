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
	sub rsp, 224
	mov esi, 0
	mov [rbp-96], esi
	mov esi, 0
	mov [rbp-8], esi
	mov edi, [rbp-8]
	mov eax, [rbp-96]
	cmp eax, edi
	mov [rbp-96], eax
	jz lab1274
	jmp lab1282
lab1274:	mov esi, 4
	mov [rbp-88], esi
	mov esi, 6
	mov [rbp-80], esi
	mov esi, [rbp-88]
	mov [rbp-72], esi
	mov edi, [rbp-80]
	mov eax, [rbp-72]
	add eax, edi
	mov [rbp-72], eax
	mov esi, 2
	mov [rbp-64], esi
	mov esi, 8
	mov [rbp-32], esi
	mov esi, [rbp-64]
	mov [rbp-56], esi
	mov edi, [rbp-32]
	mov eax, [rbp-56]
	imul eax, edi
	mov [rbp-56], eax
	mov esi, [rbp-72]
	mov [rbp-48], esi
	mov edi, [rbp-56]
	mov eax, [rbp-48]
	imul eax, edi
	mov [rbp-48], eax
	mov esi, [rbp-48]
	lea rdi, [rel int_format]
	mov eax, 0
	call printf
	mov rax, 0
	jmp finish_up
lab1282:	mov esi, 1
	mov [rbp-40], esi
	mov esi, 1
	mov [rbp-16], esi
	mov esi, [rbp-40]
	mov [rbp-112], esi
	mov edi, [rbp-16]
	mov eax, [rbp-112]
	add eax, edi
	mov [rbp-112], eax
	mov esi, [rbp-112]
	lea rdi, [rel int_format]
	mov eax, 0
	call printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 224
	leave 
	ret 

