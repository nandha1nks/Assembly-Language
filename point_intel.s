	.file	"point.c"
	.intel_syntax noprefix
	.text
	.globl	swap
	.type	swap, @function
swap:
.LFB0:
	.cfi_startproc
	push	rbp				; stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp			; rbp <- [rsp]
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-8], rdi		; [rbp-8] <- [rdi]
	mov	QWORD PTR [rbp-16], rsi		; [rbp-16] <- [rsi]
	mov	rax, QWORD PTR [rbp-8]		; rax <- [rbp-8]
	mov	edx, DWORD PTR [rax]		; edx <- [rax]
	mov	rax, QWORD PTR [rbp-16]		; rax <- [rbp-16]
	mov	eax, DWORD PTR [rax]		; eax <- [rax]
	add	edx, eax			; edx <- [edx] + [eax]
	mov	rax, QWORD PTR [rbp-8]		; rax <- [rbp-8]
	mov	DWORD PTR [rax], edx		; [rax] <- [edx]
	mov	rax, QWORD PTR [rbp-8]		; rax <- [rbp-8]
	mov	edx, DWORD PTR [rax]		; edx <- [rax]
	mov	rax, QWORD PTR [rbp-16]		; rax <- [rbp-16]
	mov	eax, DWORD PTR [rax]		; eax <- [rax]
	sub	edx, eax			; edx <- [edx] - [eax]
	mov	rax, QWORD PTR [rbp-16]		; rax <- [rbp-16]
	mov	DWORD PTR [rax], edx		; [rax] <- [edx]
	mov	rax, QWORD PTR [rbp-8]		; rax <- [rbp-8]
	mov	edx, DWORD PTR [rax]		; edx <- [rax]
	mov	rax, QWORD PTR [rbp-16]		; rax <- [rbp-16]
	mov	eax, DWORD PTR [rax]		; eax <- [rax]
	sub	edx, eax			; edx <- [edx] - [eax]
	mov	rax, QWORD PTR [rbp-8]		; rax <- [rbp-8]
	mov	DWORD PTR [rax], edx		; [rax] <- [edx]
	nop					; does nothing
	pop	rbp				; rbp <- stack[top-0]
	.cfi_def_cfa 7, 8
	ret					; return
	.cfi_endproc
.LFE0:
	.size	swap, .-swap
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	push	rbp				; stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp			; rbp <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 16				; rsp <- [rsp] - 16
	mov	rax, QWORD PTR fs:40		; rax <- fs:40
	mov	QWORD PTR [rbp-8], rax		; [rbp-8] <- [rax]
	xor	eax, eax			; eax <- [eax] xor [eax]
	mov	DWORD PTR [rbp-16], 5		; [rbp-16] <- 5
	mov	DWORD PTR [rbp-12], 6		; [rbp-12] <- 6
	lea	rdx, [rbp-12]			; rdx <- [rbp-12] ; rdx <- 6 ; loads a pointer into a register
	lea	rax, [rbp-16]			; rax <- [rbp-12] ; rax <- 5
	mov	rsi, rdx			; rsi <- [rdx] ; rsi <- 6
	mov	rdi, rax			; rdi <- [rax] ; rdi <- 5
	call	swap				; call function swap
	mov	eax, 0				; eax <- 0
	mov	rcx, QWORD PTR [rbp-8]		; rcx <- [rbp-8]
	xor	rcx, QWORD PTR fs:40		; rcx <- rcx XOR fs:40; rcx <- 0
	je	.L4				; jump to L4
	call	__stack_chk_fail		; calls the check condition of te forloop
.L4:
	leave					; leaves the for loop
	.cfi_def_cfa 7, 8
	ret					; return
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
