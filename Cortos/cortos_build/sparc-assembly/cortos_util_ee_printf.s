	.file	"cortos_util_ee_printf.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.type	get_bit_access, #function
	.proc	011
get_bit_access:
.LFB0:
	.file 1 "cortos_src/cortos_util_ee_printf.c"
	.loc 1 257 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %g1
	std	%i0, [%fp-16]
	.loc 1 259 0
	ldd	[%fp-16], %f8
	std	%f8, [%fp-8]
	.loc 1 260 0
	ldd	[%fp-8], %g2
	std	%g2, [%g1]
	.loc 1 261 0
	mov	%g1, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE0:
	.size	get_bit_access, .-get_bit_access
	.align 4
	.type	get_sign_bit, #function
	.proc	04
get_sign_bit:
.LFB1:
	.loc 1 264 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-16]
	.loc 1 266 0
	add	%fp, -8, %g1
	st	%g1, [%sp+64]
	ldd	[%fp-16], %o0
	call	get_bit_access, 0
	 nop
	unimp	8
	ldd	[%fp-8], %g2
	srl	%g2, 31, %i5
	mov	0, %i4
	mov	%i5, %g1
	.loc 1 267 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	get_sign_bit, .-get_sign_bit
	.align 4
	.type	get_exp2, #function
	.proc	04
get_exp2:
.LFB2:
	.loc 1 270 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	.loc 1 275 0
	ldd	[%g1], %i4
	srl	%i4, 20, %g3
	mov	0, %g2
	mov	%g3, %g1
	and	%g1, 2047, %g1
	add	%g1, -1023, %g1
	.loc 1 276 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	get_exp2, .-get_exp2
	.align 4
	.type	putchar_via_gadget, #function
	.proc	020
putchar_via_gadget:
.LFB3:
	.loc 1 307 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g1
	stb	%g1, [%fp+72]
	.loc 1 308 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	st	%g1, [%fp-4]
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1+12]
	.loc 1 311 0
	ld	[%fp+68], %g1
	ld	[%g1+16], %g2
	ld	[%fp-4], %g1
	cmp	%g2, %g1
	bleu	.L11
	 nop
.L8:
	.loc 1 314 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	be	.L10
	 nop
	.loc 1 316 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+4], %g2
	ldub	[%fp+72], %g3
	sll	%g3, 24, %g3
	sra	%g3, 24, %g3
	mov	%g3, %o0
	mov	%g2, %o1
	call	%g1, 0
	 nop
	b	.L7
	 nop
.L10:
	.loc 1 321 0
	ld	[%fp+68], %g1
	ld	[%g1+8], %g2
	ld	[%fp-4], %g1
	add	%g2, %g1, %g1
	ldub	[%fp+72], %g2
	stb	%g2, [%g1]
	b	.L7
	 nop
.L11:
	.loc 1 312 0
	nop
.L7:
	.loc 1 323 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	putchar_via_gadget, .-putchar_via_gadget
	.align 4
	.type	append_termination_with_gadget, #function
	.proc	020
append_termination_with_gadget:
.LFB4:
	.loc 1 327 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 328 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	bne	.L19
	 nop
	.loc 1 328 0 is_stmt 0 discriminator 1
	ld	[%fp+68], %g1
	ld	[%g1+16], %g1
	cmp	%g1, 0
	be	.L19
	 nop
.L14:
	.loc 1 331 0 is_stmt 1
	ld	[%fp+68], %g1
	ld	[%g1+8], %g1
	cmp	%g1, 0
	be	.L20
	 nop
.L16:
	.loc 1 334 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g2
	ld	[%fp+68], %g1
	ld	[%g1+16], %g1
	cmp	%g2, %g1
	bgeu	.L17
	 nop
	.loc 1 334 0 is_stmt 0 discriminator 1
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	b	.L18
	 nop
.L17:
	.loc 1 334 0 discriminator 2
	ld	[%fp+68], %g1
	ld	[%g1+16], %g1
	add	%g1, -1, %g1
.L18:
	.loc 1 334 0 discriminator 3
	st	%g1, [%fp-4]
	.loc 1 335 0 is_stmt 1 discriminator 3
	ld	[%fp+68], %g1
	ld	[%g1+8], %g2
	ld	[%fp-4], %g1
	add	%g2, %g1, %g1
	stb	%g0, [%g1]
	b	.L12
	 nop
.L19:
	.loc 1 329 0
	nop
	b	.L12
	 nop
.L20:
	.loc 1 332 0
	nop
.L12:
	.loc 1 336 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	append_termination_with_gadget, .-append_termination_with_gadget
	.align 4
	.type	putchar_wrapper, #function
	.proc	020
putchar_wrapper:
.LFB5:
	.loc 1 341 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	st	%i1, [%fp+72]
	stb	%g1, [%fp+68]
	b	.L24
	 nop
.L26:
	.loc 1 348 0
	nop
.L24:
.LBB2:
	.loc 1 345 0
	ldub	[%fp+68], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	__ajit_serial_putchar_via_vmap__, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 346 0
	ld	[%fp-4], %g1
	cmp	%g1, 0
	be	.L26
	 nop
	.loc 1 347 0
	nop
	b	.L23
	 nop
.L27:
.LBE2:
	.loc 1 359 0
	nop
.L23:
.LBB3:
	.loc 1 355 0
	st	%g0, [%fp-8]
	.loc 1 356 0
	call	__ajit_read_serial_control_register_via_vmap__, 0
	 nop
	st	%o0, [%fp-8]
	.loc 1 357 0
	ld	[%fp-8], %g1
	and	%g1, 8, %g1
	cmp	%g1, 0
	be	.L21
	 nop
	.loc 1 357 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L27
	 nop
.L21:
.LBE3:
	.loc 1 360 0 is_stmt 1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	putchar_wrapper, .-putchar_wrapper
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
.LFB6:
	.loc 1 363 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	stb	%g1, [%fp+68]
	.loc 1 364 0
	ldub	[%fp+68], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	mov	0, %o1
	call	putchar_wrapper, 0
	 nop
	.loc 1 365 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	uart_send_char, .-uart_send_char
	.align 4
	.type	discarding_gadget, #function
	.proc	010
discarding_gadget:
.LFB7:
	.loc 1 369 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI7:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %g1
	.loc 1 371 0
	st	%g0, [%fp-20]
	.loc 1 372 0
	st	%g0, [%fp-16]
	.loc 1 373 0
	st	%g0, [%fp-12]
	.loc 1 374 0
	st	%g0, [%fp-8]
	.loc 1 375 0
	st	%g0, [%fp-4]
	.loc 1 376 0
	ld	[%fp-20], %g2
	st	%g2, [%g1]
	ld	[%fp-16], %g2
	st	%g2, [%g1+4]
	ld	[%fp-12], %g2
	st	%g2, [%g1+8]
	ld	[%fp-8], %g2
	st	%g2, [%g1+12]
	ld	[%fp-4], %g2
	st	%g2, [%g1+16]
	.loc 1 377 0
	mov	%g1, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE7:
	.size	discarding_gadget, .-discarding_gadget
	.align 4
	.type	buffer_gadget, #function
	.proc	010
buffer_gadget:
.LFB8:
	.loc 1 380 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI8:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %i5
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 381 0
	ld	[%fp+72], %g1
	.loc 1 382 0
	cmp	%g1, 0
	bl	.L32
	 nop
	.loc 1 382 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	b	.L33
	 nop
.L32:
	.loc 1 382 0 discriminator 2
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
.L33:
	.loc 1 381 0 is_stmt 1
	st	%g1, [%fp-4]
	.loc 1 383 0
	add	%fp, -24, %g1
	st	%g1, [%sp+64]
	call	discarding_gadget, 0
	 nop
	unimp	20
	.loc 1 384 0
	ld	[%fp+68], %g1
	cmp	%g1, 0
	be	.L34
	 nop
	.loc 1 385 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-16]
	.loc 1 386 0
	ld	[%fp-4], %g1
	st	%g1, [%fp-8]
.L34:
	.loc 1 388 0
	ld	[%fp-24], %g1
	st	%g1, [%i5]
	ld	[%fp-20], %g1
	st	%g1, [%i5+4]
	ld	[%fp-16], %g1
	st	%g1, [%i5+8]
	ld	[%fp-12], %g1
	st	%g1, [%i5+12]
	ld	[%fp-8], %g1
	st	%g1, [%i5+16]
	.loc 1 389 0
	mov	%i5, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE8:
	.size	buffer_gadget, .-buffer_gadget
	.align 4
	.type	function_gadget, #function
	.proc	010
function_gadget:
.LFB9:
	.loc 1 392 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI9:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %i5
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 393 0
	add	%fp, -20, %g1
	st	%g1, [%sp+64]
	call	discarding_gadget, 0
	 nop
	unimp	20
	.loc 1 394 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-20]
	.loc 1 395 0
	ld	[%fp+72], %g1
	st	%g1, [%fp-16]
	.loc 1 396 0
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
	st	%g1, [%fp-4]
	.loc 1 397 0
	ld	[%fp-20], %g1
	st	%g1, [%i5]
	ld	[%fp-16], %g1
	st	%g1, [%i5+4]
	ld	[%fp-12], %g1
	st	%g1, [%i5+8]
	ld	[%fp-8], %g1
	st	%g1, [%i5+12]
	ld	[%fp-4], %g1
	st	%g1, [%i5+16]
	.loc 1 398 0
	mov	%i5, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE9:
	.size	function_gadget, .-function_gadget
	.align 4
	.type	extern_putchar_gadget, #function
	.proc	010
extern_putchar_gadget:
.LFB10:
	.loc 1 401 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI10:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %i5
	.loc 1 402 0
	st	%i5, [%sp+64]
	sethi	%hi(putchar_wrapper), %g1
	or	%g1, %lo(putchar_wrapper), %o0
	mov	0, %o1
	call	function_gadget, 0
	 nop
	unimp	20
	.loc 1 403 0
	mov	%i5, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE10:
	.size	extern_putchar_gadget, .-extern_putchar_gadget
	.align 4
	.type	strnlen_s_, #function
	.proc	016
strnlen_s_:
.LFB11:
	.loc 1 410 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI11:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 412 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	b	.L41
	 nop
.L43:
	.loc 1 412 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L41:
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	be	.L42
	 nop
	.loc 1 412 0 discriminator 2
	ld	[%fp+72], %g1
	xor	%g1, 0, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, 0, %g1
	ld	[%fp+72], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp+72]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L43
	 nop
.L42:
	.loc 1 413 0 is_stmt 1
	ld	[%fp-4], %g2
	ld	[%fp+68], %g1
	sub	%g2, %g1, %g1
	.loc 1 414 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE11:
	.size	strnlen_s_, .-strnlen_s_
	.align 4
	.type	is_digit_, #function
	.proc	00
is_digit_:
.LFB12:
	.loc 1 420 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI12:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	stb	%g1, [%fp+68]
	.loc 1 421 0
	ldub	[%fp+68], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 47
	ble	.L46
	 nop
	.loc 1 421 0 is_stmt 0 discriminator 1
	ldub	[%fp+68], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 57
	bg	.L46
	 nop
	.loc 1 421 0 discriminator 3
	mov	1, %g1
	b	.L47
	 nop
.L46:
	.loc 1 421 0 discriminator 2
	mov	0, %g1
.L47:
	.loc 1 421 0 discriminator 4
	and	%g1, 1, %g1
	and	%g1, 0xff, %g1
	.loc 1 422 0 is_stmt 1 discriminator 4
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE12:
	.size	is_digit_, .-is_digit_
	.align 4
	.type	atou_, #function
	.proc	016
atou_:
.LFB13:
	.loc 1 427 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI13:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 428 0
	st	%g0, [%fp-4]
	.loc 1 429 0
	b	.L50
	 nop
.L51:
	.loc 1 430 0
	ld	[%fp-4], %g1
	add	%g1, %g1, %g1
	sll	%g1, 2, %g2
	add	%g1, %g2, %g3
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ldub	[%g1], %g2
	sll	%g2, 24, %g2
	sra	%g2, 24, %g2
	add	%g3, %g2, %g2
	add	%g2, -48, %g2
	st	%g2, [%fp-4]
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
.L50:
	.loc 1 429 0 discriminator 1
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	is_digit_, 0
	 nop
	mov	%o0, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L51
	 nop
	.loc 1 432 0
	ld	[%fp-4], %g1
	.loc 1 433 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE13:
	.size	atou_, .-atou_
	.align 4
	.type	out_rev_, #function
	.proc	020
out_rev_:
.LFB14:
	.loc 1 438 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI14:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	.loc 1 439 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	st	%g1, [%fp-8]
	.loc 1 442 0
	ld	[%fp+84], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	bne	.L57
	 nop
	.loc 1 442 0 is_stmt 0 discriminator 1
	ld	[%fp+84], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L57
	 nop
.LBB4:
	.loc 1 444 0 is_stmt 1
	ld	[%fp+76], %g1
	st	%g1, [%fp-4]
	b	.L55
	 nop
.L56:
	.loc 1 445 0 discriminator 2
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 444 0 discriminator 2
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L55:
	.loc 1 444 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp+80], %g1
	cmp	%g2, %g1
	blu	.L56
	 nop
.LBE4:
	.loc 1 450 0 is_stmt 1
	b	.L57
	 nop
.L58:
	.loc 1 451 0
	ld	[%fp+76], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+76]
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	putchar_via_gadget, 0
	 nop
.L57:
	.loc 1 450 0 discriminator 1
	ld	[%fp+76], %g1
	cmp	%g1, 0
	bne	.L58
	 nop
	.loc 1 455 0
	ld	[%fp+84], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	be	.L53
	 nop
	.loc 1 456 0
	b	.L60
	 nop
.L61:
	.loc 1 457 0
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
.L60:
	.loc 1 456 0 discriminator 1
	ld	[%fp+68], %g1
	ld	[%g1+12], %g2
	ld	[%fp-8], %g1
	sub	%g2, %g1, %g2
	ld	[%fp+80], %g1
	cmp	%g2, %g1
	blu	.L61
	 nop
.L53:
	.loc 1 460 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE14:
	.size	out_rev_, .-out_rev_
	.align 4
	.type	print_integer_finalization, #function
	.proc	020
print_integer_finalization:
.LFB15:
	.loc 1 466 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI15:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	mov	%i3, %g2
	mov	%i4, %g1
	st	%i5, [%fp+88]
	stb	%g2, [%fp+80]
	stb	%g1, [%fp+84]
	.loc 1 467 0
	ld	[%fp+76], %g1
	st	%g1, [%fp-4]
	.loc 1 471 0
	ld	[%fp+96], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	bne	.L68
	 nop
	.loc 1 472 0
	ld	[%fp+92], %g1
	cmp	%g1, 0
	be	.L83
	 nop
	.loc 1 472 0 is_stmt 0 discriminator 1
	ld	[%fp+96], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L83
	 nop
	ldub	[%fp+80], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L65
	 nop
	ld	[%fp+96], %g1
	and	%g1, 12, %g1
	cmp	%g1, 0
	be	.L83
	 nop
.L65:
	.loc 1 473 0 is_stmt 1
	ld	[%fp+92], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+92]
	.loc 1 475 0
	b	.L83
	 nop
.L67:
	.loc 1 476 0
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
	b	.L66
	 nop
.L83:
	.loc 1 475 0
	nop
.L66:
	.loc 1 475 0 is_stmt 0 discriminator 1
	ld	[%fp+96], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L68
	 nop
	.loc 1 475 0 discriminator 2
	ld	[%fp+76], %g2
	ld	[%fp+92], %g1
	cmp	%g2, %g1
	bgeu	.L68
	 nop
	.loc 1 475 0 discriminator 1
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bleu	.L67
	 nop
	.loc 1 480 0 is_stmt 1
	b	.L68
	 nop
.L70:
	.loc 1 481 0
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
.L68:
	.loc 1 480 0 discriminator 1
	ld	[%fp+76], %g2
	ld	[%fp+88], %g1
	cmp	%g2, %g1
	bgeu	.L69
	 nop
	.loc 1 480 0 is_stmt 0 discriminator 2
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bleu	.L70
	 nop
.L69:
	.loc 1 484 0 is_stmt 1
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 8
	bne	.L71
	 nop
	.loc 1 484 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g2
	ld	[%fp-4], %g1
	cmp	%g2, %g1
	bleu	.L71
	 nop
	.loc 1 486 0 is_stmt 1
	ld	[%fp+96], %g1
	and	%g1, -17, %g1
	st	%g1, [%fp+96]
.L71:
	.loc 1 491 0
	ld	[%fp+96], %g2
	sethi	%hi(8192), %g1
	or	%g1, 16, %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L72
	 nop
	.loc 1 492 0
	ld	[%fp+96], %g1
	and	%g1, 2048, %g1
	cmp	%g1, 0
	bne	.L73
	 nop
	.loc 1 492 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	cmp	%g1, 0
	be	.L73
	 nop
	ld	[%fp+76], %g2
	ld	[%fp+88], %g1
	cmp	%g2, %g1
	be	.L74
	 nop
	ld	[%fp+76], %g2
	ld	[%fp+92], %g1
	cmp	%g2, %g1
	bne	.L73
	 nop
.L74:
	.loc 1 495 0 is_stmt 1
	ld	[%fp-4], %g2
	ld	[%fp+76], %g1
	cmp	%g2, %g1
	bgeu	.L75
	 nop
	.loc 1 496 0
	ld	[%fp+76], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+76]
.L75:
	.loc 1 498 0
	ld	[%fp+76], %g1
	cmp	%g1, 0
	be	.L73
	 nop
	.loc 1 498 0 is_stmt 0 discriminator 1
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 16
	be	.L76
	 nop
	.loc 1 498 0 discriminator 2
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 2
	bne	.L73
	 nop
.L76:
	.loc 1 498 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp+76], %g1
	cmp	%g2, %g1
	bgeu	.L73
	 nop
	.loc 1 499 0 is_stmt 1
	ld	[%fp+76], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+76]
.L73:
	.loc 1 502 0
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 16
	bne	.L77
	 nop
	.loc 1 502 0 is_stmt 0 discriminator 1
	ld	[%fp+96], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	bne	.L77
	 nop
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bgu	.L77
	 nop
	.loc 1 503 0 is_stmt 1
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	120, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
	b	.L78
	 nop
.L77:
	.loc 1 505 0
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 16
	bne	.L79
	 nop
	.loc 1 505 0 is_stmt 0 discriminator 1
	ld	[%fp+96], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	be	.L79
	 nop
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bgu	.L79
	 nop
	.loc 1 506 0 is_stmt 1
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	88, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
	b	.L78
	 nop
.L79:
	.loc 1 508 0
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 2
	bne	.L78
	 nop
	.loc 1 508 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bgu	.L78
	 nop
	.loc 1 509 0 is_stmt 1
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	98, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
.L78:
	.loc 1 511 0
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bgu	.L72
	 nop
	.loc 1 512 0
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
.L72:
	.loc 1 516 0
	ld	[%fp+76], %g1
	cmp	%g1, 31
	bgu	.L80
	 nop
	.loc 1 517 0
	ldub	[%fp+80], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L81
	 nop
	.loc 1 518 0
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	45, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
	b	.L80
	 nop
.L81:
	.loc 1 520 0
	ld	[%fp+96], %g1
	and	%g1, 4, %g1
	cmp	%g1, 0
	be	.L82
	 nop
	.loc 1 521 0
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	43, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
	b	.L80
	 nop
.L82:
	.loc 1 523 0
	ld	[%fp+96], %g1
	and	%g1, 8, %g1
	cmp	%g1, 0
	be	.L80
	 nop
	.loc 1 524 0
	ld	[%fp+72], %g2
	ld	[%fp+76], %g1
	add	%g2, %g1, %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+76]
.L80:
	.loc 1 528 0
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp+76], %o2
	ld	[%fp+92], %o3
	ld	[%fp+96], %o4
	call	out_rev_, 0
	 nop
	.loc 1 529 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE15:
	.size	print_integer_finalization, .-print_integer_finalization
	.global __umoddi3
	.global __udivdi3
	.align 4
	.type	print_integer, #function
	.proc	020
print_integer:
.LFB16:
	.loc 1 533 0
	.cfi_startproc
	save	%sp, -152, %sp
.LCFI16:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp-48]
	st	%i2, [%fp-44]
	mov	%i3, %g2
	mov	%i4, %g1
	st	%i5, [%fp+88]
	stb	%g2, [%fp+80]
	stb	%g1, [%fp+84]
	.loc 1 535 0
	st	%g0, [%fp-4]
	.loc 1 537 0
	ld	[%fp-48], %g1
	ld	[%fp-44], %g2
	or	%g1, %g2, %g1
	cmp	%g1, 0
	bne	.L85
	 nop
	.loc 1 538 0
	ld	[%fp+96], %g1
	and	%g1, 2048, %g1
	cmp	%g1, 0
	bne	.L86
	 nop
	.loc 1 539 0
	ld	[%fp-4], %g1
	add	%fp, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1-40]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 540 0
	ld	[%fp+96], %g1
	and	%g1, -17, %g1
	st	%g1, [%fp+96]
	b	.L87
	 nop
.L86:
	.loc 1 545 0
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 16
	bne	.L87
	 nop
	.loc 1 546 0
	ld	[%fp+96], %g1
	and	%g1, -17, %g1
	st	%g1, [%fp+96]
	b	.L87
	 nop
.L85:
.LBB5:
	.loc 1 553 0
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	mov	0, %g2
	mov	%g1, %g3
	ldd	[%fp-48], %i4
	mov	%i4, %o0
	mov	%i5, %o1
	mov	%g2, %o2
	mov	%g3, %o3
	call	__umoddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	stb	%g3, [%fp-5]
	.loc 1 554 0
	ldub	[%fp-5], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 9
	bg	.L88
	 nop
	.loc 1 554 0 is_stmt 0 discriminator 1
	ldub	[%fp-5], %g1
	add	%g1, 48, %g1
	b	.L89
	 nop
.L88:
	.loc 1 554 0 discriminator 2
	ld	[%fp+96], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	be	.L90
	 nop
	.loc 1 554 0 discriminator 3
	mov	65, %g1
	b	.L91
	 nop
.L90:
	.loc 1 554 0 discriminator 4
	mov	97, %g1
.L91:
	.loc 1 554 0 discriminator 5
	ldub	[%fp-5], %g2
	add	%g1, %g2, %g1
	add	%g1, -10, %g1
.L89:
	.loc 1 554 0 discriminator 6
	ld	[%fp-4], %g2
	add	%fp, %g2, %g2
	stb	%g1, [%g2-40]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 555 0 is_stmt 1 discriminator 6
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	mov	0, %g2
	mov	%g1, %g3
	ldd	[%fp-48], %o0
	mov	%g2, %o2
	mov	%g3, %o3
	call	__udivdi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%fp-48]
.LBE5:
	.loc 1 556 0 discriminator 6
	ld	[%fp-48], %g1
	ld	[%fp-44], %g2
	or	%g1, %g2, %g1
	cmp	%g1, 0
	be	.L87
	 nop
	.loc 1 556 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 31
	bleu	.L85
	 nop
.L87:
	.loc 1 559 0 is_stmt 1
	add	%fp, -40, %g3
	ldub	[%fp+80], %g1
	and	%g1, 0xff, %g2
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	ld	[%fp+92], %g4
	st	%g4, [%sp+92]
	ld	[%fp+96], %g4
	st	%g4, [%sp+96]
	ld	[%fp+68], %o0
	mov	%g3, %o1
	ld	[%fp-4], %o2
	mov	%g2, %o3
	mov	%g1, %o4
	ld	[%fp+88], %o5
	call	print_integer_finalization, 0
	 nop
	.loc 1 560 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE16:
	.size	print_integer, .-print_integer
	.section	".rodata"
	.align 8
	.type	powers_of_10, #object
	.size	powers_of_10, 144
powers_of_10:
	.long	1072693248
	.long	0
	.long	1076101120
	.long	0
	.long	1079574528
	.long	0
	.long	1083129856
	.long	0
	.long	1086556160
	.long	0
	.long	1090021888
	.long	0
	.long	1093567616
	.long	0
	.long	1097011920
	.long	0
	.long	1100470148
	.long	0
	.long	1104006501
	.long	0
	.long	1107468383
	.long	536870912
	.long	1110919286
	.long	3892314112
	.long	1114446484
	.long	2717908992
	.long	1117925532
	.long	3846176768
	.long	1121369284
	.long	512753664
	.long	1124887541
	.long	640942080
	.long	1128383353
	.long	937459712
	.long	1131820119
	.long	2245566464
	.global __fixdfdi
	.global __floatdidf
	.align 8
.LC0:
	.long	1071644672
	.long	0
	.section	".text"
	.align 4
	.type	get_components, #function
	.proc	010
get_components:
.LFB17:
	.loc 1 588 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI17:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %i5
	std	%i0, [%fp-48]
	st	%i2, [%fp+76]
	.loc 1 590 0
	ldd	[%fp-48], %o0
	call	get_sign_bit, 0
	 nop
	mov	%o0, %g1
	xor	%g1, 0, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, 0, %g1
	stb	%g1, [%fp-24]
	.loc 1 591 0
	ldub	[%fp-24], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L94
	 nop
	.loc 1 591 0 is_stmt 0 discriminator 1
	ldd	[%fp-48], %f8
	fnegs	%f8, %f8
	b	.L95
	 nop
.L94:
	.loc 1 591 0 discriminator 2
	ldd	[%fp-48], %f8
.L95:
	.loc 1 591 0 discriminator 3
	std	%f8, [%fp-8]
	.loc 1 592 0 is_stmt 1 discriminator 3
	ldd	[%fp-8], %o0
	call	__fixdfdi, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%fp-40]
	.loc 1 593 0 discriminator 3
	ldd	[%fp-40], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	ldd	[%fp-8], %f10
	fsubd	%f10, %f8, %f10
	sethi	%hi(powers_of_10), %g1
	or	%g1, %lo(powers_of_10), %g2
	ld	[%fp+76], %g1
	sll	%g1, 3, %g1
	add	%g2, %g1, %g1
	ldd	[%g1], %f8
	fmuld	%f10, %f8, %f8
	std	%f8, [%fp-16]
	.loc 1 594 0 discriminator 3
	ldd	[%fp-16], %o0
	call	__fixdfdi, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%fp-32]
	.loc 1 596 0 discriminator 3
	ldd	[%fp-32], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	ldd	[%fp-16], %f10
	fsubd	%f10, %f8, %f8
	std	%f8, [%fp-16]
	.loc 1 598 0 discriminator 3
	ldd	[%fp-16], %f10
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbule	.L111
	 nop
.L109:
	.loc 1 599 0
	ldd	[%fp-32], %i2
	addcc	%i3, 1, %g3
	addx	%i2, 0, %g2
	std	%g2, [%fp-32]
	.loc 1 601 0
	ldd	[%fp-32], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f10
	fmovs	%f1, %f11
	sethi	%hi(powers_of_10), %g1
	or	%g1, %lo(powers_of_10), %g2
	ld	[%fp+76], %g1
	sll	%g1, 3, %g1
	add	%g2, %g1, %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbul	.L98
	 nop
.L110:
	.loc 1 602 0
	st	%g0, [%fp-32]
	st	%g0, [%fp-28]
	.loc 1 603 0
	ldd	[%fp-40], %i2
	addcc	%i3, 1, %g3
	addx	%i2, 0, %g2
	std	%g2, [%fp-40]
	b	.L98
	 nop
.L111:
	.loc 1 606 0
	ldd	[%fp-16], %f10
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldd	[%g1], %f8
	fcmpd	%f10, %f8
	nop
	fbne	.L98
	 nop
	.loc 1 606 0 is_stmt 0 discriminator 1
	ldd	[%fp-32], %g2
	mov	%g2, %g1
	or	%g1, %g3, %g1
	cmp	%g1, 0
	be	.L100
	 nop
	ldd	[%fp-32], %g2
	and	%g2, 0, %g2
	and	%g3, 1, %g3
	mov	%g2, %g1
	or	%g1, %g3, %g1
	cmp	%g1, 0
	be	.L98
	 nop
.L100:
	.loc 1 608 0 is_stmt 1
	ldd	[%fp-32], %i2
	addcc	%i3, 1, %g3
	addx	%i2, 0, %g2
	std	%g2, [%fp-32]
.L98:
	.loc 1 611 0
	ld	[%fp+76], %g1
	cmp	%g1, 0
	bne	.L103
	 nop
	.loc 1 612 0
	ldd	[%fp-40], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	ldd	[%fp-8], %f10
	fsubd	%f10, %f8, %f8
	std	%f8, [%fp-16]
	.loc 1 613 0
	mov	1, %g1
	ldd	[%fp-16], %f10
	sethi	%hi(.LC0), %g2
	or	%g2, %lo(.LC0), %g2
	ldd	[%g2], %f8
	fcmped	%f10, %f8
	nop
	fbl	.L104
	 nop
	mov	0, %g1
.L104:
	xor	%g1, 1, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L105
	 nop
	.loc 1 613 0 is_stmt 0 discriminator 2
	ldd	[%fp-16], %f10
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbule	.L103
	 nop
.L105:
	.loc 1 613 0 discriminator 1
	ldd	[%fp-40], %g2
	and	%g2, 0, %g2
	and	%g3, 1, %g3
	mov	%g2, %g1
	or	%g1, %g3, %g1
	cmp	%g1, 0
	be	.L103
	 nop
	.loc 1 616 0 is_stmt 1
	ldd	[%fp-40], %i2
	addcc	%i3, 1, %g3
	addx	%i2, 0, %g2
	std	%g2, [%fp-40]
.L103:
	.loc 1 619 0
	ldd	[%fp-40], %g2
	std	%g2, [%i5]
	ldd	[%fp-32], %g2
	std	%g2, [%i5+8]
	ldd	[%fp-24], %g2
	std	%g2, [%i5+16]
	.loc 1 620 0
	mov	%i5, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE17:
	.size	get_components, .-get_components
	.align 4
	.type	apply_scaling, #function
	.proc	07
apply_scaling:
.LFB18:
	.loc 1 629 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI18:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-8]
	mov	%i2, %g1
	.loc 1 630 0
	ldub	[%g1+8], %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 0
	be	.L113
	 nop
	.loc 1 630 0 is_stmt 0 discriminator 1
	ldd	[%g1], %f10
	ldd	[%fp-8], %f8
	fmuld	%f10, %f8, %f8
	b	.L114
	 nop
.L113:
	.loc 1 630 0 discriminator 2
	ldd	[%g1], %f8
	ldd	[%fp-8], %f10
	fdivd	%f10, %f8, %f8
.L114:
	.loc 1 631 0 is_stmt 1 discriminator 3
	fmovs	%f8, %f0
	fmovs	%f9, %f1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE18:
	.size	apply_scaling, .-apply_scaling
	.align 4
	.type	unapply_scaling, #function
	.proc	07
unapply_scaling:
.LFB19:
	.loc 1 634 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI19:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-8]
	mov	%i2, %g1
	.loc 1 635 0
	ldub	[%g1+8], %g2
	and	%g2, 0xff, %g2
	cmp	%g2, 0
	be	.L117
	 nop
	.loc 1 635 0 is_stmt 0 discriminator 1
	ldd	[%g1], %f8
	ldd	[%fp-8], %f10
	fdivd	%f10, %f8, %f8
	b	.L118
	 nop
.L117:
	.loc 1 635 0 discriminator 2
	ldd	[%g1], %f10
	ldd	[%fp-8], %f8
	fmuld	%f10, %f8, %f8
.L118:
	.loc 1 636 0 is_stmt 1 discriminator 3
	fmovs	%f8, %f0
	fmovs	%f9, %f1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE19:
	.size	unapply_scaling, .-unapply_scaling
	.align 4
	.type	update_normalization, #function
	.proc	010
update_normalization:
.LFB20:
	.loc 1 639 0
	.cfi_startproc
	save	%sp, -160, %sp
.LCFI20:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %i4
	mov	%i0, %i5
	st	%i1, [%fp-48]
	st	%i2, [%fp-44]
	.loc 1 641 0
	ldub	[%i5+8], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L121
	 nop
	.loc 1 642 0
	mov	1, %g1
	stb	%g1, [%fp-32]
	.loc 1 643 0
	ldd	[%i5], %f10
	ldd	[%fp-48], %f8
	fmuld	%f10, %f8, %f8
	std	%f8, [%fp-40]
	b	.L122
	 nop
.L121:
.LBB6:
	.loc 1 646 0
	ldd	[%i5], %f8
	add	%fp, -24, %g1
	st	%g1, [%sp+64]
	std	%f8, [%fp-64]
	ldd	[%fp-64], %o0
	call	get_bit_access, 0
	 nop
	unimp	8
	ldd	[%fp-24], %g2
	std	%g2, [%fp-56]
	add	%fp, -56, %g1
	mov	%g1, %o0
	call	get_exp2, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 647 0
	add	%fp, -16, %g1
	st	%g1, [%sp+64]
	ldd	[%fp-48], %o0
	call	get_bit_access, 0
	 nop
	unimp	8
	ldd	[%fp-16], %g2
	std	%g2, [%fp-56]
	add	%fp, -56, %g1
	mov	%g1, %o0
	call	get_exp2, 0
	 nop
	st	%o0, [%fp-8]
	.loc 1 650 0
	ld	[%fp-4], %g1
	sra	%g1, 31, %g1
	ld	[%fp-4], %g2
	xor	%g1, %g2, %g2
	sub	%g2, %g1, %g2
	ld	[%fp-8], %g1
	sra	%g1, 31, %g3
	ld	[%fp-8], %g1
	xor	%g3, %g1, %g1
	sub	%g1, %g3, %g1
	cmp	%g2, %g1
	ble	.L123
	 nop
	.loc 1 651 0
	stb	%g0, [%fp-32]
	.loc 1 652 0
	ldd	[%i5], %f10
	ldd	[%fp-48], %f8
	fdivd	%f10, %f8, %f8
	std	%f8, [%fp-40]
	b	.L122
	 nop
.L123:
	.loc 1 655 0
	mov	1, %g1
	stb	%g1, [%fp-32]
	.loc 1 656 0
	ldd	[%i5], %f8
	ldd	[%fp-48], %f10
	fdivd	%f10, %f8, %f8
	std	%f8, [%fp-40]
.L122:
.LBE6:
	.loc 1 659 0
	ldd	[%fp-40], %g2
	std	%g2, [%i4]
	ldd	[%fp-32], %g2
	std	%g2, [%i4+8]
	.loc 1 660 0
	mov	%i4, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE20:
	.size	update_normalization, .-update_normalization
	.section	".rodata"
	.align 8
.LC1:
	.long	1071644672
	.long	0
	.section	".text"
	.align 4
	.type	get_normalized_components, #function
	.proc	010
get_normalized_components:
.LFB21:
	.loc 1 663 0
	.cfi_startproc
	save	%sp, -216, %sp
.LCFI21:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	ld	[%fp+64], %l0
	mov	%i0, %g1
	st	%i1, [%fp+72]
	std	%i2, [%fp-96]
	st	%i5, [%fp+88]
	stb	%g1, [%fp+68]
	.loc 1 665 0
	ldub	[%fp+68], %g1
	stb	%g1, [%fp-56]
	.loc 1 666 0
	ldd	[%i4], %g2
	std	%g2, [%fp-112]
	ldd	[%i4+8], %g2
	std	%g2, [%fp-104]
	add	%fp, -112, %g1
	ldd	[%fp-96], %o0
	mov	%g1, %o2
	call	apply_scaling, 0
	 nop
	std	%f0, [%fp-8]
	.loc 1 668 0
	ld	[%fp+72], %g2
	ld	[%fp+88], %g1
	sub	%g2, %g1, %g2
	mov	1, %g1
	cmp	%g2, 306
	bg	.L126
	 nop
	mov	0, %g1
.L126:
	stb	%g1, [%fp-9]
	.loc 1 669 0
	ldub	[%fp-9], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L127
	 nop
	.loc 1 673 0
	ldub	[%fp+68], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L128
	 nop
	.loc 1 673 0 is_stmt 0 discriminator 1
	ldd	[%fp-8], %f8
	fnegs	%f8, %f8
	b	.L129
	 nop
.L128:
	.loc 1 673 0 discriminator 2
	ldd	[%fp-8], %f8
.L129:
	.loc 1 673 0 discriminator 3
	st	%l0, [%sp+64]
	std	%f8, [%fp-120]
	ldd	[%fp-120], %o0
	ld	[%fp+72], %o2
	call	get_components, 0
	 nop
	unimp	24
	b	.L125
	 nop
.L127:
	.loc 1 675 0 is_stmt 1
	ldd	[%fp-8], %o0
	call	__fixdfdi, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%fp-72]
	.loc 1 676 0
	ldd	[%fp-72], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	ldd	[%i4], %g2
	std	%g2, [%fp-112]
	ldd	[%i4+8], %g2
	std	%g2, [%fp-104]
	add	%fp, -112, %g1
	std	%f8, [%fp-120]
	ldd	[%fp-120], %o0
	mov	%g1, %o2
	call	unapply_scaling, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	ldd	[%fp-96], %f10
	fsubd	%f10, %f8, %f8
	std	%f8, [%fp-24]
	.loc 1 677 0
	sethi	%hi(powers_of_10), %g1
	or	%g1, %lo(powers_of_10), %g2
	ld	[%fp+72], %g1
	sll	%g1, 3, %g1
	add	%g2, %g1, %g1
	ldd	[%g1], %f8
	std	%f8, [%fp-32]
	.loc 1 678 0
	ldd	[%i4], %g2
	std	%g2, [%fp-112]
	ldd	[%i4+8], %g2
	std	%g2, [%fp-104]
	add	%fp, -112, %g1
	add	%fp, -88, %g2
	st	%g2, [%sp+64]
	mov	%g1, %o0
	ld	[%fp-32], %o1
	ld	[%fp-28], %o2
	call	update_normalization, 0
	 nop
	unimp	16
	.loc 1 679 0
	ldd	[%fp-88], %g2
	std	%g2, [%fp-112]
	ldd	[%fp-80], %g2
	std	%g2, [%fp-104]
	add	%fp, -112, %g1
	ldd	[%fp-24], %o0
	mov	%g1, %o2
	call	apply_scaling, 0
	 nop
	std	%f0, [%fp-40]
	.loc 1 680 0
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
	ldd	[%g1], %f8
	std	%f8, [%fp-48]
	.loc 1 682 0
	ldd	[%fp-40], %o0
	call	__fixdfdi, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%fp-64]
	.loc 1 683 0
	ldd	[%fp-64], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	ldd	[%fp-40], %f10
	fsubd	%f10, %f8, %f8
	std	%f8, [%fp-40]
	.loc 1 685 0
	ldd	[%fp-64], %i2
	mov	1, %g1
	ldd	[%fp-40], %f10
	ldd	[%fp-48], %f8
	fcmped	%f10, %f8
	nop
	fbge	.L131
	 nop
	mov	0, %g1
.L131:
	and	%g1, 0xff, %g1
	mov	0, %i4
	mov	%g1, %i5
	addcc	%i3, %i5, %g3
	addx	%i2, %i4, %g2
	std	%g2, [%fp-64]
	.loc 1 686 0
	ldd	[%fp-40], %f10
	ldd	[%fp-48], %f8
	fcmpd	%f10, %f8
	nop
	fbne	.L132
	 nop
	.loc 1 688 0
	ldd	[%fp-64], %g2
	and	%g2, -1, %g2
	and	%g3, -2, %g3
	std	%g2, [%fp-64]
.L132:
	.loc 1 695 0
	ldd	[%fp-64], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f10
	fmovs	%f1, %f11
	ldd	[%fp-32], %f8
	fcmped	%f10, %f8
	nop
	fbul	.L133
	 nop
.L136:
	.loc 1 696 0
	st	%g0, [%fp-64]
	st	%g0, [%fp-60]
	.loc 1 697 0
	ldd	[%fp-72], %i4
	addcc	%i5, 1, %g3
	addx	%i4, 0, %g2
	std	%g2, [%fp-72]
.L133:
	.loc 1 699 0
	ldd	[%fp-72], %g2
	std	%g2, [%l0]
	ldd	[%fp-64], %g2
	std	%g2, [%l0+8]
	ldd	[%fp-56], %g2
	std	%g2, [%l0+16]
.L125:
	.loc 1 700 0
	mov	%l0, %i0
	restore
	jmp	%o7+12
	 nop
	.cfi_endproc
.LFE21:
	.size	get_normalized_components, .-get_normalized_components
	.global __moddi3
	.global __divdi3
	.align 4
	.type	print_broken_up_decimal, #function
	.proc	020
print_broken_up_decimal:
.LFB22:
	.loc 1 706 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI22:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 707 0
	ld	[%fp+76], %g1
	cmp	%g1, 0
	be	.L138
	 nop
.LBB7:
	.loc 1 710 0
	ld	[%fp+76], %g1
	st	%g1, [%fp-4]
	.loc 1 713 0
	ld	[%fp+84], %g2
	sethi	%hi(4096), %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L139
	 nop
	.loc 1 713 0 is_stmt 0 discriminator 1
	ld	[%fp+84], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	bne	.L139
	 nop
	ldd	[%i0+8], %g2
	cmp	%g2, 0
	bg	.L143
	 nop
	cmp	%g2, 0
	bne	.L139
	 nop
	cmp	%g3, 0
	be	.L139
	 nop
.L143:
.LBB8:
	.loc 1 715 0 is_stmt 1
	ldd	[%i0+8], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	10, %o3
	call	__moddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%fp-16]
	.loc 1 716 0
	ld	[%fp-16], %g1
	ld	[%fp-12], %g2
	or	%g1, %g2, %g1
	cmp	%g1, 0
	be	.L141
	 nop
	.loc 1 717 0
	b	.L139
	 nop
.L141:
	.loc 1 719 0
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
	.loc 1 720 0
	ldd	[%i0+8], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	10, %o3
	call	__divdi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%i0+8]
.LBE8:
	.loc 1 722 0
	b	.L143
	 nop
.L139:
	.loc 1 727 0
	ldd	[%i0+8], %g2
	cmp	%g2, 0
	bg	.L147
	 nop
	cmp	%g2, 0
	bne	.L164
	 nop
	cmp	%g3, 0
	bne	.L147
	 nop
.L164:
	.loc 1 727 0 is_stmt 0 discriminator 1
	ld	[%fp+84], %g2
	sethi	%hi(4096), %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L147
	 nop
	ld	[%fp+84], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	be	.L153
	 nop
	.loc 1 728 0 is_stmt 1
	b	.L147
	 nop
.L149:
	.loc 1 729 0
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
	.loc 1 730 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %i5
	ldd	[%i0+8], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	10, %o3
	call	__moddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	mov	%g3, %g1
	add	%g1, 48, %g1
	stb	%g1, [%i5]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
	.loc 1 731 0
	ldd	[%i0+8], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	10, %o3
	call	__divdi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%i0+8]
	ldd	[%i0+8], %g2
	mov	%g2, %g1
	or	%g1, %g3, %g1
	cmp	%g1, 0
	be	.L166
	 nop
.L147:
	.loc 1 728 0 discriminator 1
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bleu	.L149
	 nop
	.loc 1 736 0
	b	.L150
	 nop
.L166:
	.loc 1 732 0
	nop
.L165:
	.loc 1 736 0
	b	.L150
	 nop
.L152:
	.loc 1 737 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
	.loc 1 738 0
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
.L150:
	.loc 1 736 0 discriminator 1
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bgu	.L151
	 nop
	.loc 1 736 0 is_stmt 0 discriminator 2
	ld	[%fp-4], %g1
	cmp	%g1, 0
	bne	.L152
	 nop
.L151:
	.loc 1 740 0 is_stmt 1
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bgu	.L153
	 nop
	.loc 1 741 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	46, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
.LBE7:
	.loc 1 753 0
	b	.L153
	 nop
.L138:
	.loc 1 746 0
	ld	[%fp+84], %g1
	and	%g1, 16, %g1
	cmp	%g1, 0
	be	.L153
	 nop
	.loc 1 746 0 is_stmt 0 discriminator 1
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bgu	.L153
	 nop
	.loc 1 747 0 is_stmt 1
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	46, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
	.loc 1 753 0
	b	.L153
	 nop
.L155:
	.loc 1 754 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %i5
	ldd	[%i0], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	10, %o3
	call	__moddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	mov	%g3, %g1
	add	%g1, 48, %g1
	stb	%g1, [%i5]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
	.loc 1 755 0
	ldd	[%i0], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	10, %o3
	call	__divdi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	std	%g2, [%i0]
	ldd	[%i0], %g2
	mov	%g2, %g1
	or	%g1, %g3, %g1
	cmp	%g1, 0
	be	.L167
	 nop
.L153:
	.loc 1 753 0 discriminator 1
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bleu	.L155
	 nop
	b	.L154
	 nop
.L167:
	.loc 1 756 0
	nop
.L154:
	.loc 1 761 0
	ld	[%fp+84], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	bne	.L156
	 nop
	.loc 1 761 0 is_stmt 0 discriminator 1
	ld	[%fp+84], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L156
	 nop
	.loc 1 762 0 is_stmt 1
	ld	[%fp+80], %g1
	cmp	%g1, 0
	be	.L159
	 nop
	.loc 1 762 0 is_stmt 0 discriminator 1
	ldub	[%i0+16], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L158
	 nop
	ld	[%fp+84], %g1
	and	%g1, 12, %g1
	cmp	%g1, 0
	be	.L159
	 nop
.L158:
	.loc 1 763 0 is_stmt 1
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
	.loc 1 765 0
	b	.L159
	 nop
.L160:
	.loc 1 766 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
.L159:
	.loc 1 765 0 discriminator 1
	ld	[%fp+92], %g2
	ld	[%fp+80], %g1
	cmp	%g2, %g1
	bgeu	.L156
	 nop
	.loc 1 765 0 is_stmt 0 discriminator 2
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bleu	.L160
	 nop
.L156:
	.loc 1 770 0 is_stmt 1
	ld	[%fp+92], %g1
	cmp	%g1, 31
	bgu	.L161
	 nop
	.loc 1 771 0
	ldub	[%i0+16], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L162
	 nop
	.loc 1 772 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	45, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
	b	.L161
	 nop
.L162:
	.loc 1 774 0
	ld	[%fp+84], %g1
	and	%g1, 4, %g1
	cmp	%g1, 0
	be	.L163
	 nop
	.loc 1 775 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	43, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
	b	.L161
	 nop
.L163:
	.loc 1 777 0
	ld	[%fp+84], %g1
	and	%g1, 8, %g1
	cmp	%g1, 0
	be	.L161
	 nop
	.loc 1 778 0
	ld	[%fp+88], %g2
	ld	[%fp+92], %g1
	add	%g2, %g1, %g1
	mov	32, %g2
	stb	%g2, [%g1]
	ld	[%fp+92], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+92]
.L161:
	.loc 1 782 0
	ld	[%fp+72], %o0
	ld	[%fp+88], %o1
	ld	[%fp+92], %o2
	ld	[%fp+80], %o3
	ld	[%fp+84], %o4
	call	out_rev_, 0
	 nop
	.loc 1 783 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE22:
	.size	print_broken_up_decimal, .-print_broken_up_decimal
	.align 4
	.type	print_decimal_number, #function
	.proc	020
print_decimal_number:
.LFB23:
	.loc 1 787 0
	.cfi_startproc
	save	%sp, -160, %sp
.LCFI23:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp-32]
	st	%i2, [%fp-28]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 788 0
	add	%fp, -24, %g1
	st	%g1, [%sp+64]
	ldd	[%fp-32], %o0
	ld	[%fp+80], %o2
	call	get_components, 0
	 nop
	unimp	24
	.loc 1 789 0
	ldd	[%fp-24], %g2
	std	%g2, [%fp-56]
	ldd	[%fp-16], %g2
	std	%g2, [%fp-48]
	ldd	[%fp-8], %g2
	std	%g2, [%fp-40]
	add	%fp, -56, %g1
	ld	[%fp+96], %g2
	st	%g2, [%sp+92]
	mov	%g1, %o0
	ld	[%fp+68], %o1
	ld	[%fp+80], %o2
	ld	[%fp+84], %o3
	ld	[%fp+88], %o4
	ld	[%fp+92], %o5
	call	print_broken_up_decimal, 0
	 nop
	.loc 1 790 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE23:
	.size	print_decimal_number, .-print_decimal_number
	.section	".rodata"
	.align 8
.LC2:
	.long	0
	.long	0
	.section	".text"
	.align 4
	.type	bastardized_floor, #function
	.proc	04
bastardized_floor:
.LFB24:
	.loc 1 797 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI24:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-16]
	.loc 1 798 0
	ldd	[%fp-16], %f10
	sethi	%hi(.LC2), %g1
	or	%g1, %lo(.LC2), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbul	.L176
	 nop
.L175:
	.loc 1 798 0 is_stmt 0 discriminator 1
	ldd	[%fp-16], %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-20]
	ld	[%fp-20], %g1
	b	.L172
	 nop
.L176:
	.loc 1 799 0 is_stmt 1
	ldd	[%fp-16], %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-20]
	ld	[%fp-20], %g1
	st	%g1, [%fp-4]
	.loc 1 800 0
	ld	[%fp-4], %g1
	st	%g1, [%fp-20]
	ld	[%fp-20], %f8
	fitod	%f8, %f10
	ldd	[%fp-16], %f8
	fcmpd	%f10, %f8
	nop
	fbe	.L173
	 nop
	.loc 1 800 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	b	.L174
	 nop
.L173:
	.loc 1 800 0 discriminator 2
	ld	[%fp-4], %g1
.L174:
.L172:
	.loc 1 801 0 is_stmt 1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE24:
	.size	bastardized_floor, .-bastardized_floor
	.section	".rodata"
	.align 8
.LC3:
	.long	1073217536
	.long	0
	.align 8
.LC4:
	.long	1070761895
	.long	1668236127
	.align 8
.LC5:
	.long	1069976104
	.long	2338371580
	.align 8
.LC6:
	.long	1069069535
	.long	792659070
	.align 8
.LC7:
	.long	1067841051
	.long	3090678783
	.align 8
.LC8:
	.long	1070810131
	.long	1352628735
	.section	".text"
	.align 4
	.type	log10_of_positive, #function
	.proc	07
log10_of_positive:
.LFB25:
	.loc 1 806 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI25:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	std	%i0, [%fp-32]
	.loc 1 815 0
	add	%fp, -24, %g1
	st	%g1, [%sp+64]
	ldd	[%fp-32], %o0
	call	get_bit_access, 0
	 nop
	unimp	8
	.loc 1 817 0
	ldd	[%fp-24], %g2
	std	%g2, [%fp-40]
	add	%fp, -40, %g1
	mov	%g1, %o0
	call	get_exp2, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 819 0
	ldd	[%fp-24], %i4
	sethi	%hi(1047552), %g2
	or	%g2, 1023, %g2
	sethi	%hi(4294966272), %g3
	or	%g3, 1023, %g3
	and	%i4, %g2, %i4
	and	%i5, %g3, %i5
	sethi	%hi(1072693248), %g2
	mov	0, %g3
	or	%i4, %g2, %g2
	or	%i5, %g3, %g3
	std	%g2, [%fp-24]
	.loc 1 821 0
	ldd	[%fp-24], %f10
	sethi	%hi(.LC3), %g1
	or	%g1, %lo(.LC3), %g1
	ldd	[%g1], %f8
	fsubd	%f10, %f8, %f8
	std	%f8, [%fp-16]
	.loc 1 825 0
	ldd	[%fp-16], %f10
	sethi	%hi(.LC4), %g1
	or	%g1, %lo(.LC4), %g1
	ldd	[%g1], %f8
	fmuld	%f10, %f8, %f10
	sethi	%hi(.LC5), %g1
	or	%g1, %lo(.LC5), %g1
	ldd	[%g1], %f8
	faddd	%f10, %f8, %f10
	.loc 1 827 0
	ldd	[%fp-16], %f12
	ldd	[%fp-16], %f8
	fmuld	%f12, %f8, %f12
	sethi	%hi(.LC6), %g1
	or	%g1, %lo(.LC6), %g1
	ldd	[%g1], %f8
	fmuld	%f12, %f8, %f8
	fsubd	%f10, %f8, %f10
	.loc 1 829 0
	ldd	[%fp-16], %f12
	ldd	[%fp-16], %f8
	fmuld	%f12, %f8, %f12
	ldd	[%fp-16], %f8
	fmuld	%f12, %f8, %f12
	sethi	%hi(.LC7), %g1
	or	%g1, %lo(.LC7), %g1
	ldd	[%g1], %f8
	fmuld	%f12, %f8, %f8
	faddd	%f10, %f8, %f10
	.loc 1 833 0
	ld	[%fp-4], %g1
	st	%g1, [%fp-44]
	ld	[%fp-44], %f8
	fitod	%f8, %f12
	sethi	%hi(.LC8), %g1
	or	%g1, %lo(.LC8), %g1
	ldd	[%g1], %f8
	fmuld	%f12, %f8, %f8
	.loc 1 822 0
	faddd	%f10, %f8, %f8
	.loc 1 835 0
	fmovs	%f8, %f0
	fmovs	%f9, %f1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE25:
	.size	log10_of_positive, .-log10_of_positive
	.section	".rodata"
	.align 8
.LC9:
	.long	471254
	.long	2014963922
	.align 8
.LC10:
	.long	1074434895
	.long	158966641
	.align 8
.LC11:
	.long	1071644672
	.long	0
	.align 8
.LC12:
	.long	1073900465
	.long	3149223190
	.align 8
.LC13:
	.long	1072049730
	.long	4277811695
	.align 8
.LC14:
	.long	1073741824
	.long	0
	.align 8
.LC15:
	.long	1076625408
	.long	0
	.align 8
.LC16:
	.long	1076101120
	.long	0
	.align 8
.LC17:
	.long	1075314688
	.long	0
	.align 8
.LC18:
	.long	1072693248
	.long	0
	.section	".text"
	.align 4
	.type	pow10_of_int, #function
	.proc	07
pow10_of_int:
.LFB26:
	.loc 1 839 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI26:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 841 0
	ld	[%fp+68], %g1
	cmp	%g1, -308
	bne	.L180
	 nop
	.loc 1 842 0
	sethi	%hi(.LC9), %g1
	or	%g1, %lo(.LC9), %g1
	ldd	[%g1], %f8
	b	.L182
	 nop
.L180:
	.loc 1 846 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-36]
	ld	[%fp-36], %f8
	fitod	%f8, %f10
	sethi	%hi(.LC10), %g1
	or	%g1, %lo(.LC10), %g1
	ldd	[%g1], %f8
	fmuld	%f10, %f8, %f10
	sethi	%hi(.LC11), %g1
	or	%g1, %lo(.LC11), %g1
	ldd	[%g1], %f8
	faddd	%f10, %f8, %f8
	std	%f8, [%fp-48]
	ldd	[%fp-48], %o0
	call	bastardized_floor, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 847 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-36]
	ld	[%fp-36], %f8
	fitod	%f8, %f10
	sethi	%hi(.LC12), %g1
	or	%g1, %lo(.LC12), %g1
	ldd	[%g1], %f8
	fmuld	%f10, %f8, %f10
	ld	[%fp-4], %g1
	st	%g1, [%fp-36]
	ld	[%fp-36], %f8
	fitod	%f8, %f12
	sethi	%hi(.LC13), %g1
	or	%g1, %lo(.LC13), %g1
	ldd	[%g1], %f8
	fmuld	%f12, %f8, %f8
	fsubd	%f10, %f8, %f8
	std	%f8, [%fp-16]
	.loc 1 848 0
	ldd	[%fp-16], %f10
	ldd	[%fp-16], %f8
	fmuld	%f10, %f8, %f8
	std	%f8, [%fp-24]
	.loc 1 849 0
	ld	[%fp-4], %i3
	ld	[%fp-4], %g1
	sra	%g1, 31, %g1
	mov	%g1, %i2
	addcc	%i3, 1023, %g3
	addx	%i2, 0, %g2
	sll	%g3, 20, %i4
	mov	0, %i5
	std	%i4, [%fp-32]
	.loc 1 852 0
	ldd	[%fp-32], %f10
	ldd	[%fp-16], %f8
	faddd	%f8, %f8, %f12
	sethi	%hi(.LC14), %g1
	or	%g1, %lo(.LC14), %g1
	ldd	[%g1], %f14
	ldd	[%fp-16], %f8
	fsubd	%f14, %f8, %f14
	ldd	[%fp-24], %f16
	sethi	%hi(.LC15), %g1
	or	%g1, %lo(.LC15), %g1
	ldd	[%g1], %f8
	fdivd	%f16, %f8, %f16
	sethi	%hi(.LC16), %g1
	or	%g1, %lo(.LC16), %g1
	ldd	[%g1], %f8
	faddd	%f16, %f8, %f8
	ldd	[%fp-24], %f16
	fdivd	%f16, %f8, %f16
	sethi	%hi(.LC17), %g1
	or	%g1, %lo(.LC17), %g1
	ldd	[%g1], %f8
	faddd	%f16, %f8, %f8
	ldd	[%fp-24], %f16
	fdivd	%f16, %f8, %f8
	faddd	%f14, %f8, %f8
	fdivd	%f12, %f8, %f12
	sethi	%hi(.LC18), %g1
	or	%g1, %lo(.LC18), %g1
	ldd	[%g1], %f8
	faddd	%f12, %f8, %f8
	fmuld	%f10, %f8, %f8
	std	%f8, [%fp-32]
	.loc 1 853 0
	ldd	[%fp-32], %f8
.L182:
	.loc 1 854 0
	fmovs	%f8, %f0
	fmovs	%f9, %f1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE26:
	.size	pow10_of_int, .-pow10_of_int
	.section	".rodata"
	.align 8
.LC19:
	.long	0
	.long	0
	.align 8
.LC20:
	.long	1076101120
	.long	0
	.section	".text"
	.align 4
	.type	print_exponential_number, #function
	.proc	020
print_exponential_number:
.LFB27:
	.loc 1 857 0
	.cfi_startproc
	save	%sp, -264, %sp
.LCFI27:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp-112]
	st	%i2, [%fp-108]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 858 0
	ldd	[%fp-112], %o0
	call	get_sign_bit, 0
	 nop
	mov	%o0, %g1
	xor	%g1, 0, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, 0, %g1
	stb	%g1, [%fp-18]
	.loc 1 860 0
	ldub	[%fp-18], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L184
	 nop
	.loc 1 860 0 is_stmt 0 discriminator 1
	ldd	[%fp-112], %f8
	fnegs	%f8, %f8
	b	.L185
	 nop
.L184:
	.loc 1 860 0 discriminator 2
	ldd	[%fp-112], %f8
.L185:
	.loc 1 860 0 discriminator 3
	std	%f8, [%fp-32]
	.loc 1 868 0 is_stmt 1 discriminator 3
	ldd	[%fp-32], %f10
	sethi	%hi(.LC19), %g1
	or	%g1, %lo(.LC19), %g1
	ldd	[%g1], %f8
	fcmpd	%f10, %f8
	nop
	fbne	.L186
	 nop
	.loc 1 870 0
	st	%g0, [%fp-4]
	b	.L187
	 nop
.L186:
.LBB9:
	.loc 1 873 0
	ldd	[%fp-32], %o0
	call	log10_of_positive, 0
	 nop
	std	%f0, [%fp-40]
	.loc 1 874 0
	ldd	[%fp-40], %o0
	call	bastardized_floor, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 875 0
	ld	[%fp-4], %o0
	call	pow10_of_int, 0
	 nop
	std	%f0, [%fp-16]
	.loc 1 877 0
	ldd	[%fp-32], %f10
	ldd	[%fp-16], %f8
	fcmped	%f10, %f8
	nop
	fbuge	.L188
	 nop
.L230:
	.loc 1 878 0
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
	.loc 1 879 0
	ldd	[%fp-16], %f10
	sethi	%hi(.LC20), %g1
	or	%g1, %lo(.LC20), %g1
	ldd	[%g1], %f8
	fdivd	%f10, %f8, %f8
	std	%f8, [%fp-16]
.L188:
	.loc 1 881 0
	ld	[%fp-4], %g1
	cmp	%g1, -17
	bl	.L190
	 nop
	.loc 1 881 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 17
	bg	.L190
	 nop
	.loc 1 881 0 discriminator 3
	mov	1, %g1
	b	.L191
	 nop
.L190:
	.loc 1 881 0 discriminator 2
	mov	0, %g1
.L191:
	.loc 1 881 0 discriminator 4
	stb	%g1, [%fp-5]
	ldub	[%fp-5], %g1
	and	%g1, 1, %g1
	stb	%g1, [%fp-5]
	.loc 1 882 0 is_stmt 1 discriminator 4
	ldub	[%fp-5], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L192
	 nop
	.loc 1 882 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	sra	%g1, 31, %g2
	ld	[%fp-4], %g1
	xor	%g2, %g1, %g1
	sub	%g1, %g2, %g1
	sethi	%hi(powers_of_10), %g2
	or	%g2, %lo(powers_of_10), %g2
	sll	%g1, 3, %g1
	add	%g2, %g1, %g1
	ldd	[%g1], %f8
	b	.L193
	 nop
.L192:
	.loc 1 882 0 discriminator 2
	ldd	[%fp-16], %f8
.L193:
	.loc 1 882 0 discriminator 3
	std	%f8, [%fp-80]
.L187:
.LBE9:
	.loc 1 891 0 is_stmt 1
	stb	%g0, [%fp-17]
	.loc 1 892 0
	ld	[%fp+88], %g2
	sethi	%hi(4096), %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L194
	 nop
.LBB10:
	.loc 1 893 0
	ld	[%fp+80], %g1
	cmp	%g1, 0
	be	.L195
	 nop
	.loc 1 893 0 is_stmt 0 discriminator 1
	ld	[%fp+80], %g1
	b	.L196
	 nop
.L195:
	.loc 1 893 0 discriminator 2
	mov	1, %g1
.L196:
	.loc 1 893 0 discriminator 3
	st	%g1, [%fp-44]
	.loc 1 895 0 is_stmt 1 discriminator 3
	ld	[%fp-4], %g1
	cmp	%g1, -4
	bl	.L197
	 nop
	.loc 1 895 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp-44], %g1
	cmp	%g2, %g1
	bge	.L197
	 nop
	.loc 1 895 0 discriminator 3
	mov	1, %g1
	b	.L198
	 nop
.L197:
	.loc 1 895 0 discriminator 2
	mov	0, %g1
.L198:
	.loc 1 895 0 discriminator 4
	stb	%g1, [%fp-17]
	ldub	[%fp-17], %g1
	and	%g1, 1, %g1
	stb	%g1, [%fp-17]
	.loc 1 901 0 is_stmt 1 discriminator 4
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L199
	 nop
	.loc 1 901 0 is_stmt 0 discriminator 1
	ld	[%fp+80], %g1
	add	%g1, -1, %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g1
	b	.L200
	 nop
.L199:
	.loc 1 902 0 is_stmt 1 discriminator 2
	ld	[%fp+80], %g1
	.loc 1 901 0 discriminator 2
	add	%g1, -1, %g1
.L200:
	.loc 1 900 0
	st	%g1, [%fp-48]
	.loc 1 903 0
	ld	[%fp-48], %g1
	cmp	%g1, 0
	bge	.L201
	 nop
	mov	0, %g1
.L201:
	st	%g1, [%fp+80]
	.loc 1 904 0
	ld	[%fp+88], %g1
	or	%g1, 2048, %g1
	st	%g1, [%fp+88]
.L194:
.LBE10:
	.loc 1 907 0
	ld	[%fp-4], %g1
	cmp	%g1, 0
	bge	.L202
	 nop
	.loc 1 907 0 is_stmt 0 discriminator 1
	ldub	[%fp-5], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L202
	 nop
	.loc 1 907 0 discriminator 3
	mov	1, %g1
	b	.L203
	 nop
.L202:
	.loc 1 907 0 discriminator 2
	mov	0, %g1
.L203:
	.loc 1 907 0 discriminator 4
	and	%g1, 1, %g1
	stb	%g1, [%fp-72]
	.loc 1 908 0 is_stmt 1 discriminator 4
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L204
	 nop
	.loc 1 908 0 is_stmt 0 discriminator 2
	ld	[%fp-4], %g1
	cmp	%g1, 0
	bne	.L205
	 nop
.L204:
	.loc 1 908 0 discriminator 1
	mov	1, %g1
	b	.L206
	 nop
.L205:
	.loc 1 908 0 discriminator 3
	mov	0, %g1
.L206:
	.loc 1 908 0 discriminator 4
	stb	%g1, [%fp-49]
	ldub	[%fp-49], %g1
	and	%g1, 1, %g1
	stb	%g1, [%fp-49]
	.loc 1 909 0 is_stmt 1 discriminator 4
	ldub	[%fp-49], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L207
	 nop
	.loc 1 911 0
	ldub	[%fp-18], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L208
	 nop
	.loc 1 911 0 is_stmt 0 discriminator 1
	ldd	[%fp-32], %f8
	fnegs	%f8, %f8
	b	.L209
	 nop
.L208:
	.loc 1 911 0 discriminator 2
	ldd	[%fp-32], %f8
.L209:
	.loc 1 909 0 is_stmt 1
	add	%fp, -104, %g1
	st	%g1, [%sp+64]
	std	%f8, [%fp-160]
	ldd	[%fp-160], %o0
	ld	[%fp+80], %o2
	call	get_components, 0
	 nop
	unimp	24
	b	.L210
	 nop
.L207:
	.loc 1 909 0 is_stmt 0 discriminator 1
	ldd	[%fp-80], %g2
	std	%g2, [%fp-128]
	ldd	[%fp-72], %g2
	std	%g2, [%fp-120]
	ldub	[%fp-18], %g1
	and	%g1, 0xff, %g2
	add	%fp, -128, %g1
	add	%fp, -104, %g3
	st	%g3, [%sp+64]
	mov	%g2, %o0
	ld	[%fp+80], %o1
	ldd	[%fp-32], %o2
	mov	%g1, %o4
	ld	[%fp-4], %o5
	call	get_normalized_components, 0
	 nop
	unimp	24
.L210:
	.loc 1 916 0 is_stmt 1
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L211
	 nop
	.loc 1 917 0
	ld	[%fp+88], %g2
	sethi	%hi(4096), %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L212
	 nop
	.loc 1 917 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, -1
	bl	.L212
	 nop
	ldd	[%fp-104], %g2
	mov	%g2, %o0
	mov	%g3, %o1
	call	__floatdidf, 0
	 nop
	fmovs	%f0, %f10
	fmovs	%f1, %f11
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	sethi	%hi(powers_of_10), %g2
	or	%g2, %lo(powers_of_10), %g2
	sll	%g1, 3, %g1
	add	%g2, %g1, %g1
	ldd	[%g1], %f8
	fcmpd	%f10, %f8
	nop
	fbne	.L212
	 nop
	.loc 1 918 0 is_stmt 1
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 919 0
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
	b	.L212
	 nop
.L211:
	.loc 1 925 0
	ldd	[%fp-104], %g2
	cmp	%g2, 0
	bg	.L231
	 nop
	cmp	%g2, 0
	bne	.L212
	 nop
	cmp	%g3, 9
	bleu	.L212
	 nop
.L231:
	.loc 1 926 0
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 927 0
	mov	0, %g2
	mov	1, %g3
	std	%g2, [%fp-104]
	.loc 1 928 0
	st	%g0, [%fp-96]
	st	%g0, [%fp-92]
.L212:
	.loc 1 934 0
	ldub	[%fp-17], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L214
	 nop
	.loc 1 934 0 is_stmt 0 discriminator 1
	mov	0, %g1
	b	.L215
	 nop
.L214:
	.loc 1 934 0 discriminator 2
	ld	[%fp-4], %g1
	cmp	%g1, -99
	bl	.L216
	 nop
	.loc 1 934 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 99
	bg	.L216
	 nop
	mov	4, %g1
	b	.L217
	 nop
.L216:
	.loc 1 934 0 discriminator 2
	mov	5, %g1
.L217:
.L215:
	.loc 1 934 0 discriminator 3
	st	%g1, [%fp-56]
	.loc 1 937 0 is_stmt 1 discriminator 3
	ld	[%fp+88], %g1
	and	%g1, 2, %g1
	.loc 1 940 0 discriminator 3
	cmp	%g1, 0
	be	.L218
	 nop
	.loc 1 937 0
	ld	[%fp-56], %g1
	cmp	%g1, 0
	bne	.L219
	 nop
.L218:
	.loc 1 946 0
	ld	[%fp+84], %g2
	ld	[%fp-56], %g1
	cmp	%g2, %g1
	bleu	.L220
	 nop
	.loc 1 946 0 is_stmt 0 discriminator 1
	ld	[%fp+84], %g2
	ld	[%fp-56], %g1
	sub	%g2, %g1, %g1
	b	.L221
	 nop
.L220:
	.loc 1 946 0 discriminator 2
	mov	0, %g1
.L221:
	.loc 1 940 0 is_stmt 1
	b	.L222
	 nop
.L219:
	mov	0, %g1
.L222:
	.loc 1 936 0
	st	%g1, [%fp-60]
	.loc 1 951 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	st	%g1, [%fp-64]
	.loc 1 952 0
	ldd	[%fp-104], %g2
	std	%g2, [%fp-152]
	ldd	[%fp-96], %g2
	std	%g2, [%fp-144]
	ldd	[%fp-88], %g2
	std	%g2, [%fp-136]
	add	%fp, -152, %g1
	ld	[%fp+96], %g2
	st	%g2, [%sp+92]
	mov	%g1, %o0
	ld	[%fp+68], %o1
	ld	[%fp+80], %o2
	ld	[%fp-60], %o3
	ld	[%fp+88], %o4
	ld	[%fp+92], %o5
	call	print_broken_up_decimal, 0
	 nop
	.loc 1 954 0
	ldub	[%fp-17], %g1
	xor	%g1, 1, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L183
	 nop
	.loc 1 955 0
	ld	[%fp+88], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	be	.L224
	 nop
	.loc 1 955 0 is_stmt 0 discriminator 1
	mov	69, %g1
	b	.L225
	 nop
.L224:
	.loc 1 955 0 discriminator 2
	mov	101, %g1
.L225:
	.loc 1 955 0 discriminator 3
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 956 0 is_stmt 1 discriminator 3
	ld	[%fp-4], %g1
	cmp	%g1, 0
	ble	.L226
	 nop
	.loc 1 956 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %l1
	ld	[%fp-4], %g1
	sra	%g1, 31, %g1
	mov	%g1, %l0
	b	.L227
	 nop
.L226:
	.loc 1 957 0 is_stmt 1 discriminator 2
	ld	[%fp-4], %l3
	ld	[%fp-4], %g1
	sra	%g1, 31, %g1
	mov	%g1, %l2
	subcc	%g0, %l3, %g3
	subx	%g0, %l2, %g2
	.loc 1 956 0 discriminator 2
	mov	%g2, %l0
	mov	%g3, %l1
.L227:
	.loc 1 956 0 is_stmt 0 discriminator 3
	ld	[%fp-4], %g1
	srl	%g1, 31, %g1
	ld	[%fp-56], %g2
	add	%g2, -1, %g2
	and	%g1, 0xff, %g1
	st	%g2, [%sp+92]
	mov	5, %g2
	st	%g2, [%sp+96]
	ld	[%fp+68], %o0
	mov	%l0, %o1
	mov	%l1, %o2
	mov	%g1, %o3
	mov	10, %o4
	mov	0, %o5
	call	print_integer, 0
	 nop
	.loc 1 960 0 is_stmt 1 discriminator 3
	ld	[%fp+88], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	be	.L183
	 nop
	.loc 1 962 0
	b	.L228
	 nop
.L229:
	.loc 1 963 0
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
.L228:
	.loc 1 962 0 discriminator 1
	ld	[%fp+68], %g1
	ld	[%g1+12], %g2
	ld	[%fp-64], %g1
	sub	%g2, %g1, %g2
	ld	[%fp+84], %g1
	cmp	%g2, %g1
	blu	.L229
	 nop
.L183:
	.loc 1 967 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE27:
	.size	print_exponential_number, .-print_exponential_number
	.section	".rodata"
	.align 8
.LC21:
	.asciz	"nan"
	.align 8
.LC23:
	.asciz	"fni-"
	.align 8
.LC25:
	.asciz	"fni+"
	.align 8
.LC26:
	.asciz	"fni"
	.align 8
.LC22:
	.long	-1048577
	.long	4294967295
	.align 8
.LC24:
	.long	2146435071
	.long	4294967295
	.align 8
.LC27:
	.long	1104006501
	.long	0
	.align 8
.LC28:
	.long	-1043477147
	.long	0
	.section	".text"
	.align 4
	.type	print_floating_point, #function
	.proc	020
print_floating_point:
.LFB28:
	.loc 1 971 0
	.cfi_startproc
	save	%sp, -152, %sp
.LCFI28:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp-48]
	st	%i2, [%fp-44]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 973 0
	st	%g0, [%fp-4]
	.loc 1 976 0
	ldd	[%fp-48], %f10
	ldd	[%fp-48], %f8
	fcmpd	%f10, %f8
	nop
	fbe	.L233
	 nop
	.loc 1 977 0
	ld	[%fp+68], %o0
	sethi	%hi(.LC21), %g1
	or	%g1, %lo(.LC21), %o1
	mov	3, %o2
	ld	[%fp+84], %o3
	ld	[%fp+88], %o4
	call	out_rev_, 0
	 nop
	b	.L232
	 nop
.L233:
	.loc 1 980 0
	ldd	[%fp-48], %f10
	sethi	%hi(.LC22), %g1
	or	%g1, %lo(.LC22), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbuge	.L255
	 nop
.L253:
	.loc 1 981 0
	ld	[%fp+68], %o0
	sethi	%hi(.LC23), %g1
	or	%g1, %lo(.LC23), %o1
	mov	4, %o2
	ld	[%fp+84], %o3
	ld	[%fp+88], %o4
	call	out_rev_, 0
	 nop
	b	.L232
	 nop
.L255:
	.loc 1 984 0
	ldd	[%fp-48], %f10
	sethi	%hi(.LC24), %g1
	or	%g1, %lo(.LC24), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbule	.L256
	 nop
.L254:
	.loc 1 985 0
	ld	[%fp+88], %g1
	and	%g1, 4, %g1
	cmp	%g1, 0
	be	.L239
	 nop
	.loc 1 985 0 is_stmt 0 discriminator 1
	sethi	%hi(.LC25), %g1
	or	%g1, %lo(.LC25), %g2
	b	.L240
	 nop
.L239:
	.loc 1 985 0 discriminator 2
	sethi	%hi(.LC26), %g1
	or	%g1, %lo(.LC26), %g2
.L240:
	.loc 1 985 0 discriminator 3
	ld	[%fp+88], %g1
	and	%g1, 4, %g1
	cmp	%g1, 0
	be	.L241
	 nop
	.loc 1 985 0 discriminator 4
	mov	4, %g1
	b	.L242
	 nop
.L241:
	.loc 1 985 0 discriminator 5
	mov	3, %g1
.L242:
	.loc 1 985 0 discriminator 6
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g1, %o2
	ld	[%fp+84], %o3
	ld	[%fp+88], %o4
	call	out_rev_, 0
	 nop
	b	.L232
	 nop
.L256:
	.loc 1 989 0 is_stmt 1
	ldub	[%fp+95], %g1
	xor	%g1, 1, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L243
	 nop
	.loc 1 989 0 is_stmt 0 discriminator 1
	ldd	[%fp-48], %f10
	sethi	%hi(.LC27), %g1
	or	%g1, %lo(.LC27), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbg	.L244
	 nop
	.loc 1 990 0 is_stmt 1
	ldd	[%fp-48], %f10
	sethi	%hi(.LC28), %g1
	or	%g1, %lo(.LC28), %g1
	ldd	[%g1], %f8
	fcmped	%f10, %f8
	nop
	fbuge	.L243
	 nop
.L244:
	.loc 1 995 0
	add	%fp, -40, %g1
	st	%g1, [%sp+92]
	ld	[%fp-4], %g1
	st	%g1, [%sp+96]
	ld	[%fp+68], %o0
	ld	[%fp-48], %o1
	ld	[%fp-44], %o2
	ld	[%fp+80], %o3
	ld	[%fp+84], %o4
	ld	[%fp+88], %o5
	call	print_exponential_number, 0
	 nop
	b	.L232
	 nop
.L243:
	.loc 1 1001 0
	ld	[%fp+88], %g1
	and	%g1, 2048, %g1
	cmp	%g1, 0
	bne	.L247
	 nop
	.loc 1 1002 0
	mov	6, %g1
	st	%g1, [%fp+80]
	.loc 1 1006 0
	b	.L247
	 nop
.L249:
	.loc 1 1007 0
	ld	[%fp-4], %g1
	add	%fp, %g1, %g1
	mov	48, %g2
	stb	%g2, [%g1-40]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
	.loc 1 1008 0
	ld	[%fp+80], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp+80]
.L247:
	.loc 1 1006 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 31
	bgu	.L248
	 nop
	.loc 1 1006 0 is_stmt 0 discriminator 2
	ld	[%fp+80], %g1
	cmp	%g1, 17
	bgu	.L249
	 nop
.L248:
	.loc 1 1012 0 is_stmt 1
	ldub	[%fp+95], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L250
	 nop
	.loc 1 1013 0
	add	%fp, -40, %g1
	st	%g1, [%sp+92]
	ld	[%fp-4], %g1
	st	%g1, [%sp+96]
	ld	[%fp+68], %o0
	ld	[%fp-48], %o1
	ld	[%fp-44], %o2
	ld	[%fp+80], %o3
	ld	[%fp+84], %o4
	ld	[%fp+88], %o5
	call	print_exponential_number, 0
	 nop
	b	.L232
	 nop
.L250:
	.loc 1 1016 0
	add	%fp, -40, %g1
	st	%g1, [%sp+92]
	ld	[%fp-4], %g1
	st	%g1, [%sp+96]
	ld	[%fp+68], %o0
	ld	[%fp-48], %o1
	ld	[%fp-44], %o2
	ld	[%fp+80], %o3
	ld	[%fp+84], %o4
	ld	[%fp+88], %o5
	call	print_decimal_number, 0
	 nop
.L232:
	.loc 1 1017 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE28:
	.size	print_floating_point, .-print_floating_point
	.align 4
	.type	parse_flags, #function
	.proc	016
parse_flags:
.LFB29:
	.loc 1 1024 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI29:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 1025 0
	st	%g0, [%fp-4]
.L267:
	.loc 1 1027 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%g1, -32, %g1
	cmp	%g1, 16
	bgu	.L258
	 nop
	sll	%g1, 2, %g2
	sethi	%hi(.L264), %g1
	or	%g1, %lo(.L264), %g1
	ld	[%g2+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L263:
	.loc 1 1028 0
	ld	[%fp-4], %g1
	or	%g1, 1, %g1
	st	%g1, [%fp-4]
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
	b	.L265
	 nop
.L262:
	.loc 1 1029 0
	ld	[%fp-4], %g1
	or	%g1, 2, %g1
	st	%g1, [%fp-4]
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
	b	.L265
	 nop
.L261:
	.loc 1 1030 0
	ld	[%fp-4], %g1
	or	%g1, 4, %g1
	st	%g1, [%fp-4]
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
	b	.L265
	 nop
.L259:
	.loc 1 1031 0
	ld	[%fp-4], %g1
	or	%g1, 8, %g1
	st	%g1, [%fp-4]
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
	b	.L265
	 nop
.L260:
	.loc 1 1032 0
	ld	[%fp-4], %g1
	or	%g1, 16, %g1
	st	%g1, [%fp-4]
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1]
	b	.L265
	 nop
.L258:
	.loc 1 1033 0
	ld	[%fp-4], %g1
	b	.L268
	 nop
.L265:
	.loc 1 1035 0
	b	.L267
	 nop
.L268:
	.loc 1 1036 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.align 4
	.subsection	-1
	.align 4
.L264:
	.word	.L259
	.word	.L258
	.word	.L258
	.word	.L260
	.word	.L258
	.word	.L258
	.word	.L258
	.word	.L258
	.word	.L258
	.word	.L258
	.word	.L258
	.word	.L261
	.word	.L258
	.word	.L262
	.word	.L258
	.word	.L258
	.word	.L263
	.previous
	.cfi_endproc
.LFE29:
	.size	parse_flags, .-parse_flags
	.section	".rodata"
	.align 8
.LC29:
	.asciz	")llun("
	.align 8
.LC30:
	.asciz	")lin("
	.section	".text"
	.align 4
	.type	_vsnprintf, #function
	.proc	04
_vsnprintf:
.LFB30:
	.loc 1 1042 0
	.cfi_startproc
	save	%sp, -208, %sp
.LCFI30:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 1046 0
	b	.L270
	 nop
.L358:
.LBB11:
	.loc 1 1049 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 37
	be	.L271
	 nop
	.loc 1 1051 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 1052 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1053 0
	b	.L270
	 nop
.L271:
	.loc 1 1057 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1060 0
	add	%fp, 72, %g1
	mov	%g1, %o0
	call	parse_flags, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 1063 0
	st	%g0, [%fp-8]
	.loc 1 1064 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	is_digit_, 0
	 nop
	mov	%o0, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L272
	 nop
	.loc 1 1065 0
	add	%fp, 72, %g1
	mov	%g1, %o0
	call	atou_, 0
	 nop
	st	%o0, [%fp-8]
	b	.L273
	 nop
.L272:
	.loc 1 1067 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 42
	bne	.L273
	 nop
.LBB12:
	.loc 1 1068 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-32]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 1069 0
	ld	[%fp-32], %g1
	cmp	%g1, 0
	bge	.L274
	 nop
	.loc 1 1070 0
	ld	[%fp-4], %g1
	or	%g1, 2, %g1
	st	%g1, [%fp-4]
	.loc 1 1071 0
	ld	[%fp-32], %g1
	sub	%g0, %g1, %g1
	st	%g1, [%fp-8]
	b	.L275
	 nop
.L274:
	.loc 1 1074 0
	ld	[%fp-32], %g1
	st	%g1, [%fp-8]
.L275:
	.loc 1 1076 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
.L273:
.LBE12:
	.loc 1 1080 0
	st	%g0, [%fp-12]
	.loc 1 1081 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 46
	bne	.L276
	 nop
	.loc 1 1082 0
	ld	[%fp-4], %g1
	or	%g1, 2048, %g1
	st	%g1, [%fp-4]
	.loc 1 1083 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1084 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	is_digit_, 0
	 nop
	mov	%o0, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L277
	 nop
	.loc 1 1085 0
	add	%fp, 72, %g1
	mov	%g1, %o0
	call	atou_, 0
	 nop
	st	%o0, [%fp-12]
	b	.L276
	 nop
.L277:
	.loc 1 1087 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 42
	bne	.L276
	 nop
.LBB13:
	.loc 1 1088 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-36]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 1089 0
	ld	[%fp-36], %g1
	cmp	%g1, 0
	bge	.L278
	 nop
	mov	0, %g1
.L278:
	st	%g1, [%fp-12]
	.loc 1 1090 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
.L276:
.LBE13:
	.loc 1 1095 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%g1, -104, %g1
	cmp	%g1, 18
	bgu	.L360
	 nop
	sll	%g1, 2, %g2
	sethi	%hi(.L285), %g1
	or	%g1, %lo(.L285), %g1
	ld	[%g2+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L282:
	.loc 1 1122 0
	ld	[%fp-4], %g1
	or	%g1, 512, %g1
	st	%g1, [%fp-4]
	.loc 1 1123 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1124 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 108
	bne	.L361
	 nop
	.loc 1 1125 0
	ld	[%fp-4], %g1
	or	%g1, 1024, %g1
	st	%g1, [%fp-4]
	.loc 1 1126 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1128 0
	b	.L361
	 nop
.L280:
	.loc 1 1130 0
	ld	[%fp-4], %g1
	or	%g1, 128, %g1
	st	%g1, [%fp-4]
	.loc 1 1131 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1132 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 104
	bne	.L362
	 nop
	.loc 1 1133 0
	ld	[%fp-4], %g1
	or	%g1, 64, %g1
	st	%g1, [%fp-4]
	.loc 1 1134 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1136 0
	b	.L362
	 nop
.L283:
	.loc 1 1138 0
	ld	[%fp-4], %g1
	or	%g1, 512, %g1
	st	%g1, [%fp-4]
	.loc 1 1139 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1140 0
	b	.L287
	 nop
.L281:
	.loc 1 1142 0
	ld	[%fp-4], %g1
	or	%g1, 1024, %g1
	st	%g1, [%fp-4]
	.loc 1 1143 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1144 0
	b	.L287
	 nop
.L284:
	.loc 1 1146 0
	ld	[%fp-4], %g1
	or	%g1, 512, %g1
	st	%g1, [%fp-4]
	.loc 1 1147 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1148 0
	b	.L287
	 nop
.L360:
	.loc 1 1150 0
	nop
	b	.L287
	 nop
.L361:
	.loc 1 1128 0
	nop
	b	.L287
	 nop
.L362:
	.loc 1 1136 0
	nop
.L287:
	.loc 1 1154 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%g1, -37, %g1
	cmp	%g1, 83
	bgu	.L289
	 nop
	sll	%g1, 2, %g2
	sethi	%hi(.L298), %g1
	or	%g1, %lo(.L298), %g1
	ld	[%g2+%g1], %g1
	jmp	%g1
	 nop
	.section	".rodata"
	.section	".text"
.L293:
.LBB14:
	.loc 1 1163 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 100
	be	.L299
	 nop
	.loc 1 1163 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 105
	bne	.L300
	 nop
.L299:
	.loc 1 1164 0 is_stmt 1
	ld	[%fp-4], %g2
	sethi	%hi(16384), %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
.L300:
	.loc 1 1168 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 120
	be	.L301
	 nop
	.loc 1 1168 0 is_stmt 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 88
	bne	.L302
	 nop
.L301:
	.loc 1 1169 0 is_stmt 1
	mov	16, %g1
	stb	%g1, [%fp-13]
	b	.L303
	 nop
.L302:
	.loc 1 1171 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 111
	bne	.L304
	 nop
	.loc 1 1172 0
	mov	8, %g1
	stb	%g1, [%fp-13]
	b	.L303
	 nop
.L304:
	.loc 1 1174 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 98
	bne	.L305
	 nop
	.loc 1 1175 0
	mov	2, %g1
	stb	%g1, [%fp-13]
	b	.L303
	 nop
.L305:
	.loc 1 1178 0
	mov	10, %g1
	stb	%g1, [%fp-13]
	.loc 1 1179 0
	ld	[%fp-4], %g1
	and	%g1, -17, %g1
	st	%g1, [%fp-4]
.L303:
	.loc 1 1182 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 88
	bne	.L306
	 nop
	.loc 1 1183 0
	ld	[%fp-4], %g1
	or	%g1, 32, %g1
	st	%g1, [%fp-4]
.L306:
	.loc 1 1186 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1188 0
	ld	[%fp-4], %g1
	and	%g1, 2048, %g1
	cmp	%g1, 0
	be	.L307
	 nop
	.loc 1 1189 0
	ld	[%fp-4], %g1
	and	%g1, -2, %g1
	st	%g1, [%fp-4]
.L307:
	.loc 1 1192 0
	ld	[%fp-4], %g2
	sethi	%hi(16384), %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L308
	 nop
	.loc 1 1195 0
	ld	[%fp-4], %g1
	and	%g1, 1024, %g1
	cmp	%g1, 0
	be	.L309
	 nop
.LBB15:
	.loc 1 1197 0
	add	%fp, -96, %g2
	ld	[%fp+76], %g1
	mov	%g2, %g3
	mov	%g1, %g2
	mov	8, %g1
	mov	%g3, %o0
	mov	%g2, %o1
	mov	%g1, %o2
	call	memcpy, 0
	 nop
	ldd	[%fp-96], %g2
	std	%g2, [%fp-48]
	ld	[%fp+76], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp+76]
	.loc 1 1198 0
	ld	[%fp-48], %g1
	sra	%g1, 31, %l3
	ld	[%fp-48], %g1
	sra	%g1, 31, %l2
	ldd	[%fp-48], %g2
	xor	%l2, %g2, %g2
	xor	%l3, %g3, %g3
	subcc	%g3, %l3, %g3
	subx	%g2, %l2, %g2
	ld	[%fp-48], %g1
	srl	%g1, 31, %g1
	and	%g1, 0xff, %g4
	ldub	[%fp-13], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-8], %i3
	st	%i3, [%sp+92]
	ld	[%fp-4], %i3
	st	%i3, [%sp+96]
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	%g4, %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
.LBE15:
	.loc 1 1238 0
	b	.L270
	 nop
.L309:
	.loc 1 1201 0
	ld	[%fp-4], %g1
	and	%g1, 512, %g1
	cmp	%g1, 0
	be	.L311
	 nop
.LBB16:
	.loc 1 1202 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-52]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 1203 0
	ld	[%fp-52], %g1
	cmp	%g1, 0
	ble	.L312
	 nop
	.loc 1 1203 0 is_stmt 0 discriminator 1
	ld	[%fp-52], %i5
	ld	[%fp-52], %g1
	sra	%g1, 31, %g1
	mov	%g1, %i4
	b	.L313
	 nop
.L312:
	.loc 1 1203 0 discriminator 2
	ld	[%fp-52], %l5
	ld	[%fp-52], %g1
	sra	%g1, 31, %g1
	mov	%g1, %l4
	subcc	%g0, %l5, %g3
	subx	%g0, %l4, %g2
	mov	%g2, %i4
	mov	%g3, %i5
.L313:
	.loc 1 1203 0 discriminator 3
	ld	[%fp-52], %g1
	srl	%g1, 31, %g1
	and	%g1, 0xff, %g2
	ldub	[%fp-13], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-8], %g3
	st	%g3, [%sp+92]
	ld	[%fp-4], %g3
	st	%g3, [%sp+96]
	ld	[%fp+68], %o0
	mov	%i4, %o1
	mov	%i5, %o2
	mov	%g2, %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
.LBE16:
	.loc 1 1238 0 is_stmt 1 discriminator 3
	b	.L270
	 nop
.L311:
.LBB17:
	.loc 1 1211 0
	ld	[%fp-4], %g1
	and	%g1, 64, %g1
	cmp	%g1, 0
	be	.L314
	 nop
	.loc 1 1211 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	b	.L315
	 nop
.L314:
	.loc 1 1212 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 128, %g1
	cmp	%g1, 0
	be	.L316
	 nop
	.loc 1 1212 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	sll	%g1, 16, %g1
	sra	%g1, 16, %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	b	.L317
	 nop
.L316:
	.loc 1 1212 0 discriminator 2
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	.loc 1 1213 0 is_stmt 1 discriminator 2
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
.L317:
.L315:
	.loc 1 1210 0
	st	%g1, [%fp-56]
	.loc 1 1214 0
	ld	[%fp-56], %g1
	cmp	%g1, 0
	ble	.L318
	 nop
	.loc 1 1214 0 is_stmt 0 discriminator 1
	ld	[%fp-56], %l1
	ld	[%fp-56], %g1
	sra	%g1, 31, %g1
	mov	%g1, %l0
	b	.L319
	 nop
.L318:
	.loc 1 1214 0 discriminator 2
	ld	[%fp-56], %l7
	ld	[%fp-56], %g1
	sra	%g1, 31, %g1
	mov	%g1, %l6
	subcc	%g0, %l7, %g3
	subx	%g0, %l6, %g2
	mov	%g2, %l0
	mov	%g3, %l1
.L319:
	.loc 1 1214 0 discriminator 3
	ld	[%fp-56], %g1
	srl	%g1, 31, %g1
	and	%g1, 0xff, %g2
	ldub	[%fp-13], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-8], %g3
	st	%g3, [%sp+92]
	ld	[%fp-4], %g3
	st	%g3, [%sp+96]
	ld	[%fp+68], %o0
	mov	%l0, %o1
	mov	%l1, %o2
	mov	%g2, %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
.LBE17:
	.loc 1 1238 0 is_stmt 1 discriminator 3
	b	.L270
	 nop
.L308:
	.loc 1 1220 0
	ld	[%fp-4], %g1
	and	%g1, -13, %g1
	st	%g1, [%fp-4]
	.loc 1 1222 0
	ld	[%fp-4], %g1
	and	%g1, 1024, %g1
	cmp	%g1, 0
	be	.L320
	 nop
	.loc 1 1224 0
	add	%fp, -88, %g2
	ld	[%fp+76], %g1
	mov	%g2, %g3
	mov	%g1, %g2
	mov	8, %g1
	mov	%g3, %o0
	mov	%g2, %o1
	mov	%g1, %o2
	call	memcpy, 0
	 nop
	ldd	[%fp-88], %g2
	ld	[%fp+76], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp+76]
	ldub	[%fp-13], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-8], %g4
	st	%g4, [%sp+92]
	ld	[%fp-4], %g4
	st	%g4, [%sp+96]
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	0, %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
	.loc 1 1238 0
	b	.L270
	 nop
.L320:
	.loc 1 1227 0
	ld	[%fp-4], %g1
	and	%g1, 512, %g1
	cmp	%g1, 0
	be	.L321
	 nop
	.loc 1 1228 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	mov	0, %g2
	mov	%g1, %g3
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	ldub	[%fp-13], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-8], %g4
	st	%g4, [%sp+92]
	ld	[%fp-4], %g4
	st	%g4, [%sp+96]
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	0, %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
	.loc 1 1238 0
	b	.L270
	 nop
.L321:
.LBB18:
	.loc 1 1232 0
	ld	[%fp-4], %g1
	and	%g1, 64, %g1
	cmp	%g1, 0
	be	.L322
	 nop
	.loc 1 1232 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	and	%g1, 0xff, %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	b	.L323
	 nop
.L322:
	.loc 1 1233 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 128, %g1
	cmp	%g1, 0
	be	.L324
	 nop
	.loc 1 1233 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	b	.L325
	 nop
.L324:
	.loc 1 1233 0 discriminator 2
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	.loc 1 1234 0 is_stmt 1 discriminator 2
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
.L325:
.L323:
	.loc 1 1231 0
	st	%g1, [%fp-60]
	.loc 1 1235 0
	ld	[%fp-60], %g1
	mov	0, %g2
	mov	%g1, %g3
	ldub	[%fp-13], %g1
	and	%g1, 0xff, %g1
	ld	[%fp-8], %g4
	st	%g4, [%sp+92]
	ld	[%fp-4], %g4
	st	%g4, [%sp+96]
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	0, %o3
	mov	%g1, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
.LBE18:
	.loc 1 1238 0
	b	.L270
	 nop
.L292:
.LBE14:
	.loc 1 1243 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 70
	bne	.L326
	 nop
	.loc 1 1243 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	or	%g1, 32, %g1
	st	%g1, [%fp-4]
.L326:
	.loc 1 1244 0 is_stmt 1
	add	%fp, -80, %g2
	ld	[%fp+76], %g1
	mov	%g2, %g3
	mov	%g1, %g2
	mov	8, %g1
	mov	%g3, %o0
	mov	%g2, %o1
	mov	%g1, %o2
	call	memcpy, 0
	 nop
	ldd	[%fp-80], %f8
	ld	[%fp+76], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp+76]
	st	%g0, [%sp+92]
	ld	[%fp+68], %o0
	std	%f8, [%fp-104]
	ldd	[%fp-104], %g2
	mov	%g2, %o1
	mov	%g3, %o2
	ld	[%fp-12], %o3
	ld	[%fp-8], %o4
	ld	[%fp-4], %o5
	call	print_floating_point, 0
	 nop
	.loc 1 1245 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1246 0
	b	.L270
	 nop
.L291:
	.loc 1 1253 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 103
	be	.L327
	 nop
	.loc 1 1253 0 is_stmt 0 discriminator 2
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 71
	bne	.L328
	 nop
.L327:
	.loc 1 1253 0 discriminator 1
	ld	[%fp-4], %g2
	sethi	%hi(4096), %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
.L328:
	.loc 1 1254 0 is_stmt 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
	be	.L329
	 nop
	.loc 1 1254 0 is_stmt 0 discriminator 2
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 71
	bne	.L330
	 nop
.L329:
	.loc 1 1254 0 discriminator 1
	ld	[%fp-4], %g1
	or	%g1, 32, %g1
	st	%g1, [%fp-4]
.L330:
	.loc 1 1255 0 is_stmt 1
	add	%fp, -72, %g2
	ld	[%fp+76], %g1
	mov	%g2, %g3
	mov	%g1, %g2
	mov	8, %g1
	mov	%g3, %o0
	mov	%g2, %o1
	mov	%g1, %o2
	call	memcpy, 0
	 nop
	ldd	[%fp-72], %f8
	ld	[%fp+76], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp+76]
	mov	1, %g1
	st	%g1, [%sp+92]
	ld	[%fp+68], %o0
	std	%f8, [%fp-104]
	ldd	[%fp-104], %g2
	mov	%g2, %o1
	mov	%g3, %o2
	ld	[%fp-12], %o3
	ld	[%fp-8], %o4
	ld	[%fp-4], %o5
	call	print_floating_point, 0
	 nop
	.loc 1 1256 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1257 0
	b	.L270
	 nop
.L294:
.LBB19:
	.loc 1 1260 0
	mov	1, %g1
	st	%g1, [%fp-20]
	.loc 1 1262 0
	ld	[%fp-4], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	bne	.L331
	 nop
	.loc 1 1263 0
	b	.L332
	 nop
.L333:
	.loc 1 1264 0
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
.L332:
	.loc 1 1263 0 discriminator 1
	ld	[%fp-20], %g2
	ld	[%fp-8], %g1
	cmp	%g2, %g1
	addx	%g0, 0, %g1
	ld	[%fp-20], %g2
	add	%g2, 1, %g2
	st	%g2, [%fp-20]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L333
	 nop
.L331:
	.loc 1 1268 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+76], %g2
	add	%g2, 4, %g2
	st	%g2, [%fp+76]
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 1270 0
	ld	[%fp-4], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	be	.L334
	 nop
	.loc 1 1271 0
	b	.L335
	 nop
.L336:
	.loc 1 1272 0
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
.L335:
	.loc 1 1271 0 discriminator 1
	ld	[%fp-20], %g2
	ld	[%fp-8], %g1
	cmp	%g2, %g1
	addx	%g0, 0, %g1
	ld	[%fp-20], %g2
	add	%g2, 1, %g2
	st	%g2, [%fp-20]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L336
	 nop
.L334:
	.loc 1 1275 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1276 0
	b	.L270
	 nop
.L297:
.LBE19:
.LBB20:
	.loc 1 1280 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-24]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 1281 0
	ld	[%fp-24], %g1
	cmp	%g1, 0
	bne	.L337
	 nop
	.loc 1 1282 0
	ld	[%fp+68], %o0
	sethi	%hi(.LC29), %g1
	or	%g1, %lo(.LC29), %o1
	mov	6, %o2
	ld	[%fp-8], %o3
	ld	[%fp-4], %o4
	call	out_rev_, 0
	 nop
	b	.L338
	 nop
.L337:
.LBB21:
	.loc 1 1285 0
	ld	[%fp-12], %g1
	cmp	%g1, 0
	be	.L339
	 nop
	.loc 1 1285 0 is_stmt 0 discriminator 1
	ld	[%fp-12], %g1
	b	.L340
	 nop
.L339:
	.loc 1 1285 0 discriminator 2
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
.L340:
	.loc 1 1285 0 discriminator 3
	ld	[%fp-24], %o0
	mov	%g1, %o1
	call	strnlen_s_, 0
	 nop
	st	%o0, [%fp-28]
	.loc 1 1287 0 is_stmt 1 discriminator 3
	ld	[%fp-4], %g1
	and	%g1, 2048, %g1
	cmp	%g1, 0
	be	.L341
	 nop
	.loc 1 1288 0
	ld	[%fp-28], %g2
	ld	[%fp-12], %g1
	cmp	%g1, %g2
	bleu	.L342
	 nop
	mov	%g2, %g1
.L342:
	st	%g1, [%fp-28]
.L341:
	.loc 1 1290 0
	ld	[%fp-4], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	bne	.L363
	 nop
	.loc 1 1291 0
	b	.L344
	 nop
.L345:
	.loc 1 1292 0
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
.L344:
	.loc 1 1291 0 discriminator 1
	ld	[%fp-28], %g2
	ld	[%fp-8], %g1
	cmp	%g2, %g1
	addx	%g0, 0, %g1
	ld	[%fp-28], %g2
	add	%g2, 1, %g2
	st	%g2, [%fp-28]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L345
	 nop
	.loc 1 1296 0
	b	.L363
	 nop
.L348:
	.loc 1 1297 0
	ld	[%fp-24], %g1
	ldub	[%g1], %g1
	ld	[%fp-24], %g2
	add	%g2, 1, %g2
	st	%g2, [%fp-24]
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 1298 0
	ld	[%fp-12], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-12]
	b	.L346
	 nop
.L363:
	.loc 1 1296 0
	nop
.L346:
	.loc 1 1296 0 is_stmt 0 discriminator 1
	ld	[%fp-24], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	be	.L347
	 nop
	.loc 1 1296 0 discriminator 2
	ld	[%fp-4], %g1
	and	%g1, 2048, %g1
	cmp	%g1, 0
	be	.L348
	 nop
	.loc 1 1296 0 discriminator 1
	ld	[%fp-12], %g1
	cmp	%g1, 0
	bne	.L348
	 nop
.L347:
	.loc 1 1301 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 2, %g1
	cmp	%g1, 0
	be	.L338
	 nop
	.loc 1 1302 0
	b	.L349
	 nop
.L350:
	.loc 1 1303 0
	ld	[%fp+68], %o0
	mov	32, %o1
	call	putchar_via_gadget, 0
	 nop
.L349:
	.loc 1 1302 0 discriminator 1
	ld	[%fp-28], %g2
	ld	[%fp-8], %g1
	cmp	%g2, %g1
	addx	%g0, 0, %g1
	ld	[%fp-28], %g2
	add	%g2, 1, %g2
	st	%g2, [%fp-28]
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	bne	.L350
	 nop
.L338:
.LBE21:
	.loc 1 1307 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1308 0
	b	.L270
	 nop
.L296:
.LBE20:
.LBB22:
	.loc 1 1312 0
	mov	10, %g1
	st	%g1, [%fp-8]
	.loc 1 1313 0
	ld	[%fp-4], %g2
	sethi	%hi(8192), %g1
	or	%g1, 1, %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 1314 0
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-64]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	.loc 1 1316 0
	ld	[%fp-64], %g1
	cmp	%g1, 0
	bne	.L351
	 nop
	.loc 1 1316 0 is_stmt 0 discriminator 1
	ld	[%fp+68], %o0
	sethi	%hi(.LC30), %g1
	or	%g1, %lo(.LC30), %o1
	mov	5, %o2
	ld	[%fp-8], %o3
	ld	[%fp-4], %o4
	call	out_rev_, 0
	 nop
	b	.L352
	 nop
.L351:
	.loc 1 1317 0 is_stmt 1
	ld	[%fp-64], %g1
	mov	0, %g2
	mov	%g1, %g3
	ld	[%fp-8], %g1
	st	%g1, [%sp+92]
	ld	[%fp-4], %g1
	st	%g1, [%sp+96]
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	0, %o3
	mov	16, %o4
	ld	[%fp-12], %o5
	call	print_integer, 0
	 nop
.L352:
	.loc 1 1318 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1319 0
	b	.L270
	 nop
.L290:
.LBE22:
	.loc 1 1323 0
	ld	[%fp+68], %o0
	mov	37, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 1324 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1325 0
	b	.L270
	 nop
.L295:
	.loc 1 1332 0
	ld	[%fp-4], %g1
	and	%g1, 64, %g1
	cmp	%g1, 0
	be	.L353
	 nop
	.loc 1 1332 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+12], %g2
	stb	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	b	.L354
	 nop
.L353:
	.loc 1 1333 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 128, %g1
	cmp	%g1, 0
	be	.L355
	 nop
	.loc 1 1333 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+12], %g2
	sth	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	b	.L354
	 nop
.L355:
	.loc 1 1334 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 512, %g1
	cmp	%g1, 0
	be	.L356
	 nop
	.loc 1 1334 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+12], %g2
	st	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	b	.L354
	 nop
.L356:
	.loc 1 1336 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 1024, %g1
	cmp	%g1, 0
	be	.L357
	 nop
	.loc 1 1336 0 is_stmt 0 discriminator 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+12], %g2
	mov	%g2, %g3
	mov	0, %g2
	std	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
	b	.L354
	 nop
.L357:
	.loc 1 1338 0 is_stmt 1
	ld	[%fp+76], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+12], %g2
	st	%g2, [%g1]
	ld	[%fp+76], %g1
	add	%g1, 4, %g1
	st	%g1, [%fp+76]
.L354:
	.loc 1 1339 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1340 0
	b	.L270
	 nop
.L289:
	.loc 1 1345 0
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	putchar_via_gadget, 0
	 nop
	.loc 1 1346 0
	ld	[%fp+72], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp+72]
	.loc 1 1347 0
	nop
.L270:
.LBE11:
	.loc 1 1046 0 discriminator 1
	ld	[%fp+72], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	bne	.L358
	 nop
	.loc 1 1352 0
	ld	[%fp+68], %o0
	call	append_termination_with_gadget, 0
	 nop
	.loc 1 1355 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	.loc 1 1356 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.align 4
	.subsection	-1
	.align 4
.L298:
	.word	.L290
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L291
	.word	.L292
	.word	.L291
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L293
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L293
	.word	.L294
	.word	.L293
	.word	.L291
	.word	.L292
	.word	.L291
	.word	.L289
	.word	.L293
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L289
	.word	.L295
	.word	.L293
	.word	.L296
	.word	.L289
	.word	.L289
	.word	.L297
	.word	.L289
	.word	.L293
	.word	.L289
	.word	.L289
	.word	.L293
	.previous
	.subsection	-1
	.align 4
.L285:
	.word	.L280
	.word	.L360
	.word	.L281
	.word	.L360
	.word	.L282
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L283
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L360
	.word	.L284
	.previous
	.cfi_endproc
.LFE30:
	.size	_vsnprintf, .-_vsnprintf
	.align 4
	.global vprintf_
	.type	vprintf_, #function
	.proc	04
vprintf_:
.LFB31:
	.loc 1 1362 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI31:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 1363 0
	add	%fp, -20, %g1
	st	%g1, [%sp+64]
	call	extern_putchar_gadget, 0
	 nop
	unimp	20
	.loc 1 1364 0
	add	%fp, -20, %g1
	mov	%g1, %o0
	ld	[%fp+68], %o1
	ld	[%fp+72], %o2
	call	_vsnprintf, 0
	 nop
	mov	%o0, %g1
	.loc 1 1365 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE31:
	.size	vprintf_, .-vprintf_
	.align 4
	.global vsnprintf_
	.type	vsnprintf_, #function
	.proc	04
vsnprintf_:
.LFB32:
	.loc 1 1368 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI32:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	.loc 1 1369 0
	add	%fp, -20, %g1
	st	%g1, [%sp+64]
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	buffer_gadget, 0
	 nop
	unimp	20
	.loc 1 1370 0
	add	%fp, -20, %g1
	mov	%g1, %o0
	ld	[%fp+76], %o1
	ld	[%fp+80], %o2
	call	_vsnprintf, 0
	 nop
	mov	%o0, %g1
	.loc 1 1371 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE32:
	.size	vsnprintf_, .-vsnprintf_
	.align 4
	.global vsprintf_
	.type	vsprintf_, #function
	.proc	04
vsprintf_:
.LFB33:
	.loc 1 1374 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI33:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 1375 0
	ld	[%fp+68], %o0
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %o1
	ld	[%fp+72], %o2
	ld	[%fp+76], %o3
	call	vsnprintf_, 0
	 nop
	mov	%o0, %g1
	.loc 1 1376 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE33:
	.size	vsprintf_, .-vsprintf_
	.align 4
	.global vfctprintf
	.type	vfctprintf, #function
	.proc	04
vfctprintf:
.LFB34:
	.loc 1 1379 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI34:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	.loc 1 1380 0
	add	%fp, -20, %g1
	st	%g1, [%sp+64]
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	call	function_gadget, 0
	 nop
	unimp	20
	.loc 1 1381 0
	add	%fp, -20, %g1
	mov	%g1, %o0
	ld	[%fp+76], %o1
	ld	[%fp+80], %o2
	call	_vsnprintf, 0
	 nop
	mov	%o0, %g1
	.loc 1 1382 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE34:
	.size	vfctprintf, .-vfctprintf
	.align 4
	.global printf_
	.type	printf_, #function
	.proc	04
printf_:
.LFB35:
	.loc 1 1385 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI35:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 1387 0
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 1385 0
	st	%i0, [%fp+68]
	.loc 1 1387 0
	add	%fp, 72, %g1
	st	%g1, [%fp-8]
	.loc 1 1388 0
	ld	[%fp-8], %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	vprintf_, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 1390 0
	ld	[%fp-4], %g1
	.loc 1 1391 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE35:
	.size	printf_, .-printf_
	.align 4
	.global sprintf_
	.type	sprintf_, #function
	.proc	04
sprintf_:
.LFB36:
	.loc 1 1394 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI36:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 1396 0
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 1394 0
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 1396 0
	add	%fp, 76, %g1
	st	%g1, [%fp-8]
	.loc 1 1397 0
	ld	[%fp-8], %g1
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	mov	%g1, %o2
	call	vsprintf_, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 1399 0
	ld	[%fp-4], %g1
	.loc 1 1400 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE36:
	.size	sprintf_, .-sprintf_
	.align 4
	.global snprintf_
	.type	snprintf_, #function
	.proc	04
snprintf_:
.LFB37:
	.loc 1 1403 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI37:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 1405 0
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 1403 0
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 1405 0
	add	%fp, 80, %g1
	st	%g1, [%fp-8]
	.loc 1 1406 0
	ld	[%fp-8], %g1
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp+76], %o2
	mov	%g1, %o3
	call	vsnprintf_, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 1408 0
	ld	[%fp-4], %g1
	.loc 1 1409 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE37:
	.size	snprintf_, .-snprintf_
	.align 4
	.global fctprintf
	.type	fctprintf, #function
	.proc	04
fctprintf:
.LFB38:
	.loc 1 1412 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI38:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 1414 0
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 1412 0
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 1414 0
	add	%fp, 80, %g1
	st	%g1, [%fp-8]
	.loc 1 1415 0
	ld	[%fp-8], %g1
	ld	[%fp+68], %o0
	ld	[%fp+72], %o1
	ld	[%fp+76], %o2
	mov	%g1, %o3
	call	vfctprintf, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 1417 0
	ld	[%fp-4], %g1
	.loc 1 1418 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE38:
	.size	fctprintf, .-fctprintf
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 3 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdarg.h"
	.file 4 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stddef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x1385
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF134
	.byte	0x1
	.uaword	.LASF135
	.uaword	.LASF136
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF2
	.uleb128 0x4
	.uaword	.LASF5
	.byte	0x2
	.byte	0x2e
	.uaword	0x4c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x4
	.uaword	.LASF6
	.byte	0x2
	.byte	0x34
	.uaword	0x65
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x4
	.uaword	.LASF8
	.byte	0x2
	.byte	0x37
	.uaword	0x77
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x4
	.uaword	.LASF10
	.byte	0x2
	.byte	0x4a
	.uaword	0x3a
	.uleb128 0x4
	.uaword	.LASF11
	.byte	0x2
	.byte	0x56
	.uaword	0x65
	.uleb128 0x4
	.uaword	.LASF12
	.byte	0x3
	.byte	0x28
	.uaword	0x9f
	.uleb128 0x5
	.byte	0x4
	.uaword	.LASF137
	.uleb128 0x4
	.uaword	.LASF13
	.byte	0x3
	.byte	0x66
	.uaword	0x94
	.uleb128 0x4
	.uaword	.LASF14
	.byte	0x4
	.byte	0xd7
	.uaword	0x65
	.uleb128 0x4
	.uaword	.LASF15
	.byte	0x1
	.byte	0xbd
	.uaword	0x65
	.uleb128 0x4
	.uaword	.LASF16
	.byte	0x1
	.byte	0xc4
	.uaword	0x41
	.uleb128 0x4
	.uaword	.LASF17
	.byte	0x1
	.byte	0xc7
	.uaword	0x77
	.uleb128 0x4
	.uaword	.LASF18
	.byte	0x1
	.byte	0xc8
	.uaword	0x3a
	.uleb128 0x4
	.uaword	.LASF19
	.byte	0x1
	.byte	0xd3
	.uaword	0x65
	.uleb128 0x4
	.uaword	.LASF20
	.byte	0x1
	.byte	0xeb
	.uaword	0x6c
	.uleb128 0x6
	.byte	0x8
	.byte	0x1
	.byte	0xf6
	.uaword	0x118
	.uleb128 0x7
	.asciz	"U"
	.byte	0x1
	.byte	0xf7
	.uaword	0xf2
	.uleb128 0x7
	.asciz	"F"
	.byte	0x1
	.byte	0xf8
	.uaword	0x118
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.uaword	.LASF21
	.uleb128 0x4
	.uaword	.LASF22
	.byte	0x1
	.byte	0xf9
	.uaword	0xfd
	.uleb128 0x8
	.byte	0x14
	.byte	0x1
	.uahalf	0x126
	.uaword	0x17f
	.uleb128 0x9
	.uaword	.LASF23
	.byte	0x1
	.uahalf	0x127
	.uaword	0x199
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.uaword	.LASF24
	.byte	0x1
	.uahalf	0x128
	.uaword	0x197
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.uaword	.LASF25
	.byte	0x1
	.uahalf	0x129
	.uaword	0x19f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.asciz	"pos"
	.byte	0x1
	.uahalf	0x12a
	.uaword	0xe7
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.uaword	.LASF26
	.byte	0x1
	.uahalf	0x12b
	.uaword	0xe7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.uaword	0x190
	.uleb128 0xc
	.uaword	0x190
	.uleb128 0xc
	.uaword	0x197
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF27
	.uleb128 0xd
	.byte	0x4
	.uleb128 0xe
	.byte	0x4
	.uaword	0x17f
	.uleb128 0xe
	.byte	0x4
	.uaword	0x190
	.uleb128 0xf
	.uaword	.LASF28
	.byte	0x1
	.uahalf	0x12c
	.uaword	0x12a
	.uleb128 0x10
	.uaword	.LASF33
	.byte	0x18
	.byte	0x1
	.uahalf	0x236
	.uaword	0x1ec
	.uleb128 0x9
	.uaword	.LASF29
	.byte	0x1
	.uahalf	0x237
	.uaword	0x7e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.uaword	.LASF30
	.byte	0x1
	.uahalf	0x238
	.uaword	0x7e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.uaword	.LASF31
	.byte	0x1
	.uahalf	0x23b
	.uaword	0x1ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.uaword	.LASF32
	.uleb128 0x10
	.uaword	.LASF34
	.byte	0x10
	.byte	0x1
	.uahalf	0x26f
	.uaword	0x21f
	.uleb128 0x9
	.uaword	.LASF35
	.byte	0x1
	.uahalf	0x270
	.uaword	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.uaword	.LASF36
	.byte	0x1
	.uahalf	0x271
	.uaword	0x1ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x11
	.uaword	.LASF37
	.byte	0x1
	.uahalf	0x100
	.byte	0x1
	.uaword	0x11f
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x25a
	.uleb128 0x12
	.asciz	"x"
	.byte	0x1
	.uahalf	0x100
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.uaword	.LASF41
	.byte	0x1
	.uahalf	0x102
	.uaword	0x11f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x14
	.uaword	.LASF38
	.byte	0x1
	.uahalf	0x107
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x286
	.uleb128 0x12
	.asciz	"x"
	.byte	0x1
	.uahalf	0x107
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.uaword	.LASF39
	.byte	0x1
	.uahalf	0x10d
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x2b2
	.uleb128 0x12
	.asciz	"x"
	.byte	0x1
	.uahalf	0x10d
	.uaword	0x11f
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.uaword	.LASF43
	.byte	0x1
	.uahalf	0x132
	.byte	0x1
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x2fa
	.uleb128 0x16
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x132
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x12
	.asciz	"c"
	.byte	0x1
	.uahalf	0x132
	.uaword	0x190
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x13
	.uaword	.LASF42
	.byte	0x1
	.uahalf	0x134
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.uaword	0x1a5
	.uleb128 0x17
	.uaword	.LASF44
	.byte	0x1
	.uahalf	0x146
	.byte	0x1
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x33a
	.uleb128 0x16
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x146
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x13
	.uaword	.LASF45
	.byte	0x1
	.uahalf	0x14e
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x15
	.uaword	.LASF46
	.byte	0x1
	.uahalf	0x154
	.byte	0x1
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x3a9
	.uleb128 0x12
	.asciz	"c"
	.byte	0x1
	.uahalf	0x154
	.uaword	0x190
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF47
	.byte	0x1
	.uahalf	0x154
	.uaword	0x197
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x18
	.uaword	.LBB2
	.uaword	.LBE2
	.uaword	0x38f
	.uleb128 0x13
	.uaword	.LASF48
	.byte	0x1
	.uahalf	0x159
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x19
	.uaword	.LBB3
	.uaword	.LBE3
	.uleb128 0x13
	.uaword	.LASF49
	.byte	0x1
	.uahalf	0x163
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.uaword	.LASF138
	.byte	0x1
	.uahalf	0x16a
	.byte	0x1
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x3d3
	.uleb128 0x12
	.asciz	"c"
	.byte	0x1
	.uahalf	0x16a
	.uaword	0x190
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0x1b
	.uaword	.LASF50
	.byte	0x1
	.uahalf	0x170
	.uaword	0x1a5
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST7
	.byte	0x1
	.uaword	0x400
	.uleb128 0x13
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x172
	.uaword	0x1a5
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.uaword	.LASF51
	.byte	0x1
	.uahalf	0x17b
	.byte	0x1
	.uaword	0x1a5
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST8
	.byte	0x1
	.uaword	0x45d
	.uleb128 0x16
	.uaword	.LASF25
	.byte	0x1
	.uahalf	0x17b
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF52
	.byte	0x1
	.uahalf	0x17b
	.uaword	0xb0
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x13
	.uaword	.LASF53
	.byte	0x1
	.uahalf	0x17d
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.uaword	.LASF54
	.byte	0x1
	.uahalf	0x17f
	.uaword	0x1a5
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.uaword	.LASF55
	.byte	0x1
	.uahalf	0x187
	.byte	0x1
	.uaword	0x1a5
	.uaword	.LFB9
	.uaword	.LFE9
	.uaword	.LLST9
	.byte	0x1
	.uaword	0x4ab
	.uleb128 0x16
	.uaword	.LASF23
	.byte	0x1
	.uahalf	0x187
	.uaword	0x199
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF56
	.byte	0x1
	.uahalf	0x187
	.uaword	0x197
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x13
	.uaword	.LASF54
	.byte	0x1
	.uahalf	0x189
	.uaword	0x1a5
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.uaword	.LASF139
	.byte	0x1
	.uahalf	0x190
	.uaword	0x1a5
	.uaword	.LFB10
	.uaword	.LFE10
	.uaword	.LLST10
	.byte	0x1
	.uleb128 0x11
	.uaword	.LASF57
	.byte	0x1
	.uahalf	0x199
	.byte	0x1
	.uaword	0xe7
	.uaword	.LFB11
	.uaword	.LFE11
	.uaword	.LLST11
	.byte	0x1
	.uaword	0x510
	.uleb128 0x12
	.asciz	"str"
	.byte	0x1
	.uahalf	0x199
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF58
	.byte	0x1
	.uahalf	0x199
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x1d
	.asciz	"s"
	.byte	0x1
	.uahalf	0x19b
	.uaword	0x510
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.uaword	0x516
	.uleb128 0x1e
	.uaword	0x190
	.uleb128 0x11
	.uaword	.LASF59
	.byte	0x1
	.uahalf	0x1a3
	.byte	0x1
	.uaword	0x1ec
	.uaword	.LFB12
	.uaword	.LFE12
	.uaword	.LLST12
	.byte	0x1
	.uaword	0x549
	.uleb128 0x12
	.asciz	"ch"
	.byte	0x1
	.uahalf	0x1a3
	.uaword	0x190
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0x14
	.uaword	.LASF60
	.byte	0x1
	.uahalf	0x1aa
	.byte	0x1
	.uaword	0xe7
	.uaword	.LFB13
	.uaword	.LFE13
	.uaword	.LLST13
	.byte	0x1
	.uaword	0x585
	.uleb128 0x12
	.asciz	"str"
	.byte	0x1
	.uahalf	0x1aa
	.uaword	0x585
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x1d
	.asciz	"i"
	.byte	0x1
	.uahalf	0x1ac
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.uaword	0x510
	.uleb128 0x15
	.uaword	.LASF61
	.byte	0x1
	.uahalf	0x1b5
	.byte	0x1
	.uaword	.LFB14
	.uaword	.LFE14
	.uaword	.LLST14
	.byte	0x1
	.uaword	0x61c
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x1b5
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x1b5
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x12
	.asciz	"len"
	.byte	0x1
	.uahalf	0x1b5
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x1b5
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x1b5
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x13
	.uaword	.LASF65
	.byte	0x1
	.uahalf	0x1b7
	.uaword	0x61c
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x19
	.uaword	.LBB4
	.uaword	.LBE4
	.uleb128 0x1d
	.asciz	"i"
	.byte	0x1
	.uahalf	0x1bb
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uaword	0xe7
	.uleb128 0x15
	.uaword	.LASF66
	.byte	0x1
	.uahalf	0x1d1
	.byte	0x1
	.uaword	.LFB15
	.uaword	.LFE15
	.uaword	.LLST15
	.byte	0x1
	.uaword	0x6cb
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x12
	.asciz	"len"
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x16
	.uaword	.LASF67
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0x1ec
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF68
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0xc6
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x1d1
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x13
	.uaword	.LASF70
	.byte	0x1
	.uahalf	0x1d3
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x15
	.uaword	.LASF71
	.byte	0x1
	.uahalf	0x214
	.byte	0x1
	.uaword	.LFB16
	.uaword	.LFE16
	.uaword	.LLST16
	.byte	0x1
	.uaword	0x78c
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x214
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x214
	.uaword	0xd1
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.uaword	.LASF67
	.byte	0x1
	.uahalf	0x214
	.uaword	0x1ec
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF68
	.byte	0x1
	.uahalf	0x214
	.uaword	0xc6
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x214
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x214
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x214
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x1d
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x216
	.uaword	0x78c
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.asciz	"len"
	.byte	0x1
	.uahalf	0x217
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x19
	.uaword	.LBB5
	.uaword	.LBE5
	.uleb128 0x13
	.uaword	.LASF73
	.byte	0x1
	.uahalf	0x229
	.uaword	0x516
	.byte	0x2
	.byte	0x91
	.sleb128 -5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uaword	0x190
	.uaword	0x79c
	.uleb128 0x20
	.uaword	0x79c
	.byte	0x1f
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF74
	.uleb128 0x14
	.uaword	.LASF75
	.byte	0x1
	.uahalf	0x24b
	.byte	0x1
	.uaword	0x1b1
	.uaword	.LFB17
	.uaword	.LFE17
	.uaword	.LLST17
	.byte	0x1
	.uaword	0x80e
	.uleb128 0x16
	.uaword	.LASF76
	.byte	0x1
	.uahalf	0x24b
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x24b
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x13
	.uaword	.LASF77
	.byte	0x1
	.uahalf	0x24d
	.uaword	0x1b1
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.uaword	.LASF78
	.byte	0x1
	.uahalf	0x24f
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x13
	.uaword	.LASF79
	.byte	0x1
	.uahalf	0x251
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.uaword	.LASF80
	.byte	0x1
	.uahalf	0x274
	.byte	0x1
	.uaword	0x118
	.uaword	.LFB18
	.uaword	.LFE18
	.uaword	.LLST18
	.byte	0x1
	.uaword	0x84b
	.uleb128 0x12
	.asciz	"num"
	.byte	0x1
	.uahalf	0x274
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x16
	.uaword	.LASF81
	.byte	0x1
	.uahalf	0x274
	.uaword	0x1f3
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.uaword	.LASF82
	.byte	0x1
	.uahalf	0x279
	.byte	0x1
	.uaword	0x118
	.uaword	.LFB19
	.uaword	.LFE19
	.uaword	.LLST19
	.byte	0x1
	.uaword	0x888
	.uleb128 0x16
	.uaword	.LASF83
	.byte	0x1
	.uahalf	0x279
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x16
	.uaword	.LASF81
	.byte	0x1
	.uahalf	0x279
	.uaword	0x1f3
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.uaword	.LASF84
	.byte	0x1
	.uahalf	0x27e
	.byte	0x1
	.uaword	0x1f3
	.uaword	.LFB20
	.uaword	.LFE20
	.uaword	.LLST20
	.byte	0x1
	.uaword	0x8fb
	.uleb128 0x12
	.asciz	"sf"
	.byte	0x1
	.uahalf	0x27e
	.uaword	0x1f3
	.byte	0x2
	.byte	0x8d
	.sleb128 0
	.uleb128 0x16
	.uaword	.LASF85
	.byte	0x1
	.uahalf	0x27e
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.uaword	.LASF54
	.byte	0x1
	.uahalf	0x280
	.uaword	0x1f3
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.uaword	.LBB6
	.uaword	.LBE6
	.uleb128 0x13
	.uaword	.LASF86
	.byte	0x1
	.uahalf	0x286
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.uaword	.LASF87
	.byte	0x1
	.uahalf	0x287
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.byte	0
	.uleb128 0x14
	.uaword	.LASF88
	.byte	0x1
	.uahalf	0x296
	.byte	0x1
	.uaword	0x1b1
	.uaword	.LFB21
	.uaword	.LFE21
	.uaword	.LLST21
	.byte	0x1
	.uaword	0x9e3
	.uleb128 0x16
	.uaword	.LASF67
	.byte	0x1
	.uahalf	0x296
	.uaword	0x1ec
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x296
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF89
	.byte	0x1
	.uahalf	0x296
	.uaword	0x118
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x16
	.uaword	.LASF81
	.byte	0x1
	.uahalf	0x296
	.uaword	0x1f3
	.byte	0x2
	.byte	0x8c
	.sleb128 0
	.uleb128 0x16
	.uaword	.LASF90
	.byte	0x1
	.uahalf	0x296
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x13
	.uaword	.LASF91
	.byte	0x1
	.uahalf	0x298
	.uaword	0x1b1
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x13
	.uaword	.LASF92
	.byte	0x1
	.uahalf	0x29a
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x13
	.uaword	.LASF93
	.byte	0x1
	.uahalf	0x29c
	.uaword	0x1ec
	.byte	0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x13
	.uaword	.LASF79
	.byte	0x1
	.uahalf	0x2a4
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.uaword	.LASF94
	.byte	0x1
	.uahalf	0x2a5
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.uaword	.LASF95
	.byte	0x1
	.uahalf	0x2a6
	.uaword	0x1f3
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x13
	.uaword	.LASF96
	.byte	0x1
	.uahalf	0x2a7
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.uaword	.LASF97
	.byte	0x1
	.uahalf	0x2a8
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x15
	.uaword	.LASF98
	.byte	0x1
	.uahalf	0x2bf
	.byte	0x1
	.uaword	.LFB22
	.uaword	.LFE22
	.uaword	.LLST22
	.byte	0x1
	.uaword	0xa9f
	.uleb128 0x16
	.uaword	.LASF77
	.byte	0x1
	.uahalf	0x2c0
	.uaword	0x1b1
	.byte	0x2
	.byte	0x88
	.sleb128 0
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x2c0
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x2c0
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x2c1
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x2c1
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x2c1
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x12
	.asciz	"len"
	.byte	0x1
	.uahalf	0x2c1
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x19
	.uaword	.LBB7
	.uaword	.LBE7
	.uleb128 0x13
	.uaword	.LASF99
	.byte	0x1
	.uahalf	0x2c6
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x19
	.uaword	.LBB8
	.uaword	.LBE8
	.uleb128 0x13
	.uaword	.LASF73
	.byte	0x1
	.uahalf	0x2cb
	.uaword	0x7e
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.uaword	.LASF100
	.byte	0x1
	.uahalf	0x312
	.byte	0x1
	.uaword	.LFB23
	.uaword	.LFE23
	.uaword	.LLST23
	.byte	0x1
	.uaword	0xb38
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x312
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF76
	.byte	0x1
	.uahalf	0x312
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x312
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x312
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x312
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x312
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x12
	.asciz	"len"
	.byte	0x1
	.uahalf	0x312
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x13
	.uaword	.LASF101
	.byte	0x1
	.uahalf	0x314
	.uaword	0x1b1
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.uaword	.LASF102
	.byte	0x1
	.uahalf	0x31c
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB24
	.uaword	.LFE24
	.uaword	.LLST24
	.byte	0x1
	.uaword	0xb71
	.uleb128 0x12
	.asciz	"x"
	.byte	0x1
	.uahalf	0x31c
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1d
	.asciz	"n"
	.byte	0x1
	.uahalf	0x31f
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x14
	.uaword	.LASF103
	.byte	0x1
	.uahalf	0x325
	.byte	0x1
	.uaword	0x118
	.uaword	.LFB25
	.uaword	.LFE25
	.uaword	.LLST25
	.byte	0x1
	.uaword	0xbca
	.uleb128 0x16
	.uaword	.LASF104
	.byte	0x1
	.uahalf	0x325
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.uaword	.LASF41
	.byte	0x1
	.uahalf	0x32f
	.uaword	0x11f
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.uaword	.LASF105
	.byte	0x1
	.uahalf	0x331
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1d
	.asciz	"z"
	.byte	0x1
	.uahalf	0x335
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.uaword	.LASF106
	.byte	0x1
	.uahalf	0x346
	.byte	0x1
	.uaword	0x118
	.uaword	.LFB26
	.uaword	.LFE26
	.uaword	.LLST26
	.byte	0x1
	.uaword	0xc32
	.uleb128 0x16
	.uaword	.LASF90
	.byte	0x1
	.uahalf	0x346
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x13
	.uaword	.LASF41
	.byte	0x1
	.uahalf	0x34d
	.uaword	0x11f
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.uaword	.LASF105
	.byte	0x1
	.uahalf	0x34e
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1d
	.asciz	"z"
	.byte	0x1
	.uahalf	0x34f
	.uaword	0xc32
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1d
	.asciz	"z2"
	.byte	0x1
	.uahalf	0x350
	.uaword	0xc32
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1e
	.uaword	0x118
	.uleb128 0x15
	.uaword	.LASF107
	.byte	0x1
	.uahalf	0x358
	.byte	0x1
	.uaword	.LFB27
	.uaword	.LFE27
	.uaword	.LLST27
	.byte	0x1
	.uaword	0xdbd
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x358
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF76
	.byte	0x1
	.uahalf	0x358
	.uaword	0x118
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x358
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x358
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x358
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x358
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0x12
	.asciz	"len"
	.byte	0x1
	.uahalf	0x358
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.uleb128 0x13
	.uaword	.LASF67
	.byte	0x1
	.uahalf	0x35a
	.uaword	0xdbd
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x13
	.uaword	.LASF78
	.byte	0x1
	.uahalf	0x35c
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.uaword	.LASF90
	.byte	0x1
	.uahalf	0x35e
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.uaword	.LASF108
	.byte	0x1
	.uahalf	0x35f
	.uaword	0x1ec
	.byte	0x2
	.byte	0x91
	.sleb128 -5
	.uleb128 0x13
	.uaword	.LASF81
	.byte	0x1
	.uahalf	0x360
	.uaword	0x1f3
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x13
	.uaword	.LASF109
	.byte	0x1
	.uahalf	0x37b
	.uaword	0x1ec
	.byte	0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x13
	.uaword	.LASF110
	.byte	0x1
	.uahalf	0x38c
	.uaword	0x1ec
	.byte	0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x13
	.uaword	.LASF111
	.byte	0x1
	.uahalf	0x38d
	.uaword	0x1b1
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x13
	.uaword	.LASF112
	.byte	0x1
	.uahalf	0x3a6
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x13
	.uaword	.LASF113
	.byte	0x1
	.uahalf	0x3a8
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x13
	.uaword	.LASF114
	.byte	0x1
	.uahalf	0x3b7
	.uaword	0x61c
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.uaword	.LBB9
	.uaword	.LBE9
	.uaword	0xd94
	.uleb128 0x13
	.uaword	.LASF115
	.byte	0x1
	.uahalf	0x369
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.asciz	"p10"
	.byte	0x1
	.uahalf	0x36b
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.uaword	.LBB10
	.uaword	.LBE10
	.uleb128 0x13
	.uaword	.LASF116
	.byte	0x1
	.uahalf	0x37d
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x13
	.uaword	.LASF117
	.byte	0x1
	.uahalf	0x384
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uaword	0x1ec
	.uleb128 0x15
	.uaword	.LASF118
	.byte	0x1
	.uahalf	0x3ca
	.byte	0x1
	.uaword	.LFB28
	.uaword	.LFE28
	.uaword	.LLST28
	.byte	0x1
	.uaword	0xe5a
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x3ca
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x3ca
	.uaword	0x118
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x3ca
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x16
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x3ca
	.uaword	0xe7
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x16
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x3ca
	.uaword	0xbb
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x16
	.uaword	.LASF119
	.byte	0x1
	.uahalf	0x3ca
	.uaword	0x1ec
	.byte	0x3
	.byte	0x91
	.sleb128 95
	.uleb128 0x1d
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x3cc
	.uaword	0x78c
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.asciz	"len"
	.byte	0x1
	.uahalf	0x3cd
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x11
	.uaword	.LASF120
	.byte	0x1
	.uahalf	0x3ff
	.byte	0x1
	.uaword	0xbb
	.uaword	.LFB29
	.uaword	.LFE29
	.uaword	.LLST29
	.byte	0x1
	.uaword	0xe98
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x3ff
	.uaword	0x585
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x13
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x401
	.uaword	0xbb
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x14
	.uaword	.LASF122
	.byte	0x1
	.uahalf	0x411
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB30
	.uaword	.LFE30
	.uaword	.LLST30
	.byte	0x1
	.uaword	0x1049
	.uleb128 0x16
	.uaword	.LASF62
	.byte	0x1
	.uahalf	0x411
	.uaword	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x411
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF123
	.byte	0x1
	.uahalf	0x411
	.uaword	0xa5
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x19
	.uaword	.LBB11
	.uaword	.LBE11
	.uleb128 0x13
	.uaword	.LASF64
	.byte	0x1
	.uahalf	0x424
	.uaword	0xbb
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x13
	.uaword	.LASF63
	.byte	0x1
	.uahalf	0x427
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x13
	.uaword	.LASF69
	.byte	0x1
	.uahalf	0x438
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.uaword	.LBB12
	.uaword	.LBE12
	.uaword	0xf37
	.uleb128 0x1d
	.asciz	"w"
	.byte	0x1
	.uahalf	0x42c
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x18
	.uaword	.LBB13
	.uaword	.LBE13
	.uaword	0xf54
	.uleb128 0x13
	.uaword	.LASF117
	.byte	0x1
	.uahalf	0x440
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x18
	.uaword	.LBB14
	.uaword	.LBE14
	.uaword	0xfe1
	.uleb128 0x13
	.uaword	.LASF68
	.byte	0x1
	.uahalf	0x48f
	.uaword	0xc6
	.byte	0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x18
	.uaword	.LBB15
	.uaword	.LBE15
	.uaword	0xf8d
	.uleb128 0x13
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x4ad
	.uaword	0x104e
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x18
	.uaword	.LBB16
	.uaword	.LBE16
	.uaword	0xfaa
	.uleb128 0x13
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x4b2
	.uaword	0x1053
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x18
	.uaword	.LBB17
	.uaword	.LBE17
	.uaword	0xfc7
	.uleb128 0x13
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x4ba
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x19
	.uaword	.LBB18
	.uaword	.LBE18
	.uleb128 0x13
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x4cf
	.uaword	0x105f
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.byte	0
	.byte	0
	.uleb128 0x18
	.uaword	.LBB19
	.uaword	.LBE19
	.uaword	0xffc
	.uleb128 0x1d
	.asciz	"l"
	.byte	0x1
	.uahalf	0x4ec
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.uaword	.LBB20
	.uaword	.LBE20
	.uaword	0x102e
	.uleb128 0x1d
	.asciz	"p"
	.byte	0x1
	.uahalf	0x500
	.uaword	0x510
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.uaword	.LBB21
	.uaword	.LBE21
	.uleb128 0x1d
	.asciz	"l"
	.byte	0x1
	.uahalf	0x505
	.uaword	0xe7
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x19
	.uaword	.LBB22
	.uaword	.LBE22
	.uleb128 0x13
	.uaword	.LASF72
	.byte	0x1
	.uahalf	0x522
	.uaword	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uaword	0x33
	.uleb128 0x1e
	.uaword	0x3a
	.uleb128 0x1e
	.uaword	0x1058
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF124
	.uleb128 0x1e
	.uaword	0x65
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF125
	.byte	0x1
	.uahalf	0x551
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB31
	.uaword	.LFE31
	.uaword	.LLST31
	.byte	0x1
	.uaword	0x10b3
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x551
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x12
	.asciz	"arg"
	.byte	0x1
	.uahalf	0x551
	.uaword	0xa5
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x13
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x553
	.uaword	0x1a5
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF126
	.byte	0x1
	.uahalf	0x557
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB32
	.uaword	.LFE32
	.uaword	.LLST32
	.byte	0x1
	.uaword	0x111e
	.uleb128 0x12
	.asciz	"s"
	.byte	0x1
	.uahalf	0x557
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x12
	.asciz	"n"
	.byte	0x1
	.uahalf	0x557
	.uaword	0xb0
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x557
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x12
	.asciz	"arg"
	.byte	0x1
	.uahalf	0x557
	.uaword	0xa5
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x13
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x559
	.uaword	0x1a5
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF127
	.byte	0x1
	.uahalf	0x55d
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB33
	.uaword	.LFE33
	.uaword	.LLST33
	.byte	0x1
	.uaword	0x116c
	.uleb128 0x12
	.asciz	"s"
	.byte	0x1
	.uahalf	0x55d
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x55d
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x12
	.asciz	"arg"
	.byte	0x1
	.uahalf	0x55d
	.uaword	0xa5
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF128
	.byte	0x1
	.uahalf	0x562
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB34
	.uaword	.LFE34
	.uaword	.LLST34
	.byte	0x1
	.uaword	0x11db
	.uleb128 0x12
	.asciz	"out"
	.byte	0x1
	.uahalf	0x562
	.uaword	0x199
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF56
	.byte	0x1
	.uahalf	0x562
	.uaword	0x197
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x562
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x12
	.asciz	"arg"
	.byte	0x1
	.uahalf	0x562
	.uaword	0xa5
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x13
	.uaword	.LASF40
	.byte	0x1
	.uahalf	0x564
	.uaword	0x1a5
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF129
	.byte	0x1
	.uahalf	0x568
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB35
	.uaword	.LFE35
	.uaword	.LLST35
	.byte	0x1
	.uaword	0x122a
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x568
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x22
	.uleb128 0x13
	.uaword	.LASF123
	.byte	0x1
	.uahalf	0x56a
	.uaword	0xa5
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1d
	.asciz	"ret"
	.byte	0x1
	.uahalf	0x56c
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF130
	.byte	0x1
	.uahalf	0x571
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB36
	.uaword	.LFE36
	.uaword	.LLST36
	.byte	0x1
	.uaword	0x1287
	.uleb128 0x12
	.asciz	"s"
	.byte	0x1
	.uahalf	0x571
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x571
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x22
	.uleb128 0x13
	.uaword	.LASF123
	.byte	0x1
	.uahalf	0x573
	.uaword	0xa5
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1d
	.asciz	"ret"
	.byte	0x1
	.uahalf	0x575
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF131
	.byte	0x1
	.uahalf	0x57a
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB37
	.uaword	.LFE37
	.uaword	.LLST37
	.byte	0x1
	.uaword	0x12f2
	.uleb128 0x12
	.asciz	"s"
	.byte	0x1
	.uahalf	0x57a
	.uaword	0x19f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x12
	.asciz	"n"
	.byte	0x1
	.uahalf	0x57a
	.uaword	0xb0
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x57a
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x22
	.uleb128 0x13
	.uaword	.LASF123
	.byte	0x1
	.uahalf	0x57c
	.uaword	0xa5
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1d
	.asciz	"ret"
	.byte	0x1
	.uahalf	0x57e
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.uaword	.LASF132
	.byte	0x1
	.uahalf	0x583
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB38
	.uaword	.LFE38
	.uaword	.LLST38
	.byte	0x1
	.uaword	0x1361
	.uleb128 0x12
	.asciz	"out"
	.byte	0x1
	.uahalf	0x583
	.uaword	0x199
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF56
	.byte	0x1
	.uahalf	0x583
	.uaword	0x197
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x16
	.uaword	.LASF121
	.byte	0x1
	.uahalf	0x583
	.uaword	0x510
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x22
	.uleb128 0x13
	.uaword	.LASF123
	.byte	0x1
	.uahalf	0x585
	.uaword	0xa5
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1d
	.asciz	"ret"
	.byte	0x1
	.uahalf	0x587
	.uaword	0x1049
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x1f
	.uaword	0x118
	.uaword	0x1371
	.uleb128 0x20
	.uaword	0x79c
	.byte	0x11
	.byte	0
	.uleb128 0x13
	.uaword	.LASF133
	.byte	0x1
	.uahalf	0x240
	.uaword	0x1383
	.byte	0x5
	.byte	0x3
	.uaword	powers_of_10
	.uleb128 0x1e
	.uaword	0x1361
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LFB0-.Ltext0
	.uaword	.LCFI0-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI0-.Ltext0
	.uaword	.LFE0-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LFB1-.Ltext0
	.uaword	.LCFI1-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI1-.Ltext0
	.uaword	.LFE1-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LFB2-.Ltext0
	.uaword	.LCFI2-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI2-.Ltext0
	.uaword	.LFE2-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LFB3-.Ltext0
	.uaword	.LCFI3-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI3-.Ltext0
	.uaword	.LFE3-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LFB4-.Ltext0
	.uaword	.LCFI4-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI4-.Ltext0
	.uaword	.LFE4-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LFB5-.Ltext0
	.uaword	.LCFI5-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI5-.Ltext0
	.uaword	.LFE5-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LFB6-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE6-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LFB7-.Ltext0
	.uaword	.LCFI7-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI7-.Ltext0
	.uaword	.LFE7-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LFB8-.Ltext0
	.uaword	.LCFI8-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI8-.Ltext0
	.uaword	.LFE8-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LFB9-.Ltext0
	.uaword	.LCFI9-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI9-.Ltext0
	.uaword	.LFE9-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LFB10-.Ltext0
	.uaword	.LCFI10-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI10-.Ltext0
	.uaword	.LFE10-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LFB11-.Ltext0
	.uaword	.LCFI11-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI11-.Ltext0
	.uaword	.LFE11-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST12:
	.uaword	.LFB12-.Ltext0
	.uaword	.LCFI12-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI12-.Ltext0
	.uaword	.LFE12-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST13:
	.uaword	.LFB13-.Ltext0
	.uaword	.LCFI13-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI13-.Ltext0
	.uaword	.LFE13-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST14:
	.uaword	.LFB14-.Ltext0
	.uaword	.LCFI14-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI14-.Ltext0
	.uaword	.LFE14-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST15:
	.uaword	.LFB15-.Ltext0
	.uaword	.LCFI15-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI15-.Ltext0
	.uaword	.LFE15-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST16:
	.uaword	.LFB16-.Ltext0
	.uaword	.LCFI16-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI16-.Ltext0
	.uaword	.LFE16-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST17:
	.uaword	.LFB17-.Ltext0
	.uaword	.LCFI17-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI17-.Ltext0
	.uaword	.LFE17-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST18:
	.uaword	.LFB18-.Ltext0
	.uaword	.LCFI18-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI18-.Ltext0
	.uaword	.LFE18-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST19:
	.uaword	.LFB19-.Ltext0
	.uaword	.LCFI19-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI19-.Ltext0
	.uaword	.LFE19-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST20:
	.uaword	.LFB20-.Ltext0
	.uaword	.LCFI20-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI20-.Ltext0
	.uaword	.LFE20-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST21:
	.uaword	.LFB21-.Ltext0
	.uaword	.LCFI21-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI21-.Ltext0
	.uaword	.LFE21-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST22:
	.uaword	.LFB22-.Ltext0
	.uaword	.LCFI22-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI22-.Ltext0
	.uaword	.LFE22-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST23:
	.uaword	.LFB23-.Ltext0
	.uaword	.LCFI23-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI23-.Ltext0
	.uaword	.LFE23-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST24:
	.uaword	.LFB24-.Ltext0
	.uaword	.LCFI24-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI24-.Ltext0
	.uaword	.LFE24-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST25:
	.uaword	.LFB25-.Ltext0
	.uaword	.LCFI25-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI25-.Ltext0
	.uaword	.LFE25-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST26:
	.uaword	.LFB26-.Ltext0
	.uaword	.LCFI26-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI26-.Ltext0
	.uaword	.LFE26-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST27:
	.uaword	.LFB27-.Ltext0
	.uaword	.LCFI27-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI27-.Ltext0
	.uaword	.LFE27-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST28:
	.uaword	.LFB28-.Ltext0
	.uaword	.LCFI28-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI28-.Ltext0
	.uaword	.LFE28-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST29:
	.uaword	.LFB29-.Ltext0
	.uaword	.LCFI29-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI29-.Ltext0
	.uaword	.LFE29-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST30:
	.uaword	.LFB30-.Ltext0
	.uaword	.LCFI30-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI30-.Ltext0
	.uaword	.LFE30-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST31:
	.uaword	.LFB31-.Ltext0
	.uaword	.LCFI31-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI31-.Ltext0
	.uaword	.LFE31-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST32:
	.uaword	.LFB32-.Ltext0
	.uaword	.LCFI32-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI32-.Ltext0
	.uaword	.LFE32-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST33:
	.uaword	.LFB33-.Ltext0
	.uaword	.LCFI33-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI33-.Ltext0
	.uaword	.LFE33-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST34:
	.uaword	.LFB34-.Ltext0
	.uaword	.LCFI34-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI34-.Ltext0
	.uaword	.LFE34-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST35:
	.uaword	.LFB35-.Ltext0
	.uaword	.LCFI35-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI35-.Ltext0
	.uaword	.LFE35-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST36:
	.uaword	.LFB36-.Ltext0
	.uaword	.LCFI36-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI36-.Ltext0
	.uaword	.LFE36-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST37:
	.uaword	.LFB37-.Ltext0
	.uaword	.LCFI37-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI37-.Ltext0
	.uaword	.LFE37-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST38:
	.uaword	.LFB38-.Ltext0
	.uaword	.LCFI38-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI38-.Ltext0
	.uaword	.LFE38-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
	.section	.debug_aranges,"",@progbits
	.uaword	0x1c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.Ltext0
	.uaword	.Letext0-.Ltext0
	.uaword	0
	.uaword	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF115:
	.asciz	"exp10"
.LASF22:
	.asciz	"double_with_bit_access"
.LASF127:
	.asciz	"vsprintf_"
.LASF14:
	.asciz	"size_t"
.LASF11:
	.asciz	"uintptr_t"
.LASF34:
	.asciz	"scaling_factor"
.LASF133:
	.asciz	"powers_of_10"
.LASF8:
	.asciz	"uint64_t"
.LASF53:
	.asciz	"usable_buffer_size"
.LASF102:
	.asciz	"bastardized_floor"
.LASF13:
	.asciz	"va_list"
.LASF80:
	.asciz	"apply_scaling"
.LASF101:
	.asciz	"value_"
.LASF20:
	.asciz	"double_uint_t"
.LASF9:
	.asciz	"long long unsigned int"
.LASF39:
	.asciz	"get_exp2"
.LASF114:
	.asciz	"printed_exponential_start_pos"
.LASF82:
	.asciz	"unapply_scaling"
.LASF120:
	.asciz	"parse_flags"
.LASF116:
	.asciz	"required_significant_digits"
.LASF90:
	.asciz	"floored_exp10"
.LASF122:
	.asciz	"_vsnprintf"
.LASF2:
	.asciz	"long long int"
.LASF0:
	.asciz	"signed char"
.LASF81:
	.asciz	"normalization"
.LASF100:
	.asciz	"print_decimal_number"
.LASF106:
	.asciz	"pow10_of_int"
.LASF23:
	.asciz	"function"
.LASF60:
	.asciz	"atou_"
.LASF73:
	.asciz	"digit"
.LASF41:
	.asciz	"dwba"
.LASF40:
	.asciz	"gadget"
.LASF107:
	.asciz	"print_exponential_number"
.LASF93:
	.asciz	"close_to_representation_extremum"
.LASF124:
	.asciz	"long int"
.LASF29:
	.asciz	"integral"
.LASF137:
	.asciz	"__builtin_va_list"
.LASF21:
	.asciz	"double"
.LASF78:
	.asciz	"abs_number"
.LASF71:
	.asciz	"print_integer"
.LASF103:
	.asciz	"log10_of_positive"
.LASF99:
	.asciz	"count"
.LASF18:
	.asciz	"printf_signed_value_t"
.LASF42:
	.asciz	"write_pos"
.LASF76:
	.asciz	"number"
.LASF130:
	.asciz	"sprintf_"
.LASF135:
	.asciz	"cortos_src/cortos_util_ee_printf.c"
.LASF138:
	.asciz	"uart_send_char"
.LASF38:
	.asciz	"get_sign_bit"
.LASF72:
	.asciz	"value"
.LASF98:
	.asciz	"print_broken_up_decimal"
.LASF7:
	.asciz	"unsigned int"
.LASF109:
	.asciz	"fall_back_to_decimal_only_mode"
.LASF113:
	.asciz	"decimal_part_width"
.LASF75:
	.asciz	"get_components"
.LASF62:
	.asciz	"output"
.LASF49:
	.asciz	"ctrl_reg"
.LASF117:
	.asciz	"precision_"
.LASF36:
	.asciz	"multiply"
.LASF89:
	.asciz	"non_normalized"
.LASF16:
	.asciz	"numeric_base_t"
.LASF83:
	.asciz	"normalized"
.LASF95:
	.asciz	"account_for_precision"
.LASF63:
	.asciz	"width"
.LASF4:
	.asciz	"short unsigned int"
.LASF112:
	.asciz	"exp10_part_width"
.LASF61:
	.asciz	"out_rev_"
.LASF110:
	.asciz	"should_skip_normalization"
.LASF28:
	.asciz	"output_gadget_t"
.LASF30:
	.asciz	"fractional"
.LASF33:
	.asciz	"double_components"
.LASF118:
	.asciz	"print_floating_point"
.LASF96:
	.asciz	"scaled_remainder"
.LASF26:
	.asciz	"max_chars"
.LASF105:
	.asciz	"exp2"
.LASF37:
	.asciz	"get_bit_access"
.LASF136:
	.asciz	"/Satvik/fft/cortos_build"
.LASF91:
	.asciz	"components"
.LASF119:
	.asciz	"prefer_exponential"
.LASF68:
	.asciz	"base"
.LASF47:
	.asciz	"unused"
.LASF92:
	.asciz	"scaled"
.LASF74:
	.asciz	"sizetype"
.LASF12:
	.asciz	"__gnuc_va_list"
.LASF104:
	.asciz	"positive_number"
.LASF19:
	.asciz	"printf_size_t"
.LASF128:
	.asciz	"vfctprintf"
.LASF87:
	.asciz	"extra_factor_exp2"
.LASF134:
	.asciz	"GNU C 4.7.4"
.LASF46:
	.asciz	"putchar_wrapper"
.LASF86:
	.asciz	"factor_exp2"
.LASF108:
	.asciz	"abs_exp10_covered_by_powers_table"
.LASF97:
	.asciz	"rounding_threshold"
.LASF45:
	.asciz	"null_char_pos"
.LASF32:
	.asciz	"_Bool"
.LASF3:
	.asciz	"unsigned char"
.LASF77:
	.asciz	"number_"
.LASF125:
	.asciz	"vprintf_"
.LASF35:
	.asciz	"raw_factor"
.LASF1:
	.asciz	"short int"
.LASF88:
	.asciz	"get_normalized_components"
.LASF67:
	.asciz	"negative"
.LASF121:
	.asciz	"format"
.LASF57:
	.asciz	"strnlen_s_"
.LASF59:
	.asciz	"is_digit_"
.LASF79:
	.asciz	"remainder"
.LASF43:
	.asciz	"putchar_via_gadget"
.LASF85:
	.asciz	"extra_multiplicative_factor"
.LASF6:
	.asciz	"uint32_t"
.LASF66:
	.asciz	"print_integer_finalization"
.LASF123:
	.asciz	"args"
.LASF94:
	.asciz	"prec_power_of_10"
.LASF27:
	.asciz	"char"
.LASF17:
	.asciz	"printf_unsigned_value_t"
.LASF65:
	.asciz	"start_pos"
.LASF69:
	.asciz	"precision"
.LASF15:
	.asciz	"printf_flags_t"
.LASF131:
	.asciz	"snprintf_"
.LASF25:
	.asciz	"buffer"
.LASF126:
	.asciz	"vsnprintf_"
.LASF139:
	.asciz	"extern_putchar_gadget"
.LASF31:
	.asciz	"is_negative"
.LASF10:
	.asciz	"int_fast64_t"
.LASF132:
	.asciz	"fctprintf"
.LASF111:
	.asciz	"decimal_part_components"
.LASF84:
	.asciz	"update_normalization"
.LASF24:
	.asciz	"extra_function_arg"
.LASF51:
	.asciz	"buffer_gadget"
.LASF52:
	.asciz	"buffer_size"
.LASF129:
	.asciz	"printf_"
.LASF5:
	.asciz	"uint8_t"
.LASF64:
	.asciz	"flags"
.LASF44:
	.asciz	"append_termination_with_gadget"
.LASF70:
	.asciz	"unpadded_len"
.LASF58:
	.asciz	"maxsize"
.LASF50:
	.asciz	"discarding_gadget"
.LASF54:
	.asciz	"result"
.LASF56:
	.asciz	"extra_arg"
.LASF55:
	.asciz	"function_gadget"
.LASF48:
	.asciz	"success"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
