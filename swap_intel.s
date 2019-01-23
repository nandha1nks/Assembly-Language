	.file	"swap.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp			; stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp		; rbp <- [rsp]
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-8], 5	; [rbp-8] <- 5
	mov	DWORD PTR [rbp-4], 6	; [rbp-4] <- 6
	mov	eax, DWORD PTR [rbp-4]	; eax <- [rbp-4] ; eax <- 6
	add	DWORD PTR [rbp-8], eax	; [rbp-8] <- [rbp-8] + [eax] ; [rbp-8] <- 11
	mov	eax, DWORD PTR [rbp-8]	; eax <- [rbp-8] ; eax <- 11
	sub	eax, DWORD PTR [rbp-4]	; eax <- [eax] - [rbp-4] ; eax <- 5
	mov	DWORD PTR [rbp-4], eax	; [rbp-4] <- [eax] ; [rbp-4] <- 5
	mov	eax, DWORD PTR [rbp-4]	; eax <- [rbp-4] ; eax <- 5
	sub	DWORD PTR [rbp-8], eax	; [rbp-8] <- [rbp-8] - [eax] ; [rbp-8] <- 6
	mov	eax, 0			; eax <- 0
	pop	rbp			; rbp <- stack[top-0]
	.cfi_def_cfa 7, 8
	ret				; return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
