	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.text
	.align	2
	.global	_Z14AllocateMatrixjji
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	_Z14AllocateMatrixjji, %function
_Z14AllocateMatrixjji:
	.fnstart
.LFB265:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	mov	r4, r0
	str	r0, [sp, #16]
	mov	r7, r1
	mov	r9, r2
	lsl	r0, r0, #2
	bl	malloc
	str	r0, [sp, #20]
	cmp	r4, #0
	beq	.L1
	lsl	r3, r7, #2
	str	r3, [sp, #12]
	str	r0, [sp, #4]
	mov	r3, #0
	str	r3, [sp, #8]
	str	r9, [sp]
	movw	fp, #633
	movt	fp, 32000
	b	.L6
.L4:
	str	r0, [r6, r5]
	add	r4, r4, #1
	cmp	r7, r4
	beq	.L3
.L5:
	lsl	r5, r4, #2
	ldr	r6, [r8]
	cmp	r9, #0
	ldreq	r0, [sp]
	beq	.L4
	bl	rand
	add	r0, r0, #-1073741823
	mul	r0, r10, r0
	smull	r2, r3, r0, fp
	asr	r0, r0, #31
	rsb	r0, r0, r3, asr #20
	b	.L4
.L3:
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #4]
	add	r2, r2, #4
	str	r2, [sp, #4]
	ldr	r2, [sp, #16]
	cmp	r2, r3
	beq	.L1
.L6:
	ldr	r0, [sp, #12]
	bl	malloc
	ldr	r3, [sp, #4]
	mov	r8, r3
	str	r0, [r3]
	cmp	r7, #0
	beq	.L3
	mov	r4, #0
	mov	r10, #1000
	b	.L5
.L1:
	ldr	r0, [sp, #20]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.cantunwind
	.fnend
	.size	_Z14AllocateMatrixjji, .-_Z14AllocateMatrixjji
	.align	2
	.global	_Z8PrintMatPPijj
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	_Z8PrintMatPPijj, %function
_Z8PrintMatPPijj:
	.fnstart
.LFB266:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	mov	r10, r1
	mov	r7, r2
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	mov	r2, #24
	mov	r1, #1
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	fwrite
	cmp	r10, #0
	beq	.L12
	mov	r5, #0
	movw	r8, #:lower16:.LC1
	movt	r8, #:upper16:.LC1
	movw	r6, #:lower16:stdout
	movt	r6, #:upper16:stdout
	mov	fp, #10
.L15:
	cmp	r7, #0
	beq	.L13
	mov	r4, #0
.L14:
	ldr	r3, [r9, r5, lsl #2]
	ldr	r2, [r3, r4, lsl #2]
	mov	r1, r8
	ldr	r0, [r6]
	bl	fprintf
	add	r4, r4, #1
	cmp	r7, r4
	bne	.L14
.L13:
	ldr	r1, [r6]
	mov	r0, fp
	bl	fputc
	add	r5, r5, #1
	cmp	r10, r5
	bne	.L15
.L12:
	movw	r4, #:lower16:stderr
	movt	r4, #:upper16:stderr
	ldr	r3, [r4]
	mov	r2, #55
	mov	r1, #1
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	fwrite
	ldr	r3, [r4]
	mov	r2, #6
	mov	r1, #1
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	bl	fwrite
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	_Z8PrintMatPPijj, .-_Z8PrintMatPPijj
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	main, %function
main:
	.fnstart
.LFB264:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	sub	sp, sp, #8
	mov	r4, r0
	movw	r0, #2017
	bl	srand
	cmp	r4, #1
	beq	.L27
	movw	r0, #:lower16:.LC8
	movt	r0, #:upper16:.LC8
	bl	puts
	mov	r0, #1
.L19:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L27:
	movw	r4, #:lower16:stderr
	movt	r4, #:upper16:stderr
	ldr	r3, [r4]
	mov	r2, #38
	mov	r1, #1
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	bl	fwrite
	mov	r2, #1
	mov	r1, #1024
	mov	r0, r1
	bl	_Z14AllocateMatrixjji
	mov	r9, r0
	ldr	r3, [r4]
	mov	r2, #38
	mov	r1, #1
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	bl	fwrite
	mov	r2, #1
	mov	r1, #1024
	mov	r0, r1
	bl	_Z14AllocateMatrixjji
	mov	r10, r0
	ldr	r3, [r4]
	mov	r2, #38
	mov	r1, #1
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	bl	fwrite
	mov	r2, #0
	mov	r1, #1024
	mov	r0, r1
	bl	_Z14AllocateMatrixjji
	mov	r8, r0
	ldr	r3, [r4]
	mov	r2, #37
	mov	r1, #1
	movw	r0, #:lower16:.LC7
	movt	r0, #:upper16:.LC7
	bl	fwrite
	mov	r3, #1024
	str	r3, [sp]
	mov	r2, r10
	mov	r1, r9
	mov	r0, r8
	bl	matadd
	mov	r4, #0
	movw	r7, #:lower16:.LC9
	movt	r7, #:upper16:.LC9
	movw	r6, #:lower16:stderr
	movt	r6, #:upper16:stderr
	mov	r5, #1024
.L21:
	add	r4, r4, #2
	mov	r2, r4
	mov	r1, r7
	ldr	r0, [r6]
	bl	fprintf
	str	r5, [sp]
	mov	r3, r5
	mov	r2, r8
	mov	r1, r9
	mov	r0, r8
	bl	matadd
	add	r2, r4, #1
	mov	r1, r7
	ldr	r0, [r6]
	bl	fprintf
	str	r5, [sp]
	mov	r3, r5
	mov	r2, r10
	mov	r1, r8
	mov	r0, r8
	bl	matadd
	cmp	r4, #18
	bne	.L21
	movw	r3, #:lower16:stderr
	movt	r3, #:upper16:stderr
	ldr	r3, [r3]
	mov	r2, #38
	mov	r1, #1
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	bl	fwrite
	mov	r4, #1024
	str	r4, [sp]
	mov	r3, r4
	mov	r2, r8
	mov	r1, r8
	mov	r0, r8
	bl	matadd
	mov	r2, r4
	mov	r1, r4
	mov	r0, r8
	bl	_Z8PrintMatPPijj
	sub	r4, r9, #4
	sub	r6, r10, #4
	sub	r5, r8, #4
	add	r7, r9, #4080
	add	r7, r7, #12
.L23:
	ldr	r0, [r4, #4]!
	bl	free
	ldr	r0, [r6, #4]!
	bl	free
	ldr	r0, [r5, #4]!
	bl	free
	cmp	r4, r7
	bne	.L23
	mov	r0, r9
	bl	free
	mov	r0, r10
	bl	free
	mov	r0, r8
	bl	free
	mov	r0, #0
	b	.L19
	.fnend
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Printing Result Matrix:\012\000"
	.space	3
.LC1:
	.ascii	"%d \000"
.LC2:
	.ascii	"***************************************************"
	.ascii	"***\012\000"
.LC3:
	.ascii	"Done.\012\000"
	.space	1
.LC4:
	.ascii	"Allocating and Initializing Matrix A:\012\000"
	.space	1
.LC5:
	.ascii	"Allocating and Initializing Matrix B:\012\000"
	.space	1
.LC6:
	.ascii	"Allocating and Initializing Matrix C:\012\000"
	.space	1
.LC7:
	.ascii	"Computing Iteration 1 of Matrix Sum:\012\000"
	.space	2
.LC8:
	.ascii	"Usage: matmul > outfile\000"
.LC9:
	.ascii	"Computing Iteration %d of Matrix Sum:\012\000"
	.space	1
.LC10:
	.ascii	"Computing Iteration 20 of Matrix Sum:\012\000"
	.ident	"GCC: (GNU) 6.2.1 20160830"
	.section	.note.GNU-stack,"",%progbits
