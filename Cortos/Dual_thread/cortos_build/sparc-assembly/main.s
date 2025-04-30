	.file	"main.c"
	.section	".text"
	.align 4
	.global ntt_thread
	.type	ntt_thread, #function
	.proc	020
ntt_thread:
	mov	%o0, %g1
	ld	[%o0], %o0
	ld	[%g1+4], %o1
	or	%o7, %g0, %g1
	call	ct_ntt, 0
	 or	%g1, %g0, %o7
	.size	ntt_thread, .-ntt_thread
	.align 4
	.global set_NTT_Args
	.type	set_NTT_Args, #function
	.proc	020
set_NTT_Args:
	st	%o1, [%o0]
	jmp	%o7+8
	 st	%o2, [%o0+4]
	.size	set_NTT_Args, .-set_NTT_Args
	.align 4
	.global ntt_top
	.type	ntt_top, #function
	.proc	020
ntt_top:
	save	%sp, -624, %sp
	sethi	%hi(tc), %g1
	or	%g1, %lo(tc), %g1
	mov	0, %g2
	st	%g1, [%fp-528]
	mov	0, %g1
	sll	%g1, 2, %g3
.L11:
	add	%g1, %g1, %g1
	lduh	[%i0+%g3], %g4
	add	%fp, %g1, %g1
	add	%i0, %g3, %o0
	sth	%g4, [%g1-512]
	lduh	[%o0+2], %o1
	sth	%o1, [%g1-256]
	add	%g2, 1, %g2
	and	%g2, 0xff, %g1
	cmp	%g1, 128
	bne	.L11
	 sll	%g1, 2, %g3
	add	%fp, -512, %g1
	st	%g1, [%fp-520]
	sethi	%hi(ntt_thread), %i5
	st	%i1, [%fp-516]
	or	%i5, %lo(ntt_thread), %i0
.L5:
	ld	[%fp-528], %o0
	mov	%i0, %o1
	call	scheduleChannelJob, 0
	 add	%fp, -520, %o2
	cmp	%o0, 0
	bne	.L5
	 add	%fp, -256, %o0
	call	ct_ntt, 0
	 mov	%i1, %o1
	st	%g0, [%fp-524]
.L6:
	ld	[%fp-528], %o0
	call	getChannelResponse, 0
	 add	%fp, -524, %o1
	cmp	%o0, 0
	bne	.L6
	 nop
	jmp	%i7+8
	 restore
	.size	ntt_top, .-ntt_top
	.align 4
	.global setup
	.type	setup, #function
	.proc	020
setup:
	save	%sp, -96, %sp
	mov	0, %o2
	mov	1, %o0
	call	__ajit_serial_configure_via_vmap__, 0
	 mov	0, %o1
	sethi	%hi(80000000), %o1
	sethi	%hi(114688), %o0
	call	__ajit_serial_set_baudrate_via_vmap__, 0
	 or	%o0, 512, %o0
	mov	0, %o0
	sethi	%hi(tc), %i0
	call	__ajit_serial_set_uart_reset_via_vmap__, 0
	 mov	1, %i1
	call	initChannel, 0
	 restore %i0, %lo(tc), %o0
	.size	setup, .-setup
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.asciz	"[INFO]  :   Twiddle factors generated.\n"
	.align 8
.LC2:
	.asciz	"[INFO]   :   PSIS array:\n"
	.align 8
.LC3:
	.asciz	"%u, "
	.align 8
.LC4:
	.asciz	"%u "
	.align 8
.LC5:
	.asciz	"\n"
	.align 8
.LC6:
	.asciz	"[RESULT]  :   Single thread Times: %f %f\n"
	.global __floatundidf
	.align 8
.LC7:
	.asciz	"[RESULT]  :   Single-thread NTT:\n"
	.align 8
.LC8:
	.asciz	"[INFO]  :   Dual-thread NTT measure on two threads starts here.\n"
	.align 8
.LC9:
	.asciz	"[RESULT]  :   Dual thread Times: %f %f\n"
	.align 8
.LC10:
	.asciz	"[RESULT]  :   Dual-thread NTT\n"
	.align 8
.LC11:
	.asciz	"%d, "
	.align 8
.LC12:
	.asciz	"[INFO]  :   close the channel..\n"
	.align 8
.LC13:
	.asciz	"[INFO]   :   INV_PSIS array:\n"
	.section	".rodata"
	.align 2
.LC0:
	.half	0
	.half	1
	.half	0
	.half	0
	.half	0
	.half	0
	.half	1
	.half	3327
	.half	0
	.half	3328
	.half	3328
	.half	1
	.half	2
	.half	1
	.half	3328
	.half	1
	.half	1
	.half	0
	.half	3328
	.half	0
	.half	1
	.half	0
	.half	3326
	.half	3328
	.half	1
	.half	3327
	.half	2
	.half	0
	.half	1
	.half	1
	.half	0
	.half	0
	.half	3328
	.half	3328
	.half	1
	.half	3328
	.half	1
	.half	0
	.half	0
	.half	3328
	.half	2
	.half	2
	.half	3327
	.half	1
	.half	2
	.half	0
	.half	0
	.half	1
	.half	0
	.half	0
	.half	0
	.half	0
	.half	1
	.half	3328
	.half	1
	.half	1
	.half	0
	.half	0
	.half	0
	.half	0
	.half	1
	.half	1
	.half	3328
	.half	1
	.half	0
	.half	0
	.half	1
	.half	3328
	.half	0
	.half	0
	.half	2
	.half	0
	.half	0
	.half	0
	.half	3328
	.half	3327
	.half	3327
	.half	0
	.half	3328
	.half	3328
	.half	0
	.half	3327
	.half	1
	.half	3328
	.half	1
	.half	3328
	.half	0
	.half	2
	.half	0
	.half	3327
	.half	1
	.half	0
	.half	1
	.half	1
	.half	0
	.half	0
	.half	3327
	.half	3328
	.half	0
	.half	1
	.half	0
	.half	0
	.half	3328
	.half	0
	.half	0
	.half	3328
	.half	3328
	.half	0
	.half	3328
	.half	3327
	.half	1
	.half	1
	.half	3328
	.half	0
	.half	1
	.half	1
	.half	3328
	.half	0
	.half	3328
	.half	3326
	.half	0
	.half	0
	.half	3328
	.half	0
	.half	2
	.half	3328
	.half	0
	.half	1
	.half	0
	.half	0
	.half	2
	.half	3328
	.half	0
	.half	3328
	.half	3328
	.half	0
	.half	0
	.half	0
	.half	1
	.half	2
	.half	3328
	.half	3327
	.half	1
	.half	0
	.half	2
	.half	2
	.half	2
	.half	3327
	.half	2
	.half	0
	.half	0
	.half	1
	.half	0
	.half	3328
	.half	3328
	.half	0
	.half	1
	.half	0
	.half	0
	.half	0
	.half	3328
	.half	3328
	.half	1
	.half	3
	.half	3328
	.half	1
	.half	3328
	.half	2
	.half	0
	.half	0
	.half	0
	.half	2
	.half	0
	.half	1
	.half	1
	.half	3328
	.half	1
	.half	0
	.half	3328
	.half	3328
	.half	0
	.half	3328
	.half	3328
	.half	1
	.half	3328
	.half	3327
	.half	1
	.half	0
	.half	1
	.half	3328
	.half	1
	.half	3328
	.half	1
	.half	3328
	.half	1
	.half	0
	.half	3327
	.half	3328
	.half	1
	.half	3
	.half	3327
	.half	0
	.half	1
	.half	3327
	.half	3
	.half	0
	.half	1
	.half	1
	.half	1
	.half	1
	.half	3327
	.half	3328
	.half	3328
	.half	3328
	.half	1
	.half	3326
	.half	0
	.half	1
	.half	1
	.half	1
	.half	0
	.half	0
	.half	1
	.half	0
	.half	0
	.half	2
	.half	0
	.half	3328
	.half	3328
	.half	3328
	.half	1
	.half	3
	.half	3328
	.half	0
	.half	3328
	.half	2
	.half	1
	.half	3327
	.half	0
	.half	1
	.half	1
	.half	0
	.half	3327
	.half	3328
	.half	1
	.half	1
	.half	0
	.half	3328
	.half	3328
	.half	3328
	.half	0
	.half	3328
	.half	0
	.half	0
	.half	3328
	.half	0
	.section	".text"
	.align 4
	.global main_00
	.type	main_00, #function
	.proc	014
main_00:
	save	%sp, -1128, %sp
	mov	512, %o2
	sethi	%hi(.LC0), %o1
	add	%fp, -512, %o0
	call	memcpy, 0
	 or	%o1, %lo(.LC0), %o1
	add	%fp, -768, %o1
	call	gen_tf, 0
	 add	%fp, -1024, %o0
	sethi	%hi(.LC1), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC1), %o0
	sethi	%hi(.LC2), %g1
	call	cortos_printf, 0
	 or	%g1, %lo(.LC2), %o0
	sethi	%hi(.LC3), %i3
	mov	0, %i5
	or	%i3, %lo(.LC3), %i4
	mov	0, %g1
	add	%g1, %g1, %g1
.L22:
	add	%fp, %g1, %g1
	mov	%i4, %o0
	call	cortos_printf, 0
	 lduh	[%g1-1024], %o1
	add	%i5, 1, %i5
	and	%i5, 0xff, %g1
	cmp	%g1, 128
	bne	.L22
	 add	%g1, %g1, %g1
	sethi	%hi(.LC5), %i1
	call	cortos_printf, 0
	 or	%i1, %lo(.LC5), %o0
	sethi	%hi(.LC13), %g2
	call	cortos_printf, 0
	 or	%g2, %lo(.LC13), %o0
	sethi	%hi(.LC4), %g3
	mov	0, %i0
	mov	0, %g1
	or	%g3, %lo(.LC4), %i2
	add	%g1, %g1, %g1
.L23:
	add	%fp, %g1, %g1
	mov	%i2, %o0
	call	cortos_printf, 0
	 lduh	[%g1-768], %o1
	add	%i0, 1, %i0
	and	%i0, 0xff, %g1
	cmp	%g1, 128
	bne	.L23
	 add	%g1, %g1, %g1
	call	cortos_printf, 0
	 or	%i1, %lo(.LC5), %o0
	call	__ajit_get_clock_time, 0
	 nop
	mov	%o0, %i4
	mov	%o1, %i5
	add	%fp, -512, %o0
	call	ntt_256, 0
	 add	%fp, -1024, %o1
	call	__ajit_get_clock_time, 0
	 nop
	subcc	%o1, %i5, %o1
	call	__floatundidf, 0
	 subx	%o0, %i4, %o0
	sethi	%hi(.LC6), %g4
	std	%f0, [%fp-1032]
	ldd	[%fp-1032], %g2
	or	%g4, %lo(.LC6), %o0
	mov	%g2, %o1
	call	cortos_printf, 0
	 mov	%g3, %o2
	sethi	%hi(.LC7), %o2
	call	cortos_printf, 0
	 or	%o2, %lo(.LC7), %o0
	lduh	[%fp-512], %o1
	call	cortos_printf, 0
	 or	%i3, %lo(.LC3), %o0
	call	cortos_printf, 0
	 or	%i1, %lo(.LC5), %o0
	sethi	%hi(.LC8), %o3
	call	cortos_printf, 0
	 or	%o3, %lo(.LC8), %o0
	call	__ajit_get_clock_time, 0
	 nop
	mov	%o0, %i0
	mov	%o1, %i4
	add	%fp, -512, %o0
	call	ntt_top, 0
	 add	%fp, -1024, %o1
	call	__ajit_get_clock_time, 0
	 nop
	mov	%o0, %i2
	mov	%o1, %i3
	call	cortos_printf, 0
	 or	%i1, %lo(.LC5), %o0
	subcc	%i3, %i4, %o1
	call	__floatundidf, 0
	 subx	%i2, %i0, %o0
	sethi	%hi(.LC9), %o4
	std	%f0, [%fp-1032]
	ldd	[%fp-1032], %g2
	or	%o4, %lo(.LC9), %o0
	mov	%g2, %o1
	call	cortos_printf, 0
	 mov	%g3, %o2
	sethi	%hi(.LC10), %o5
	call	cortos_printf, 0
	 or	%o5, %lo(.LC10), %o0
	lduh	[%fp-512], %o1
	sethi	%hi(.LC11), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC11), %o0
	call	cortos_printf, 0
	 or	%i1, %lo(.LC5), %o0
	sethi	%hi(.LC12), %o1
	call	cortos_printf, 0
	 or	%o1, %lo(.LC12), %o0
	mov	0, %o1
	mov	0, %o2
	sethi	%hi(tc), %i1
	mov	1, %i0
	call	scheduleChannelJob, 0
	 or	%i1, %lo(tc), %o0
	jmp	%i7+8
	 restore
	.size	main_00, .-main_00
	.section	.rodata.str1.8
	.align 8
.LC14:
	.asciz	"[INFO]   :   Entered main_01\n"
	.section	".text"
	.align 4
	.global main_01
	.type	main_01, #function
	.proc	014
main_01:
	save	%sp, -104, %sp
	sethi	%hi(.LC14), %o0
	sethi	%hi(tc), %i5
	or	%o0, %lo(.LC14), %o0
	call	cortos_printf, 0
	 or	%i5, %lo(tc), %i0
	mov	%i0, %i4
	add	%fp, -8, %o1
.L31:
	add	%fp, -4, %o2
	call	getChannelJob, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	bne	.L31
	 add	%fp, -8, %o1
	ld	[%fp-8], %g1
	cmp	%g1, 0
	be	.L26
	 nop
	call	%g1, 0
	 ld	[%fp-4], %o0
	mov	%i4, %o0
	call	setChannelResponse, 0
	 ld	[%fp-4], %o1
	b	.L31
	 add	%fp, -8, %o1
.L26:
	jmp	%i7+8
	 restore %g0, 1, %o0
	.size	main_01, .-main_01
	.common	tc,24,4
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
