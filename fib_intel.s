	.file	"fib.c"
	.intel_syntax noprefix
	.text
	.globl	fib
	.type	fib, @function
fib:
.LFB0:
	.cfi_startproc
	push	rbp				; stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp			; rbp <- [rsp]
	.cfi_def_cfa_register 6
	push	rbx				; stack[top-1] <- rbx
	sub	rsp, 24				; rsp <- [rsp] -24
	.cfi_offset 3, -24
	mov	DWORD PTR [rbp-20], edi		; [rbp-20] <- edi ; [rbp-20] <- 4
	cmp	DWORD PTR [rbp-20], 1		; compare [rbp-20] , 1; [rbp-20] <- 0
	je	.L2				; conditional jump to L2
	cmp	DWORD PTR [rbp-20], 2		; compare [rbp-20] , 2; [rbp-20] <- 0
	jne	.L3				; unconditional conditional jump to L3
.L2:
	mov	eax, 1				; eax <- 1
	jmp	.L4				; jump to L4
.L3:
	mov	eax, DWORD PTR [rbp-20]		; eax <- [rbp-20] ; eax <- 4
	sub	eax, 1				; eax <- [eax] - 1 ; eax <- 3
	mov	edi, eax			; edi <- [eax] ; edi <- 3
	call	fib				; calling function fib
	mov	ebx, eax			; ebx <- [eax] ; ebx <- 1
	mov	eax, DWORD PTR [rbp-20]		; eax <- [rbp-20] ; eax <- 3
	sub	eax, 2				; eax <- [eax] - 2 ; eax <- 1
	mov	edi, eax			; edi <- [eax] ; edi <- 1
	call	fib				; call function fib
	add	eax, ebx			; eax <- [eax] + [ebx] ; eax <- 1
.L4:
	add	rsp, 24				; rsp <- [rsp] + 24
	pop	rbx				; rbx <- stack[top-1];
	pop	rbp				; rbp <- stack[top-0];
	.cfi_def_cfa 7, 8
	ret					; return
	.cfi_endproc
.LFE0:
	.size	fib, .-fib
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
	mov	edi, 4				; edi <- 4
	call	fib				; call function fib
	mov	eax, 0				; eax <- 0
	pop	rbp				; rbp <- stack[top-0]
	.cfi_def_cfa 7, 8
	ret					; return
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
