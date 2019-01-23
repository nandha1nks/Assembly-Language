	.file	"smlar.c"
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
	sub	rsp, 64				; rsp <- [rsp] -64
	mov	rax, QWORD PTR fs:40		; rax <- fs:40
	mov	QWORD PTR [rbp-8], rax		; [rbp-8] <- [rax]
	xor	eax, eax			; eax <- [eax] xor [eax]
	mov	DWORD PTR [rbp-48], 1		; [rbp-48] <- 1
	mov	DWORD PTR [rbp-44], 3		; [rbp-44] <- 3
	mov	DWORD PTR [rbp-40], 5		; [rbp-40] <- 5
	mov	DWORD PTR [rbp-36], 4		; [rbp-36] <- 4
	mov	DWORD PTR [rbp-32], 2		; [rbp-32] <- 2
	mov	DWORD PTR [rbp-28], 6		; [rbp-28] <- 6
	mov	DWORD PTR [rbp-24], 9		; [rbp-24] <- 9
	mov	DWORD PTR [rbp-20], 8		; [rbp-20] <- 8
	mov	eax, DWORD PTR [rbp-48]		; eax <- [rbp-48] ; eax <- 1
	mov	DWORD PTR [rbp-56], eax		; [rbp-56] <- [eax] ; [rbp-56] <- 1
	mov	eax, DWORD PTR [rbp-48]		; eax <- [rbp-48] ; eax <- 1
	mov	DWORD PTR [rbp-52], eax		; [rbp-52] <- [eax] ; [rbp-52] <- 1
	mov	DWORD PTR [rbp-60], 1		; [rbp-60] <-1
	jmp	.L2				; jump to L2
.L5:
	mov	eax, DWORD PTR [rbp-60]		; eax <- rbp-60 ; eax <- 1
	cdqe					; converts eax into edx
	mov	eax, DWORD PTR [rbp-48+rax*4]	; eax <- [rbp-48+rax*4]
	cmp	eax, DWORD PTR [rbp-56]		; eax <- [rbp-56] ; eax <- 1
	jge	.L3				; jump to L3
	mov	eax, DWORD PTR [rbp-60]		; eax <- [rbp-60] ; eax <- 1
	cdqe					; similar as above
	mov	eax, DWORD PTR [rbp-48+rax*4]	; eax <- [rbp-48+rax*4]
	mov	DWORD PTR [rbp-56], eax		; [rbp-56] <- eax ; [rbp-56] <- 1
	jmp	.L4				; jump to L4
.L3:
	mov	eax, DWORD PTR [rbp-60]		; eax <- [rbp-60] ; eax <- 1
	cdqe					; same as above
	mov	eax, DWORD PTR [rbp-48+rax*4]	; eax <- [rbp-48+rax*4]
	cmp	eax, DWORD PTR [rbp-52]		; eax <- [rbp-52] ; eax <- 1
	jle	.L4				; conditional jump to L5
	mov	eax, DWORD PTR [rbp-60]		; eax <- [rbp-60] ; eax <- 1
	cdqe					; same as above
	mov	eax, DWORD PTR [rbp-48+rax*4]	; eax <- [rbp-48+raw*4]
	mov	DWORD PTR [rbp-52], eax		; [rbp-52] <- eax
.L4:
	add	DWORD PTR [rbp-60], 1		; [rbp-60] <- 1
.L2:
	cmp	DWORD PTR [rbp-60], 7		; [rbp-60] <- 7
	jle	.L5				; unconditional jump to L5
	mov	eax, 0				; eax <- 0
	mov	rdx, QWORD PTR [rbp-8]		; rdx <- [rdx-8]
	xor	rdx, QWORD PTR fs:40		; rcx <- rcx XOR fs:40; rcx <- 0
	je	.L7				; junp to L7
	call	__stack_chk_fail		; call conditional statement of for loop
.L7:
	leave					; leave the for loop
	.cfi_def_cfa 7, 8
	ret					; return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
