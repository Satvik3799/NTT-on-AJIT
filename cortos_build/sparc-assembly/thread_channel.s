	.file	"thread_channel.c"
	.section	".text"
	.align 4
	.global initChannel
	.type	initChannel, #function
	.proc	020
initChannel:
	mov	1, %g1
	st	%o1, [%o0]
	st	%g0, [%o0+4]
	st	%g0, [%o0+8]
	st	%g0, [%o0+12]
	st	%g0, [%o0+16]
	jmp	%o7+8
	 st	%g1, [%o0+20]
	.size	initChannel, .-initChannel
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"DEBUG"
	.align 8
.LC1:
	.asciz	"/home/ajit/ajit-toolchain/application_development/thread_channel/src/thread_channel.c"
	.align 8
.LC2:
	.asciz	"Channel %d: status = %d.\n"
	.section	".text"
	.align 4
	.global scheduleChannelJob
	.type	scheduleChannelJob, #function
	.proc	016
scheduleChannelJob:
	save	%sp, -104, %sp
	ld	[%i0+20], %g2
	mov	%i0, %g1
	cmp	%g2, 1
	bne	.L7
	 mov	1, %i0
	ld	[%g1+4], %g3
	mov	2, %g2
	add	%g3, 1, %g3
	st	%i1, [%g1+12]
	st	%g3, [%g1+4]
	st	%i2, [%g1+16]
	st	%g2, [%g1+20]
	st	%g2, [%sp+92]
	mov	33, %o3
	ld	[%g1], %o5
	sethi	%hi(.LC0), %o0
	sethi	%hi(.LC1), %o1
	or	%o0, %lo(.LC0), %o0
	or	%o1, %lo(.LC1), %o1
	sethi	%hi(__func__.2530), %o2
	sethi	%hi(.LC2), %o4
	or	%o2, %lo(__func__.2530), %o2
	or	%o4, %lo(.LC2), %o4
	call	__cortos_log_printf, 0
	 mov	0, %i0
.L7:
	jmp	%i7+8
	 restore
	.size	scheduleChannelJob, .-scheduleChannelJob
	.align 4
	.global setChannelResponse
	.type	setChannelResponse, #function
	.proc	016
setChannelResponse:
	save	%sp, -104, %sp
	ld	[%i0+20], %g2
	mov	%i0, %g1
	cmp	%g2, 3
	bne	.L12
	 mov	1, %i0
	ld	[%g1+8], %g3
	mov	4, %g2
	add	%g3, 1, %g3
	st	%i1, [%g1+16]
	st	%g3, [%g1+8]
	st	%g2, [%g1+20]
	st	%g2, [%sp+92]
	mov	50, %o3
	ld	[%g1], %o5
	sethi	%hi(.LC0), %o0
	sethi	%hi(.LC1), %o1
	or	%o0, %lo(.LC0), %o0
	or	%o1, %lo(.LC1), %o1
	sethi	%hi(__func__.2536), %o2
	sethi	%hi(.LC2), %o4
	or	%o2, %lo(__func__.2536), %o2
	or	%o4, %lo(.LC2), %o4
	call	__cortos_log_printf, 0
	 mov	0, %i0
.L12:
	jmp	%i7+8
	 restore
	.size	setChannelResponse, .-setChannelResponse
	.align 4
	.global getChannelResponse
	.type	getChannelResponse, #function
	.proc	016
getChannelResponse:
	save	%sp, -104, %sp
	ld	[%i0+20], %g2
	mov	%i0, %g1
	cmp	%g2, 4
	bne	.L17
	 mov	1, %i0
	ld	[%g1+16], %g2
	st	%g2, [%i1]
	st	%i0, [%g1+20]
	st	%i0, [%sp+92]
	st	%g0, [%g1+12]
	st	%g0, [%g1+16]
	mov	70, %o3
	ld	[%g1], %o5
	sethi	%hi(.LC0), %o0
	sethi	%hi(.LC1), %o1
	or	%o0, %lo(.LC0), %o0
	or	%o1, %lo(.LC1), %o1
	sethi	%hi(__func__.2542), %o2
	sethi	%hi(.LC2), %o4
	or	%o2, %lo(__func__.2542), %o2
	or	%o4, %lo(.LC2), %o4
	call	__cortos_log_printf, 0
	 mov	0, %i0
.L17:
	jmp	%i7+8
	 restore
	.size	getChannelResponse, .-getChannelResponse
	.align 4
	.global getChannelJob
	.type	getChannelJob, #function
	.proc	016
getChannelJob:
	save	%sp, -104, %sp
	ld	[%i0+20], %g2
	mov	%i0, %g1
	cmp	%g2, 2
	bne	.L22
	 mov	1, %i0
	ld	[%g1+12], %g2
	st	%g2, [%i1]
	ld	[%g1+16], %g2
	st	%g2, [%i2]
	mov	3, %g2
	st	%g2, [%g1+20]
	st	%g2, [%sp+92]
	mov	87, %o3
	ld	[%g1], %o5
	sethi	%hi(.LC0), %o0
	sethi	%hi(.LC1), %o1
	or	%o0, %lo(.LC0), %o0
	or	%o1, %lo(.LC1), %o1
	sethi	%hi(__func__.2549), %o2
	sethi	%hi(.LC2), %o4
	or	%o2, %lo(__func__.2549), %o2
	or	%o4, %lo(.LC2), %o4
	call	__cortos_log_printf, 0
	 mov	0, %i0
.L22:
	jmp	%i7+8
	 restore
	.size	getChannelJob, .-getChannelJob
	.section	".rodata"
	.align 8
	.type	__func__.2530, #object
	.size	__func__.2530, 19
__func__.2530:
	.asciz	"scheduleChannelJob"
	.align 8
	.type	__func__.2536, #object
	.size	__func__.2536, 19
__func__.2536:
	.asciz	"setChannelResponse"
	.align 8
	.type	__func__.2542, #object
	.size	__func__.2542, 19
__func__.2542:
	.asciz	"getChannelResponse"
	.align 8
	.type	__func__.2549, #object
	.size	__func__.2549, 14
__func__.2549:
	.asciz	"getChannelJob"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
