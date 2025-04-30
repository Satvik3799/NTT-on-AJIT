	.file	"cortos_queues.c"
	.section	".text"
	.align 4
	.global cortos_reserveQueue
	.type	cortos_reserveQueue, #function
	.proc	0110
cortos_reserveQueue:
	save	%sp, -96, %sp
	smul	%i1, %i0, %o0
	cmp	%i2, 0
	be	.L2
	 add	%o0, 48, %o0
	call	cortos_bget_ncram, 0
	 nop
	mov	%o0, %i4
.L3:
	cmp	%i4, 0
	be	.L5
	 mov	16, %g2
	and	%i4, 15, %g1
	sub	%g2, %g1, %g1
	mov	1, %o0
	add	%i4, %g1, %i5
	st	%g0, [%i4+%g1]
	st	%g0, [%i5+4]
	st	%g0, [%i5+8]
	st	%i0, [%i5+16]
	call	cortos_reserveLock, 0
	 st	%i1, [%i5+12]
	st	%i4, [%i5+24]
	st	%o0, [%i5+20]
	st	%g0, [%i5+28]
.L4:
	jmp	%i7+8
	 restore %g0, %i5, %o0
.L2:
	call	cortos_bget, 0
	 nop
	b	.L3
	 mov	%o0, %i4
.L5:
	b	.L4
	 mov	0, %i5
	.size	cortos_reserveQueue, .-cortos_reserveQueue
	.align 4
	.global cortos_freeQueue
	.type	cortos_freeQueue, #function
	.proc	020
cortos_freeQueue:
	save	%sp, -96, %sp
	call	cortos_freeLock, 0
	 ld	[%i0+20], %o0
	call	cortos_IsNcRamAddr, 0
	 mov	%i0, %o0
	andcc	%o0, 0xff, %g0
	bne	.L9
	 ld	[%i0+24], %i0
	call	cortos_brel, 0
	 restore
.L9:
	call	cortos_brel_ncram, 0
	 restore
	.size	cortos_freeQueue, .-cortos_freeQueue
	.align 4
	.global cortos_writeMessages
	.type	cortos_writeMessages, #function
	.proc	016
cortos_writeMessages:
	save	%sp, -96, %sp
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L66
	 nop
	ld	[%i0], %g1
	cmp	%g1, 0
	bne	.L20
	 mov	0, %i5
.L12:
	ld	[%i0+8], %i4
	ld	[%i0+12], %o7
	ld	[%i0+16], %g3
	cmp	%i2, 0
	be	.L14
	 add	%i0, 32, %o4
	cmp	%o7, %i5
	bleu	.L21
	 mov	%i2, %i3
.L18:
	smul	%i4, %g3, %g1
	cmp	%g3, 0
	be	.L17
	 add	%o4, %g1, %g2
	ldub	[%i1], %g4
	stb	%g4, [%o4+%g1]
	add	%g3, -1, %o0
	mov	1, %g1
	cmp	%g1, %g3
	be	.L17
	 and	%o0, 7, %o1
	cmp	%o1, 0
	be	.L25
	 cmp	%o1, 1
	be	.L52
	 cmp	%o1, 2
	be	.L53
	 cmp	%o1, 3
	be	.L54
	 cmp	%o1, 4
	be	.L55
	 cmp	%o1, 5
	be	.L56
	 cmp	%o1, 6
	be,a	.L68
	 ldub	[%i1+%g1], %o3
	ldub	[%i1+%g1], %o2
	stb	%o2, [%g2+%g1]
	mov	2, %g1
	ldub	[%i1+%g1], %o3
.L68:
	stb	%o3, [%g2+%g1]
	add	%g1, 1, %g1
.L56:
	ldub	[%i1+%g1], %o5
	stb	%o5, [%g2+%g1]
	add	%g1, 1, %g1
.L55:
	ldub	[%i1+%g1], %g4
	stb	%g4, [%g2+%g1]
	add	%g1, 1, %g1
.L54:
	ldub	[%i1+%g1], %o0
	stb	%o0, [%g2+%g1]
	add	%g1, 1, %g1
.L53:
	ldub	[%i1+%g1], %o1
	stb	%o1, [%g2+%g1]
	add	%g1, 1, %g1
.L52:
	ldub	[%i1+%g1], %o2
	stb	%o2, [%g2+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	be,a	.L69
	 add	%i4, 1, %g2
.L25:
	ldub	[%i1+%g1], %o3
	stb	%o3, [%g2+%g1]
	add	%g1, 1, %g4
	ldub	[%i1+%g4], %o5
	stb	%o5, [%g2+%g4]
	add	%g1, 2, %o0
	ldub	[%i1+%o0], %o1
	stb	%o1, [%g2+%o0]
	add	%g1, 3, %o2
	ldub	[%i1+%o2], %o3
	stb	%o3, [%g2+%o2]
	add	%g1, 4, %g4
	ldub	[%i1+%g4], %o5
	stb	%o5, [%g2+%g4]
	add	%g1, 5, %o0
	ldub	[%i1+%o0], %o1
	stb	%o1, [%g2+%o0]
	add	%g1, 6, %o2
	ldub	[%i1+%o2], %o3
	stb	%o3, [%g2+%o2]
	add	%g1, 7, %g4
	ldub	[%i1+%g4], %o5
	add	%g1, 8, %g1
	cmp	%g1, %g3
	bne	.L25
	 stb	%o5, [%g2+%g4]
.L17:
	add	%i4, 1, %g2
.L69:
	add	%i5, 1, %i5
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g2, %o7, %g1
	addcc	%i3, -1, %i3
	smul	%g1, %o7, %g1
	be	.L14
	 sub	%g2, %g1, %i4
	ld	[%i0+12], %g1
	cmp	%g1, %i5
	bgu	.L18
	 add	%i1, %g3, %i1
	sub	%i2, %i3, %i2
.L14:
	st	%i4, [%i0+8]
	st	%i5, [%i0]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be,a	.L67
	 ld	[%i0+20], %o0
	jmp	%i7+8
	 restore %g0, %i2, %o0
.L20:
	mov	0, %i2
	jmp	%i7+8
	 restore %g0, %i2, %o0
.L66:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	b	.L12
	 ld	[%i0], %i5
.L67:
	call	cortos_lock_release, 0
	 mov	%i2, %i0
	jmp	%i7+8
	 restore
.L21:
	b	.L14
	 mov	0, %i2
	.size	cortos_writeMessages, .-cortos_writeMessages
	.align 4
	.global cortos_readMessages
	.type	cortos_readMessages, #function
	.proc	016
cortos_readMessages:
	save	%sp, -96, %sp
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be	.L134
	 nop
	ld	[%i0], %i5
	cmp	%i5, 0
	be	.L73
	 mov	0, %i3
.L72:
	ld	[%i0+4], %i4
	ld	[%i0+12], %o7
	ld	[%i0+16], %g3
	cmp	%i5, 0
	be	.L82
	 add	%i0, 32, %o4
	cmp	%i2, 0
	be	.L74
	 mov	0, %i3
	mov	%i2, %i3
	smul	%i4, %g3, %g1
.L138:
	cmp	%g3, 0
	be	.L79
	 add	%o4, %g1, %g2
	ldub	[%o4+%g1], %g1
	stb	%g1, [%i1]
	add	%g3, -1, %g4
	mov	1, %g1
	cmp	%g1, %g3
	be	.L79
	 and	%g4, 7, %o0
	cmp	%o0, 0
	be	.L90
	 cmp	%o0, 1
	be	.L117
	 cmp	%o0, 2
	be	.L118
	 cmp	%o0, 3
	be	.L119
	 cmp	%o0, 4
	be	.L120
	 cmp	%o0, 5
	be	.L121
	 cmp	%o0, 6
	be,a	.L136
	 ldub	[%g2+%g1], %o2
	ldub	[%g2+%g1], %o1
	stb	%o1, [%i1+%g1]
	mov	2, %g1
	ldub	[%g2+%g1], %o2
.L136:
	stb	%o2, [%i1+%g1]
	add	%g1, 1, %g1
.L121:
	ldub	[%g2+%g1], %o3
	stb	%o3, [%i1+%g1]
	add	%g1, 1, %g1
.L120:
	ldub	[%g2+%g1], %o5
	stb	%o5, [%i1+%g1]
	add	%g1, 1, %g1
.L119:
	ldub	[%g2+%g1], %g4
	stb	%g4, [%i1+%g1]
	add	%g1, 1, %g1
.L118:
	ldub	[%g2+%g1], %o0
	stb	%o0, [%i1+%g1]
	add	%g1, 1, %g1
.L117:
	ldub	[%g2+%g1], %o1
	stb	%o1, [%i1+%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	be,a	.L137
	 add	%i4, 1, %g2
.L90:
	ldub	[%g2+%g1], %o2
	stb	%o2, [%i1+%g1]
	add	%g1, 1, %o3
	ldub	[%g2+%o3], %o5
	stb	%o5, [%i1+%o3]
	add	%g1, 2, %g4
	ldub	[%g2+%g4], %o0
	stb	%o0, [%i1+%g4]
	add	%g1, 3, %o1
	ldub	[%g2+%o1], %o2
	stb	%o2, [%i1+%o1]
	add	%g1, 4, %o3
	ldub	[%g2+%o3], %o5
	stb	%o5, [%i1+%o3]
	add	%g1, 5, %g4
	ldub	[%g2+%g4], %o0
	stb	%o0, [%i1+%g4]
	add	%g1, 6, %o1
	ldub	[%g2+%o1], %o2
	stb	%o2, [%i1+%o1]
	add	%g1, 7, %o3
	ldub	[%g2+%o3], %o5
	add	%g1, 8, %g1
	cmp	%g1, %g3
	bne	.L90
	 stb	%o5, [%i1+%o3]
.L79:
	add	%i4, 1, %g2
.L137:
	add	%i3, -1, %i3
	wr	%g0, 0, %y
	nop
	nop
	nop
	udiv	%g2, %o7, %g1
	add	%i1, %g3, %i1
	smul	%g1, %o7, %g1
	addcc	%i5, -1, %i5
	be	.L78
	 sub	%g2, %g1, %i4
	cmp	%i3, 0
	bne	.L138
	 smul	%i4, %g3, %g1
.L78:
	sub	%i2, %i3, %i3
.L74:
	st	%i4, [%i0+4]
	st	%i5, [%i0]
	ld	[%i0+28], %g1
	andcc	%g1, 1, %g0
	be,a	.L135
	 ld	[%i0+20], %o0
.L73:
	jmp	%i7+8
	 restore %g0, %i3, %o0
.L134:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i0+20], %o0
	b	.L72
	 ld	[%i0], %i5
.L135:
	call	cortos_lock_release, 0
	 mov	%i3, %i0
	jmp	%i7+8
	 restore
.L82:
	b	.L74
	 mov	0, %i3
	.size	cortos_readMessages, .-cortos_readMessages
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
