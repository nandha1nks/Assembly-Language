	.file	"exchange.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp				; stack[top-0] <- rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp			; rbp <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 80				; rsp <- [rsp] - 80
	mov	rax, QWORD PTR fs:40		; rax <- fs:40
	mov	QWORD PTR [rbp-8], rax		; [rbp-8] <- [rax]
	xor	eax, eax			; eax <- [eax] xor [eax]
	mov	DWORD PTR [rbp-64], 3		; [rbp-64] <- 3
	mov	DWORD PTR [rbp-60], 5		; [rbp-60] <- 5
	mov	DWORD PTR [rbp-56], 1		; [rbp-56] <- 1
	mov	DWORD PTR [rbp-52], 2		; [rbp-52] <- 2
	mov	DWORD PTR [rbp-48], 4		; [rbp-48] <- 4
	mov	DWORD PTR [rbp-32], 1		; [rbp-32] <- 1
	mov	DWORD PTR [rbp-28], 2		; [rbp-28] <- 2
	mov	DWORD PTR [rbp-24], 3		; [rbp-24] <- 3
	mov	DWORD PTR [rbp-20], 4		; [rbp-20] <- 4
	mov	DWORD PTR [rbp-16], 5		; [rbp-16] <- 5
	mov	DWORD PTR [rbp-68], 0		; [rbp-68] <- 0
	jmp	.L2				; jump to L2
.L3:
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-64] ; eax <- 0
	cdqe					; converts eax into edx
	mov	edx, DWORD PTR [rbp-64+rax*4]	; edx <- [rbp-64+raw*4] ; edx <- 3
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	eax, DWORD PTR [rbp-32+rax*4]	; eax <- [rbp-32+raw*4] ; eax <- 1
	add	edx, eax			; edx <- [edx] + [eax] ; edx <- 4
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	DWORD PTR [rbp-64+rax*4], edx	; [rbp-64+raw*4] <- edx ; [rbp-64+raw*4] <- 4
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	edx, DWORD PTR [rbp-64+rax*4]	; edx <- [rbp-64+raw*4] ; edx <- 3
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	eax, DWORD PTR [rbp-32+rax*4]	; eax <- [rbp-32+raw*4] ; eax <- 1
	sub	edx, eax			; edx <- [edx] - [eax] ; edx <- 2
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	DWORD PTR [rbp-32+rax*4], edx	; [rbp-32+raw*4] <- edx ; edx <- 1
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	edx, DWORD PTR [rbp-64+rax*4]	; edx <- [rbp-64+rax*4] ; edx <- 3
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0					;
	mov	eax, DWORD PTR [rbp-32+rax*4]	; eax <- [rbp-32+raw*4] ; eax <- 1
	sub	edx, eax			; edx <- [edx] - [eax] ; edx <- 2
	mov	eax, DWORD PTR [rbp-68]		; eax <- [rbp-68] ; eax <- 0
	cdqe					; same as above
	mov	DWORD PTR [rbp-64+rax*4], edx	; [rbp-64+raw*4] <- edx ; [rbp-64+raw*4]  <- 2
	add	DWORD PTR [rbp-68], 1		; [rbp-68] <- [rbp-68] + 1
.L2:
	cmp	DWORD PTR [rbp-68], 4		; [rbp-68] == 4 ; false
	jle	.L3				; conditional jump to L3
	mov	eax, 0				; eax <- 0
	mov	rcx, QWORD PTR [rbp-8]		; rcx <- [rbp-8]
	xor	rcx, QWORD PTR fs:40		; rcx <- rcx XOR fs:40; rcx <- 0
	je	.L5				; jump to L5
	call	__stack_chk_fail		; call conditional statement for forloop
.L5:
	leave					; leave the forloop
	.cfi_def_cfa 7, 8
	ret					; return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
