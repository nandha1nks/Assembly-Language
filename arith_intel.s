	.file	"arith.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp			;stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp		; rbp <- [rsp]
	.cfi_def_cfa_register 6
	mov	DWORD PTR [rbp-24], 5	; [rbp-24] <- 5
	mov	DWORD PTR [rbp-20], 7	; [rbp-20] <- 7
	mov	edx, DWORD PTR [rbp-24] ; edx <- [rbp-24] ; edx <- 5
	mov	eax, DWORD PTR [rbp-20]	; eax <- [rbp-20] ; eax <- 7
	add	eax, edx		; eax <- [eax]+[edx] ; eax <- 12
	mov	DWORD PTR [rbp-16], eax	; [rbp-16] <- [eax] ; [rbp-16] <- 12
	mov	eax, DWORD PTR [rbp-24]	; eax <- [rbp-24] ; eax <- 5
	sub	eax, DWORD PTR [rbp-20]	; eax <- [eax] - [rbp-20] ; eax <- -2
	mov	DWORD PTR [rbp-12], eax	; [rbp-12] <- [eax] ; [rbp-12] <- -2
	mov	eax, DWORD PTR [rbp-24]	; eax <- [rbp-24] ; eax <- 5
	imul	eax, DWORD PTR [rbp-20] ; eax <- [eax] * [rbp-20] ; eax <- 35
	mov	DWORD PTR [rbp-8], eax	; [rbp-8] <- [eax] ; [rbp-8] <- 35
	mov	eax, DWORD PTR [rbp-24]	; eax <- [rbp-24] ; eax <- 5
	cdq				; converts eax into eax and edx
	idiv	DWORD PTR [rbp-20]	; eax <- [eax] / [rbp-20] , edx <- [eax] % [rbp-20] ; eax <- 0, edx <- 5
	mov	DWORD PTR [rbp-4], eax	; [rbp-4] <- [eax] ; [rbp-4] <- 0
	mov	eax, 0			; [eax] <- 0
	pop	rbp			; rbp <- stack[top -0]
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
