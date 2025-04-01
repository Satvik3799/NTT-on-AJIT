	.file	"NTT.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.global done_0
	.section	".bss"
	.align 4
	.type	done_0, #object
	.size	done_0, 4
done_0:
	.skip	4
	.global done_1
	.align 4
	.type	done_1, #object
	.size	done_1, 4
done_1:
	.skip	4
	.section	".text"
	.align 4
	.global bit_reverse
	.type	bit_reverse, #function
	.proc	015
bit_reverse:
.LFB3:
	.file 1 "../NTT.c"
	.loc 1 25 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g2
	mov	%i1, %g1
	sth	%g2, [%fp+68]
	sth	%g1, [%fp+72]
	.loc 1 26 0
	sth	%g0, [%fp-2]
	.loc 1 28 0
	sth	%g0, [%fp-4]
	b	.L2
	 nop
.L4:
	.loc 1 29 0
	lduh	[%fp+68], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sra	%g2, %g1, %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	be	.L3
	 nop
	.loc 1 30 0
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, -1, %g2
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sub	%g2, %g1, %g1
	mov	1, %g2
	sll	%g2, %g1, %g1
	mov	%g1, %g2
	lduh	[%fp-2], %g1
	or	%g2, %g1, %g1
	sth	%g1, [%fp-2]
.L3:
	.loc 1 28 0
	lduh	[%fp-4], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-4]
.L2:
	.loc 1 28 0 is_stmt 0 discriminator 1
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g2, %g1
	blu	.L4
	 nop
	.loc 1 33 0 is_stmt 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	.loc 1 34 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	bit_reverse, .-bit_reverse
	.align 4
	.global barret_reduction
	.type	barret_reduction, #function
	.proc	015
barret_reduction:
.LFB4:
	.loc 1 36 0
	.cfi_startproc
	save	%sp, -128, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g1
	sth	%g1, [%fp+68]
	.loc 1 37 0
	sth	%g0, [%fp-4]
	.loc 1 38 0
	sethi	%hi(4096), %g1
	or	%g1, 943, %g1
	sth	%g1, [%fp-6]
	.loc 1 40 0
	lduh	[%fp-6], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %i2
	mov	%g1, %i3
	lduh	[%fp+68], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %i4
	mov	%g1, %i5
	smul	%i2, %i5, %g4
	smul	%i4, %i3, %g1
	add	%g4, %g1, %g1
	umul	%i3, %i5, %i5
	rd	%y, %i4
	add	%g1, %i4, %g1
	mov	%g1, %i4
	std	%i4, [%fp-16]
	std	%i4, [%fp-16]
	.loc 1 41 0
	ld	[%fp-16], %g1
	sll	%g1, 8, %g1
	ld	[%fp-12], %g4
	srl	%g4, 24, %g3
	or	%g1, %g3, %g3
	ld	[%fp-16], %g1
	srl	%g1, 24, %g2
	sth	%g3, [%fp-18]
	.loc 1 42 0
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %i4
	mov	%g1, %i5
	lduh	[%fp-18], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %g2
	mov	%g1, %g3
	smul	%i4, %g3, %g4
	smul	%g2, %i5, %g1
	add	%g4, %g1, %g1
	umul	%i5, %g3, %g3
	rd	%y, %g2
	add	%g1, %g2, %g1
	mov	%g1, %g2
	std	%g2, [%fp-32]
	std	%g2, [%fp-32]
	.loc 1 43 0
	ld	[%fp-28], %g1
	lduh	[%fp+68], %g2
	sub	%g2, %g1, %g1
	sth	%g1, [%fp-2]
	.loc 1 44 0
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g2, %g1
	bleu	.L7
	 nop
	.loc 1 45 0
	lduh	[%fp-2], %g2
	lduh	[%fp-4], %g1
	sub	%g2, %g1, %g1
	sth	%g1, [%fp-2]
.L7:
	.loc 1 47 0
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	.loc 1 48 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	barret_reduction, .-barret_reduction
	.align 4
	.global addr_gen
	.type	addr_gen, #function
	.proc	020
addr_gen:
.LFB5:
	.loc 1 50 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g4
	mov	%i1, %g3
	mov	%i2, %g2
	mov	%i3, %g1
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	sth	%g4, [%fp+68]
	sth	%g3, [%fp+72]
	sth	%g2, [%fp+76]
	sth	%g1, [%fp+80]
	.loc 1 51 0
	lduh	[%fp+68], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp+76], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, -1, %g3
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sub	%g3, %g1, %g1
	sra	%g2, %g1, %g1
	sth	%g1, [%fp-2]
	.loc 1 52 0
	lduh	[%fp+80], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sra	%g2, %g1, %g1
	add	%g1, -1, %g1
	mov	%g1, %g2
	lduh	[%fp+68], %g1
	and	%g2, %g1, %g1
	sth	%g1, [%fp-4]
	.loc 1 53 0
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp+76], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g3
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sub	%g3, %g1, %g1
	sll	%g2, %g1, %g1
	mov	%g1, %g2
	lduh	[%fp-4], %g1
	add	%g2, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+84], %g1
	sth	%g2, [%g1]
	.loc 1 54 0
	ld	[%fp+84], %g1
	lduh	[%g1], %g2
	lduh	[%fp+76], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g3
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sub	%g3, %g1, %g1
	add	%g1, -1, %g1
	mov	1, %g3
	sll	%g3, %g1, %g1
	add	%g2, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+88], %g1
	sth	%g2, [%g1]
	.loc 1 55 0
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	1, %g2
	sll	%g2, %g1, %g1
	mov	%g1, %g2
	lduh	[%fp+68], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g3
	lduh	[%fp+76], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g4
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sub	%g4, %g1, %g1
	add	%g1, -1, %g1
	sra	%g3, %g1, %g1
	add	%g2, %g1, %g1
	mov	%g1, %g2
	ld	[%fp+92], %g1
	sth	%g2, [%g1]
	.loc 1 56 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	addr_gen, .-addr_gen
	.global __umoddi3
	.align 4
	.global butterfly_dit
	.type	butterfly_dit, #function
	.proc	020
butterfly_dit:
.LFB6:
	.loc 1 59 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	mov	%i0, %g3
	mov	%i1, %g2
	mov	%i2, %g1
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	sth	%g3, [%fp+68]
	sth	%g2, [%fp+72]
	sth	%g1, [%fp+76]
	.loc 1 60 0
	lduh	[%fp+68], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %i4
	mov	%g1, %i5
	lduh	[%fp+76], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %g2
	mov	%g1, %g3
	smul	%i4, %g3, %g4
	smul	%g2, %i5, %g1
	add	%g4, %g1, %g1
	umul	%i5, %g3, %g3
	rd	%y, %g2
	add	%g1, %g2, %g1
	mov	%g1, %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	3329, %o3
	call	__umoddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	mov	%g3, %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	%g1, %o0
	call	barret_reduction, 0
	 nop
	mov	%o0, %g1
	sth	%g1, [%fp-2]
	.loc 1 61 0
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g2, %g1, %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 3329, %g2
	smul	%g2, 3329, %g2
	sub	%g1, %g2, %g1
	mov	%g1, %g2
	ld	[%fp+80], %g1
	sth	%g2, [%g1]
	.loc 1 62 0
	lduh	[%fp+72], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	sub	%g2, %g1, %g1
	add	%g1, 3329, %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 3329, %g2
	smul	%g2, 3329, %g2
	sub	%g1, %g2, %g1
	mov	%g1, %g2
	ld	[%fp+84], %g1
	sth	%g2, [%g1]
	.loc 1 63 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	butterfly_dit, .-butterfly_dit
	.section	".rodata"
	.align 8
.LC0:
	.long	1080033280
	.long	0
	.section	".text"
	.align 4
	.global ct_ntt
	.type	ct_ntt, #function
	.proc	020
ct_ntt:
.LFB7:
	.loc 1 66 0
	.cfi_startproc
	save	%sp, -144, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 68 0
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldd	[%g1], %f8
	std	%f8, [%fp-32]
	ldd	[%fp-32], %o0
	call	log2, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtoi	%f8, %f10
	st	%f10, [%fp-36]
	ld	[%fp-36], %g1
	sth	%g1, [%fp-6]
	.loc 1 69 0
	mov	64, %g1
	sth	%g1, [%fp-8]
	.loc 1 71 0
	sth	%g0, [%fp-2]
	b	.L12
	 nop
.L15:
	.loc 1 72 0
	sth	%g0, [%fp-4]
	b	.L13
	 nop
.L14:
.LBB2:
	.loc 1 74 0 discriminator 2
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %i4
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %i5
	lduh	[%fp-6], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g4
	lduh	[%fp-8], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g3
	add	%fp, -16, %g2
	add	%fp, -18, %g1
	add	%fp, -20, %i3
	st	%i3, [%sp+92]
	mov	%i4, %o0
	mov	%i5, %o1
	mov	%g4, %o2
	mov	%g3, %o3
	mov	%g2, %o4
	mov	%g1, %o5
	call	addr_gen, 0
	 nop
	.loc 1 75 0 discriminator 2
	lduh	[%fp-20], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	lduh	[%g1], %g1
	sth	%g1, [%fp-10]
	.loc 1 76 0 discriminator 2
	lduh	[%fp-16], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	lduh	[%g1], %g1
	sth	%g1, [%fp-12]
	.loc 1 77 0 discriminator 2
	lduh	[%fp-18], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	lduh	[%g1], %g1
	sth	%g1, [%fp-14]
	.loc 1 79 0 discriminator 2
	lduh	[%fp-10], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %i5
	lduh	[%fp-12], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g4
	lduh	[%fp-14], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g3
	add	%fp, -22, %g2
	add	%fp, -24, %g1
	mov	%i5, %o0
	mov	%g4, %o1
	mov	%g3, %o2
	mov	%g2, %o3
	mov	%g1, %o4
	call	butterfly_dit, 0
	 nop
	.loc 1 80 0 discriminator 2
	lduh	[%fp-16], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	lduh	[%fp-22], %g2
	sth	%g2, [%g1]
	.loc 1 81 0 discriminator 2
	lduh	[%fp-18], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	lduh	[%fp-24], %g2
	sth	%g2, [%g1]
.LBE2:
	.loc 1 72 0 discriminator 2
	lduh	[%fp-4], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-4]
.L13:
	.loc 1 72 0 is_stmt 0 discriminator 1
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-8], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g2, %g1
	blu	.L14
	 nop
	.loc 1 71 0 is_stmt 1
	lduh	[%fp-2], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-2]
.L12:
	.loc 1 71 0 is_stmt 0 discriminator 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-6], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g2, %g1
	blu	.L15
	 nop
	.loc 1 84 0 is_stmt 1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	ct_ntt, .-ct_ntt
	.section	".rodata"
	.align 8
.LC1:
	.long	1080033280
	.long	0
	.section	".text"
	.align 4
	.global gen_tf
	.type	gen_tf, #function
	.proc	020
gen_tf:
.LFB8:
	.loc 1 88 0
	.cfi_startproc
	save	%sp, -888, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 89 0
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
	ldd	[%g1], %f8
	std	%f8, [%fp-784]
	ldd	[%fp-784], %o0
	call	log2, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtoi	%f8, %f10
	st	%f10, [%fp-788]
	ld	[%fp-788], %g1
	sth	%g1, [%fp-8]
	.loc 1 92 0
	sth	%g0, [%fp-2]
	b	.L17
	 nop
.L18:
	.loc 1 93 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %i3
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g2
	lduh	[%fp-8], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	%g2, %o0
	mov	%g1, %o1
	call	bit_reverse, 0
	 nop
	mov	%o0, %g1
	mov	%g1, %g2
	add	%i3, %i3, %g1
	add	%fp, %g1, %g1
	sth	%g2, [%g1-776]
	.loc 1 92 0 discriminator 2
	lduh	[%fp-2], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-2]
.L17:
	.loc 1 92 0 is_stmt 0 discriminator 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 127
	bleu	.L18
	 nop
	.loc 1 96 0 is_stmt 1
	mov	1, %g1
	sth	%g1, [%fp-4]
	mov	1, %g1
	sth	%g1, [%fp-6]
	.loc 1 97 0
	sth	%g0, [%fp-2]
	b	.L19
	 nop
.L20:
	.loc 1 98 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%fp-4], %g2
	sth	%g2, [%g1-264]
	.loc 1 99 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%fp-6], %g2
	sth	%g2, [%g1-520]
	.loc 1 100 0 discriminator 2
	lduh	[%fp-4], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %i2
	mov	%g1, %i3
	mov	%i2, %g2
	mov	%i3, %g3
	srl	%g3, 28, %g1
	sll	%g2, 4, %i4
	or	%g1, %i4, %i4
	sll	%g3, 4, %i5
	mov	%i4, %g2
	mov	%i5, %g3
	addcc	%g3, %i3, %i1
	addx	%g2, %i2, %i0
	mov	%i0, %o0
	mov	%i1, %o1
	mov	0, %o2
	mov	3329, %o3
	call	__umoddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	sth	%g3, [%fp-4]
	.loc 1 101 0 discriminator 2
	lduh	[%fp-6], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	mov	0, %g2
	mov	%g1, %g3
	smul	%g2, 1175, %g4
	smul	%g3, 0, %g1
	add	%g4, %g1, %g1
	umul	%g3, 1175, %g3
	rd	%y, %g2
	add	%g1, %g2, %g1
	mov	%g1, %g2
	mov	%g2, %o0
	mov	%g3, %o1
	mov	0, %o2
	mov	3329, %o3
	call	__umoddi3, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	sth	%g3, [%fp-6]
	.loc 1 97 0 discriminator 2
	lduh	[%fp-2], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-2]
.L19:
	.loc 1 97 0 is_stmt 0 discriminator 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 127
	bleu	.L20
	 nop
	.loc 1 104 0 is_stmt 1
	sth	%g0, [%fp-2]
	b	.L21
	 nop
.L22:
	.loc 1 105 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-776], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-264], %g1
	sth	%g1, [%g2]
	.loc 1 106 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-776], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-520], %g1
	sth	%g1, [%g2]
	.loc 1 104 0 discriminator 2
	lduh	[%fp-2], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-2]
.L21:
	.loc 1 104 0 is_stmt 0 discriminator 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 127
	bleu	.L22
	 nop
	.loc 1 123 0 is_stmt 1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE8:
	.size	gen_tf, .-gen_tf
	.align 4
	.global ntt_256
	.type	ntt_256, #function
	.proc	020
ntt_256:
.LFB9:
	.loc 1 126 0
	.cfi_startproc
	save	%sp, -616, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 129 0
	sth	%g0, [%fp-2]
	b	.L24
	 nop
.L25:
	.loc 1 130 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	lduh	[%fp-2], %g2
	sll	%g2, 16, %g2
	srl	%g2, 16, %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	lduh	[%g2], %g2
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	sth	%g2, [%g1-258]
	.loc 1 131 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	lduh	[%fp-2], %g2
	sll	%g2, 16, %g2
	srl	%g2, 16, %g2
	sll	%g2, 2, %g2
	add	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	lduh	[%g2], %g2
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	sth	%g2, [%g1-514]
	.loc 1 129 0 discriminator 2
	lduh	[%fp-2], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-2]
.L24:
	.loc 1 129 0 is_stmt 0 discriminator 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 127
	bleu	.L25
	 nop
	.loc 1 133 0 is_stmt 1
	add	%fp, -258, %g1
	mov	%g1, %o0
	ld	[%fp+72], %o1
	call	ct_ntt, 0
	 nop
	.loc 1 134 0
	add	%fp, -514, %g1
	mov	%g1, %o0
	ld	[%fp+72], %o1
	call	ct_ntt, 0
	 nop
	.loc 1 135 0
	sth	%g0, [%fp-2]
	b	.L26
	 nop
.L27:
	.loc 1 136 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-258], %g1
	sth	%g1, [%g2]
	.loc 1 137 0 discriminator 2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, 128, %g1
	add	%g1, %g1, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g2
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	add	%g1, %g1, %g1
	add	%fp, %g1, %g1
	lduh	[%g1-514], %g1
	sth	%g1, [%g2]
	.loc 1 135 0 discriminator 2
	lduh	[%fp-2], %g1
	add	%g1, 1, %g1
	sth	%g1, [%fp-2]
.L26:
	.loc 1 135 0 is_stmt 0 discriminator 1
	lduh	[%fp-2], %g1
	sll	%g1, 16, %g1
	srl	%g1, 16, %g1
	cmp	%g1, 127
	bleu	.L27
	 nop
	.loc 1 140 0 is_stmt 1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE9:
	.size	ntt_256, .-ntt_256
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x473
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF35
	.byte	0x1
	.uaword	.LASF36
	.uaword	.LASF37
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
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF3
	.uleb128 0x4
	.uaword	.LASF6
	.byte	0x2
	.byte	0x31
	.uaword	0x53
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF5
	.uleb128 0x4
	.uaword	.LASF7
	.byte	0x2
	.byte	0x37
	.uaword	0x6c
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF11
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF12
	.uleb128 0x5
	.uaword	0x33
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.uaword	.LASF13
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.uaword	.LASF14
	.uleb128 0x6
	.byte	0x1
	.uaword	.LASF17
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.uaword	0x48
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xf9
	.uleb128 0x7
	.asciz	"num"
	.byte	0x1
	.byte	0x19
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF15
	.byte	0x1
	.byte	0x19
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0x1a
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0xa
	.asciz	"i"
	.byte	0x1
	.byte	0x1b
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.uaword	.LASF18
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.uaword	0x48
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x171
	.uleb128 0x7
	.asciz	"c1"
	.byte	0x1
	.byte	0x24
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.asciz	"p"
	.byte	0x1
	.byte	0x25
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.asciz	"m"
	.byte	0x1
	.byte	0x26
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x28
	.uaword	0x61
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.asciz	"t"
	.byte	0x1
	.byte	0x29
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xa
	.asciz	"ta"
	.byte	0x1
	.byte	0x2a
	.uaword	0x61
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.asciz	"c"
	.byte	0x1
	.byte	0x2b
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.uaword	.LASF22
	.byte	0x1
	.byte	0x32
	.byte	0x1
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x204
	.uleb128 0x7
	.asciz	"s"
	.byte	0x1
	.byte	0x32
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.asciz	"i"
	.byte	0x1
	.byte	0x32
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x7
	.asciz	"l"
	.byte	0x1
	.byte	0x32
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x7
	.asciz	"v"
	.byte	0x1
	.byte	0x32
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x8
	.uaword	.LASF20
	.byte	0x1
	.byte	0x32
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x8
	.uaword	.LASF21
	.byte	0x1
	.byte	0x32
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0x7
	.asciz	"iw"
	.byte	0x1
	.byte	0x32
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0xa
	.asciz	"j"
	.byte	0x1
	.byte	0x33
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0xa
	.asciz	"z"
	.byte	0x1
	.byte	0x34
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.uaword	0x48
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0x3b
	.byte	0x1
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x273
	.uleb128 0x7
	.asciz	"w"
	.byte	0x1
	.byte	0x3b
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.asciz	"u"
	.byte	0x1
	.byte	0x3b
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x7
	.asciz	"v"
	.byte	0x1
	.byte	0x3b
	.uaword	0x48
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x7
	.asciz	"x"
	.byte	0x1
	.byte	0x3b
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x7
	.asciz	"y"
	.byte	0x1
	.byte	0x3b
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xa
	.asciz	"v1"
	.byte	0x1
	.byte	0x3c
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF24
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x347
	.uleb128 0x7
	.asciz	"a"
	.byte	0x1
	.byte	0x42
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF25
	.byte	0x1
	.byte	0x42
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xa
	.asciz	"l"
	.byte	0x1
	.byte	0x44
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0xa
	.asciz	"v"
	.byte	0x1
	.byte	0x45
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.asciz	"i"
	.byte	0x1
	.byte	0x46
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0xa
	.asciz	"s"
	.byte	0x1
	.byte	0x46
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.uaword	.LBB2
	.uaword	.LBE2
	.uleb128 0xa
	.asciz	"ie"
	.byte	0x1
	.byte	0x49
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.asciz	"io"
	.byte	0x1
	.byte	0x49
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xa
	.asciz	"iw"
	.byte	0x1
	.byte	0x49
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.asciz	"S"
	.byte	0x1
	.byte	0x4b
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0xa
	.asciz	"U"
	.byte	0x1
	.byte	0x4c
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.asciz	"V"
	.byte	0x1
	.byte	0x4d
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0xa
	.asciz	"x"
	.byte	0x1
	.byte	0x4e
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0xa
	.asciz	"y"
	.byte	0x1
	.byte	0x4e
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF26
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x3e3
	.uleb128 0x8
	.uaword	.LASF25
	.byte	0x1
	.byte	0x58
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF27
	.byte	0x1
	.byte	0x58
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0x59
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x9
	.uaword	.LASF28
	.byte	0x1
	.byte	0x5a
	.uaword	0x3e3
	.byte	0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x9
	.uaword	.LASF29
	.byte	0x1
	.byte	0x5a
	.uaword	0x3e3
	.byte	0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0x9
	.uaword	.LASF30
	.byte	0x1
	.byte	0x5a
	.uaword	0x3e3
	.byte	0x3
	.byte	0x91
	.sleb128 -776
	.uleb128 0xa
	.asciz	"x"
	.byte	0x1
	.byte	0x5b
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.uleb128 0xa
	.asciz	"psi"
	.byte	0x1
	.byte	0x60
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x9
	.uaword	.LASF31
	.byte	0x1
	.byte	0x60
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.byte	0
	.uleb128 0xf
	.uaword	0x48
	.uaword	0x3f3
	.uleb128 0x10
	.uaword	0x81
	.byte	0x7f
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF32
	.byte	0x1
	.byte	0x7e
	.byte	0x1
	.uaword	.LFB9
	.uaword	.LFE9
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x452
	.uleb128 0x7
	.asciz	"x"
	.byte	0x1
	.byte	0x7e
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x8
	.uaword	.LASF25
	.byte	0x1
	.byte	0x7e
	.uaword	0x204
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xa
	.asciz	"xe"
	.byte	0x1
	.byte	0x7f
	.uaword	0x3e3
	.byte	0x3
	.byte	0x91
	.sleb128 -258
	.uleb128 0xa
	.asciz	"xo"
	.byte	0x1
	.byte	0x7f
	.uaword	0x3e3
	.byte	0x3
	.byte	0x91
	.sleb128 -514
	.uleb128 0xa
	.asciz	"i"
	.byte	0x1
	.byte	0x80
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -2
	.byte	0
	.uleb128 0x11
	.uaword	.LASF33
	.byte	0x1
	.byte	0x16
	.uaword	0x8f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	done_0
	.uleb128 0x11
	.uaword	.LASF34
	.byte	0x1
	.byte	0x16
	.uaword	0x8f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	done_1
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LFB3-.Ltext0
	.uaword	.LCFI0-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI0-.Ltext0
	.uaword	.LFE3-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LFB4-.Ltext0
	.uaword	.LCFI1-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI1-.Ltext0
	.uaword	.LFE4-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST2:
	.uaword	.LFB5-.Ltext0
	.uaword	.LCFI2-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI2-.Ltext0
	.uaword	.LFE5-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST3:
	.uaword	.LFB6-.Ltext0
	.uaword	.LCFI3-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI3-.Ltext0
	.uaword	.LFE6-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST4:
	.uaword	.LFB7-.Ltext0
	.uaword	.LCFI4-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI4-.Ltext0
	.uaword	.LFE7-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST5:
	.uaword	.LFB8-.Ltext0
	.uaword	.LCFI5-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI5-.Ltext0
	.uaword	.LFE8-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST6:
	.uaword	.LFB9-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE9-.Ltext0
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
.LASF20:
	.asciz	"ie_r"
.LASF23:
	.asciz	"butterfly_dit"
.LASF7:
	.asciz	"uint64_t"
.LASF1:
	.asciz	"short int"
.LASF19:
	.asciz	"t123"
.LASF16:
	.asciz	"rev_num"
.LASF30:
	.asciz	"positions"
.LASF24:
	.asciz	"ct_ntt"
.LASF27:
	.asciz	"inv_psis"
.LASF22:
	.asciz	"addr_gen"
.LASF32:
	.asciz	"ntt_256"
.LASF13:
	.asciz	"float"
.LASF2:
	.asciz	"long long int"
.LASF18:
	.asciz	"barret_reduction"
.LASF10:
	.asciz	"long int"
.LASF3:
	.asciz	"unsigned char"
.LASF0:
	.asciz	"signed char"
.LASF8:
	.asciz	"long long unsigned int"
.LASF5:
	.asciz	"unsigned int"
.LASF6:
	.asciz	"uint16_t"
.LASF35:
	.asciz	"GNU C 4.7.4"
.LASF4:
	.asciz	"short unsigned int"
.LASF12:
	.asciz	"char"
.LASF36:
	.asciz	"../NTT.c"
.LASF28:
	.asciz	"tmp1"
.LASF29:
	.asciz	"tmp2"
.LASF15:
	.asciz	"logn"
.LASF9:
	.asciz	"long unsigned int"
.LASF14:
	.asciz	"double"
.LASF17:
	.asciz	"bit_reverse"
.LASF21:
	.asciz	"io_r"
.LASF37:
	.asciz	"/Satvik/fft/cortos_build"
.LASF25:
	.asciz	"psis"
.LASF31:
	.asciz	"inv_psi"
.LASF11:
	.asciz	"sizetype"
.LASF26:
	.asciz	"gen_tf"
.LASF33:
	.asciz	"done_0"
.LASF34:
	.asciz	"done_1"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
