	.file	"NTT.c"
	.section	".text"
	.align 4
	.global bit_reverse
	.type	bit_reverse, #function
	.proc	016
bit_reverse:
	cmp	%o1, 0
	be	.L5
	 mov	0, %g1
	mov	0, %g3
	add	%o1, -1, %o5
	mov	1, %g4
	srl	%o0, %g1, %g2
.L12:
	andcc	%g2, 1, %g0
	be,a	.L11
	 add	%g1, 1, %g1
	sub	%o5, %g1, %g2
	sll	%g4, %g2, %g2
	or	%g3, %g2, %g3
	add	%g1, 1, %g1
.L11:
	cmp	%g1, %o1
	bne	.L12
	 srl	%o0, %g1, %g2
.L2:
	jmp	%o7+8
	 mov	%g3, %o0
.L5:
	b	.L2
	 mov	0, %g3
	.size	bit_reverse, .-bit_reverse
	.align 4
	.global barret_reduction
	.type	barret_reduction, #function
	.proc	016
barret_reduction:
	jmp	%o7+8
	 nop
	.size	barret_reduction, .-barret_reduction
	.align 4
	.global addr_gen
	.type	addr_gen, #function
	.proc	020
addr_gen:
	sub	%o2, %o1, %o2
	srl	%o3, %o1, %o3
	add	%o2, -1, %g2
	add	%o3, -1, %o3
	srl	%o0, %g2, %g1
	and	%o3, %o0, %o0
	sll	%g1, %o2, %o2
	add	%o2, %o0, %o2
	st	%o2, [%o4]
	mov	1, %g3
	sll	%g3, %g2, %g2
	add	%o2, %g2, %o2
	st	%o2, [%o5]
	sll	%g3, %o1, %o1
	ld	[%sp+92], %g2
	add	%g1, %o1, %g1
	jmp	%o7+8
	 st	%g1, [%g2]
	.size	addr_gen, .-addr_gen
	.global __umoddi3
	.align 4
	.global butterfly_dit
	.type	butterfly_dit, #function
	.proc	020
butterfly_dit:
	save	%sp, -96, %sp
	mov	0, %o2
	umul	%i2, %i0, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%o1, %i1, %g1
	add	%i1, 3329, %i1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, 3329, %g2
	smul	%g2, 3329, %g2
	sub	%g1, %g2, %g1
	st	%g1, [%i3]
	sub	%i1, %o1, %o1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%o1, 3329, %i1
	smul	%i1, 3329, %i1
	sub	%o1, %i1, %o1
	st	%o1, [%i4]
	jmp	%i7+8
	 restore
	.size	butterfly_dit, .-butterfly_dit
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.asciz	"ct_ntt started execution\n"
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1080033280
	.long	0
	.align 8
.LC2:
	.long	1105199104
	.long	0
	.section	".text"
	.align 4
	.global ct_ntt
	.type	ct_ntt, #function
	.proc	020
ct_ntt:
	save	%sp, -104, %sp
	sethi	%hi(.LC0), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC0), %o0
	sethi	%hi(.LC1), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC1)], %o0
	sethi	%hi(.LC2), %g1
	ldd	[%g1+%lo(.LC2)], %f8
	fcmped	%f0, %f8
	nop
	fbge	.L17
	 sethi	%hi(-2147483648), %g1
	fdtoi	%f0, %f8
	st	%f8, [%fp-8]
	ld	[%fp-8], %l4
	add	%l4, -1, %g1
	st	%g1, [%fp-4]
	mov	0, %l3
	cmp	%l4, 0
	be	.L28
	 mov	1, %l5
.L24:
	ld	[%fp-4], %g1
.L26:
	sub	%l4, %l3, %l2
	sub	%g1, %l3, %i3
	sll	%l5, %l3, %i2
	mov	64, %g1
	sll	%l5, %i3, %l0
	srl	%g1, %l3, %l1
	mov	0, %i5
	add	%l1, -1, %l1
.L20:
	and	%i5, %l1, %g2
	srl	%i5, %i3, %g1
	sll	%g1, %l2, %i4
	add	%g1, %i2, %g1
	sll	%g1, 2, %g1
	ld	[%i1+%g1], %g3
	add	%i4, %g2, %i4
	mov	0, %o2
	sll	%i4, 2, %l7
	add	%i4, %l0, %i4
	sll	%i4, 2, %i4
	ld	[%i0+%i4], %o0
	umul	%o0, %g3, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	ld	[%i0+%l7], %l6
	add	%o1, %l6, %g3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g3, 3329, %g4
	smul	%g4, 3329, %g4
	sub	%g3, %g4, %g3
	st	%g3, [%i0+%l7]
	add	%l6, 3329, %g1
	sub	%g1, %o1, %g1
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g1, 3329, %g2
	smul	%g2, 3329, %g2
	sub	%g1, %g2, %g1
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L20
	 st	%g1, [%i0+%i4]
	add	%l3, 1, %l3
	cmp	%l3, %l4
	bne	.L26
	 ld	[%fp-4], %g1
.L28:
	jmp	%i7+8
	 restore
.L17:
	fsubd	%f0, %f8, %f8
	fdtoi	%f8, %f10
	st	%f10, [%fp-8]
	ld	[%fp-8], %l4
	xor	%l4, %g1, %l4
	add	%l4, -1, %g1
	st	%g1, [%fp-4]
	mov	0, %l3
	cmp	%l4, 0
	bne	.L24
	 mov	1, %l5
	jmp	%i7+8
	 restore
	.size	ct_ntt, .-ct_ntt
	.section	.rodata.cst8
	.align 8
.LC3:
	.long	1080033280
	.long	0
	.align 8
.LC4:
	.long	1105199104
	.long	0
	.section	".text"
	.align 4
	.global gen_tf
	.type	gen_tf, #function
	.proc	020
gen_tf:
	save	%sp, -1640, %sp
	sethi	%hi(.LC3), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC3)], %o0
	sethi	%hi(.LC4), %g1
	ldd	[%g1+%lo(.LC4)], %f8
	fcmped	%f0, %f8
	nop
	fbge,a	.L30
	 fsubd	%f0, %f8, %f8
	fdtoi	%f0, %f8
	st	%f8, [%fp-1540]
	ld	[%fp-1540], %i5
.L31:
	mov	0, %g3
	add	%fp, -512, %i2
	add	%i5, -1, %i3
	mov	1, %i4
.L32:
	mov	0, %g4
	cmp	%i5, 0
	be	.L47
	 mov	0, %g1
	srl	%g3, %g1, %g2
.L50:
	andcc	%g2, 1, %g0
	be,a	.L49
	 add	%g1, 1, %g1
	sub	%i3, %g1, %g2
	sll	%i4, %g2, %g2
	or	%g4, %g2, %g4
	add	%g1, 1, %g1
.L49:
	cmp	%g1, %i5
	bne	.L50
	 srl	%g3, %g1, %g2
	sll	%g3, 2, %g1
	add	%g3, 1, %g3
	cmp	%g3, 128
	bne	.L32
	 st	%g4, [%i2+%g1]
	mov	0, %i4
.L48:
	mov	1, %i3
	mov	1, %i5
	add	%fp, -1536, %l1
	add	%fp, -1024, %l0
.L35:
	st	%i3, [%l0+%i4]
	st	%i5, [%l1+%i4]
	mov	0, %o2
	mov	3329, %o3
	srl	%i5, 28, %o0
	sll	%i5, 4, %o1
	addcc	%o1, %i5, %o1
	call	__umoddi3, 0
	 addx	%o0, 0, %o0
	mov	0, %o2
	mov	%o1, %i5
	umul	%i3, 1175, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%i4, 4, %i4
	cmp	%i4, 512
	bne	.L35
	 mov	%o1, %i3
	mov	0, %g1
	ld	[%i2+%g1], %g2
.L51:
	sll	%g2, 2, %g2
	add	%fp, %g2, %g2
	ld	[%g2-1536], %g3
	st	%g3, [%i0+%g1]
	ld	[%g2-1024], %g2
	st	%g2, [%i1+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne,a	.L51
	 ld	[%i2+%g1], %g2
	jmp	%i7+8
	 restore
.L47:
	sll	%g3, 2, %g1
	mov	%i5, %g4
	add	%g3, 1, %g3
	cmp	%g3, 128
	bne	.L32
	 st	%g4, [%i2+%g1]
	b	.L48
	 mov	0, %i4
.L30:
	sethi	%hi(-2147483648), %g1
	fdtoi	%f8, %f10
	st	%f10, [%fp-1540]
	ld	[%fp-1540], %i5
	b	.L31
	 xor	%i5, %g1, %i5
	.size	gen_tf, .-gen_tf
	.align 4
	.global ntt_256
	.type	ntt_256, #function
	.proc	020
ntt_256:
	save	%sp, -1120, %sp
	mov	0, %g1
	mov	%i0, %g2
	add	%fp, -1024, %i4
	add	%fp, -512, %i5
.L53:
	ld	[%g2], %g4
	ld	[%g2+4], %g3
	st	%g4, [%i4+%g1]
	st	%g3, [%i5+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L53
	 add	%g2, 8, %g2
	mov	%i4, %o0
	call	ct_ntt, 0
	 mov	%i1, %o1
	mov	%i5, %o0
	call	ct_ntt, 0
	 mov	%i1, %o1
	mov	0, %g1
.L54:
	ld	[%i4+%g1], %g2
	st	%g2, [%i0+%g1]
	ld	[%i5+%g1], %g3
	add	%i0, %g1, %g2
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L54
	 st	%g3, [%g2+512]
	jmp	%i7+8
	 restore
	.size	ntt_256, .-ntt_256
	.global done_1
	.section	".bss"
	.align 4
	.type	done_1, #object
	.size	done_1, 4
done_1:
	.skip	4
	.global done_0
	.align 4
	.type	done_0, #object
	.size	done_0, 4
done_0:
	.skip	4
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
