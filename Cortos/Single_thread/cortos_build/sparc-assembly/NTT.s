	.file	"NTT.c"
	.section	".text"
	.align 4
	.global bit_reverse
	.type	bit_reverse, #function
	.proc	015
bit_reverse:
	cmp	%o1, 0
	be	.L5
	 andcc	%o0, 1, %g0
	add	%o1, -1, %g3
	mov	0, %g2
	mov	1, %g4
	bne	.L43
	 and	%g3, 3, %o5
.L9:
	cmp	%o1, 1
	bleu	.L2
	 mov	1, %g1
	cmp	%o5, 0
	be	.L4
	 cmp	%o5, 1
	be	.L27
	 cmp	%o5, 2
	be	.L46
	 sra	%o0, %g1, %o4
	andcc	%o0, 2, %g0
	bne	.L44
	 add	%g3, -1, %o4
.L11:
	add	%g1, 1, %g1
	sra	%o0, %g1, %o4
.L46:
	andcc	%o4, 1, %g0
	bne	.L45
	 sub	%g3, %g1, %o5
.L14:
	add	%g1, 1, %g1
.L27:
	sra	%o0, %g1, %o5
	andcc	%o5, 1, %g0
	be,a	.L47
	 add	%g1, 1, %g1
	sub	%g3, %g1, %o4
	sll	%g4, %o4, %o5
	or	%o5, %g2, %g2
	add	%g1, 1, %g1
.L47:
	sll	%g1, 16, %o4
	srl	%o4, 16, %o5
	cmp	%o1, %o5
	bleu,a	.L48
	 sll	%g2, 16, %o0
.L4:
	sra	%o0, %g1, %o4
.L53:
	andcc	%o4, 1, %g0
	be,a	.L49
	 add	%g1, 1, %g1
	sub	%g3, %g1, %o5
	sll	%g4, %o5, %o4
	or	%o4, %g2, %g2
	add	%g1, 1, %g1
.L49:
	sra	%o0, %g1, %o5
	andcc	%o5, 1, %g0
	be	.L50
	 add	%g1, 1, %o5
	sub	%g3, %g1, %o4
	sll	%g4, %o4, %o5
	or	%o5, %g2, %g2
	add	%g1, 1, %o5
.L50:
	sra	%o0, %o5, %o4
	andcc	%o4, 1, %g0
	be,a	.L51
	 add	%g1, 2, %o5
	sub	%g3, %o5, %o5
	sll	%g4, %o5, %o4
	or	%o4, %g2, %g2
	add	%g1, 2, %o5
.L51:
	sra	%o0, %o5, %o4
	andcc	%o4, 1, %g0
	be	.L52
	 add	%g1, 3, %g1
	sub	%g3, %o5, %o5
	sll	%g4, %o5, %o4
	or	%o4, %g2, %g2
.L52:
	sll	%g1, 16, %o5
	srl	%o5, 16, %o4
	cmp	%o1, %o4
	bgu	.L53
	 sra	%o0, %g1, %o4
.L2:
	sll	%g2, 16, %o0
.L48:
	jmp	%o7+8
	 srl	%o0, 16, %o0
.L43:
	b	.L9
	 sll	%g4, %g3, %g2
.L45:
	sll	%g4, %o5, %o4
	b	.L14
	 or	%o4, %g2, %g2
.L44:
	sll	%g4, %o4, %o5
	b	.L11
	 or	%o5, %g2, %g2
.L5:
	b	.L2
	 mov	0, %g2
	.size	bit_reverse, .-bit_reverse
	.align 4
	.global barret_reduction
	.type	barret_reduction, #function
	.proc	015
barret_reduction:
	jmp	%o7+8
	 nop
	.size	barret_reduction, .-barret_reduction
	.align 4
	.global addr_gen
	.type	addr_gen, #function
	.proc	020
addr_gen:
	sub	%o2, %o1, %g1
	add	%o2, -1, %o2
	sra	%o3, %o1, %o3
	sub	%o2, %o1, %g2
	add	%o3, -1, %g3
	sra	%o0, %g2, %g4
	sethi	%hi(64512), %o2
	or	%o2, 1023, %g2
	and	%g4, %g2, %o3
	and	%o0, %g3, %g4
	sll	%o3, %g1, %g3
	add	%g3, %g4, %o2
	sth	%o2, [%o4]
	add	%g1, -1, %g1
	mov	1, %o4
	sll	%o4, %g1, %g2
	add	%o2, %g2, %o3
	sth	%o3, [%o5]
	sra	%o0, %g1, %g1
	sll	%o4, %o1, %o1
	ld	[%sp+92], %o0
	add	%g1, %o1, %g1
	jmp	%o7+8
	 sth	%g1, [%o0]
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
	add	%i1, %o1, %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 3329, %g2
	smul	%g2, 3329, %g3
	sub	%g1, %g3, %g1
	sth	%g1, [%i3]
	sub	%i1, %o1, %i1
	add	%i1, 3329, %g4
	sra	%g4, 31, %g1
	wr	%g1, 0, %y
	nop
	nop
	nop
	sdiv	%g4, 3329, %o1
	smul	%o1, 3329, %o0
	sub	%g4, %o0, %o2
	sth	%o2, [%i4]
	jmp	%i7+8
	 restore
	.size	butterfly_dit, .-butterfly_dit
	.section	.rodata.cst8,"aM",@progbits,8
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
	save	%sp, -104, %sp
	sethi	%hi(.LC0), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC0)], %o0
	fdtoi	%f0, %f0
	st	%f0, [%fp-8]
	ld	[%fp-8], %g1
	sll	%g1, 16, %l6
	srl	%l6, 16, %g2
	cmp	%g2, 0
	be	.L66
	 sethi	%hi(64512), %l3
	add	%g2, -1, %i3
	mov	0, %l4
	mov	1, %l5
	or	%l3, 1023, %l3
	st	%g2, [%fp-4]
.L60:
	mov	64, %g3
	add	%i3, 1, %l2
	sra	%g3, %l4, %l1
	sll	%l5, %i3, %l0
	add	%l1, -1, %l1
	sll	%l5, %l4, %i2
	mov	0, %i5
.L59:
	sra	%i5, %i3, %g1
	and	%g1, %l3, %i4
	and	%i5, %l1, %g4
	sll	%i4, %l2, %o0
	add	%g1, %i2, %g1
	add	%o0, %g4, %o1
	sll	%g1, 16, %g1
	sll	%o1, 16, %o2
	srl	%g1, 15, %g1
	add	%o1, %l0, %o3
	lduh	[%i1+%g1], %o4
	sll	%o3, 16, %o5
	srl	%o5, 15, %i4
	lduh	[%i0+%i4], %o7
	srl	%o2, 15, %l7
	mov	3329, %o3
	umul	%o7, %o4, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	0, %o2
	lduh	[%i0+%l7], %l6
	add	%l6, %o1, %g3
	sra	%g3, 31, %g2
	wr	%g2, 0, %y
	nop
	nop
	nop
	sdiv	%g3, 3329, %g4
	smul	%g4, 3329, %g2
	sub	%g3, %g2, %o0
	sth	%o0, [%i0+%l7]
	sub	%l6, %o1, %g1
	add	%g1, 3329, %g1
	sra	%g1, 31, %g3
	wr	%g3, 0, %y
	nop
	nop
	nop
	sdiv	%g1, 3329, %o1
	smul	%o1, 3329, %o2
	sub	%g1, %o2, %g1
	add	%i5, 1, %i5
	cmp	%i5, 64
	bne	.L59
	 sth	%g1, [%i0+%i4]
	add	%l4, 1, %l4
	ld	[%fp-4], %l2
	sll	%l4, 16, %g1
	srl	%g1, 16, %g1
	cmp	%l2, %g1
	bgu	.L60
	 add	%i3, -1, %i3
.L66:
	jmp	%i7+8
	 restore
	.size	ct_ntt, .-ct_ntt
	.section	.rodata.cst8
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
	save	%sp, -872, %sp
	sethi	%hi(.LC1), %g1
	call	log2, 0
	 ldd	[%g1+%lo(.LC1)], %o0
	add	%fp, -256, %l0
	fdtoi	%f0, %f0
	mov	0, %g2
	st	%f0, [%fp-772]
	mov	1, %i5
	ld	[%fp-772], %i4
	sll	%i4, 16, %g3
	srl	%g3, 16, %o0
	add	%o0, -1, %g4
.L71:
	cmp	%o0, 0
	be	.L74
	 add	%o0, -1, %i3
	mov	0, %g3
	andcc	%g2, 1, %g0
	be	.L91
	 and	%i3, 3, %o1
	sll	%i5, %g4, %g3
.L91:
	cmp	%o0, 1
	bleu	.L68
	 mov	1, %g1
	cmp	%o1, 0
	be	.L70
	 cmp	%o1, 1
	be	.L109
	 cmp	%o1, 2
	be	.L126
	 sra	%g2, %g1, %o4
	andcc	%g2, 2, %g0
	be	.L127
	 add	%g1, 1, %g1
	add	%g4, -1, %o2
	sll	%i5, %o2, %o3
	or	%o3, %g3, %g3
.L127:
	sra	%g2, %g1, %o4
.L126:
	andcc	%o4, 1, %g0
	be,a	.L109
	 add	%g1, 1, %g1
	sub	%g4, %g1, %o5
	sll	%i5, %o5, %o7
	or	%o7, %g3, %g3
	add	%g1, 1, %g1
.L109:
	sra	%g2, %g1, %l1
	andcc	%l1, 1, %g0
	be,a	.L128
	 add	%g1, 1, %g1
	sub	%g4, %g1, %i2
	sll	%i5, %i2, %i4
	or	%i4, %g3, %g3
	add	%g1, 1, %g1
.L128:
	sll	%g1, 16, %i3
	srl	%i3, 16, %o1
	cmp	%o0, %o1
	bleu,a	.L129
	 add	%g2, %g2, %g1
.L70:
	sra	%g2, %g1, %o2
.L134:
	andcc	%o2, 1, %g0
	be,a	.L130
	 add	%g1, 1, %g1
	sub	%g4, %g1, %o3
	sll	%i5, %o3, %o4
	or	%o4, %g3, %g3
	add	%g1, 1, %g1
.L130:
	sra	%g2, %g1, %o5
	andcc	%o5, 1, %g0
	be	.L131
	 add	%g1, 1, %i4
	sub	%g4, %g1, %o7
	sll	%i5, %o7, %l1
	or	%l1, %g3, %g3
.L131:
	sra	%g2, %i4, %i2
	andcc	%i2, 1, %g0
	be	.L132
	 add	%g1, 2, %o2
	sub	%g4, %i4, %i3
	sll	%i5, %i3, %o1
	or	%o1, %g3, %g3
.L132:
	sra	%g2, %o2, %o3
	andcc	%o3, 1, %g0
	be	.L133
	 add	%g1, 3, %g1
	sub	%g4, %o2, %o4
	sll	%i5, %o4, %o5
	or	%o5, %g3, %g3
.L133:
	sll	%g1, 16, %o7
	srl	%o7, 16, %l1
	cmp	%o0, %l1
	bgu	.L134
	 sra	%g2, %g1, %o2
.L68:
	add	%g2, %g2, %g1
.L129:
	add	%g2, 1, %g2
	cmp	%g2, 128
	bne	.L71
	 sth	%g3, [%l0+%g1]
	mov	0, %i5
.L125:
	mov	1, %l1
	mov	1, %i2
	add	%fp, -768, %i3
	add	%fp, -512, %i4
.L72:
	sll	%i2, 16, %o0
	srl	%o0, 16, %g4
	sth	%i2, [%i3+%i5]
	sll	%g4, 4, %o1
	sth	%l1, [%i4+%i5]
	addcc	%o1, %g4, %o1
	mov	0, %o2
	mov	3329, %o3
	mov	0, %i2
	call	__umoddi3, 0
	 addx	%i2, 0, %o0
	sll	%l1, 16, %o4
	srl	%o4, 16, %o5
	mov	%o1, %i2
	mov	0, %o2
	umul	%o5, 1175, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%i5, 2, %g1
	mov	%i2, %g3
	mov	0, %g4
	sll	%g3, 16, %g2
	srl	%g2, 16, %o0
	sth	%i2, [%i3+%g1]
	sth	%o1, [%i4+%g1]
	mov	%o1, %l1
	mov	0, %o2
	mov	3329, %o3
	sll	%o0, 4, %o1
	addcc	%o1, %o0, %o1
	call	__umoddi3, 0
	 addx	%g4, 0, %o0
	sll	%l1, 16, %o4
	srl	%o4, 16, %o5
	mov	%o1, %i2
	mov	0, %o2
	umul	%o5, 1175, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%i5, 4, %g1
	mov	%i2, %g3
	mov	0, %g4
	sll	%g3, 16, %g2
	srl	%g2, 16, %o0
	sth	%i2, [%i3+%g1]
	sth	%o1, [%i4+%g1]
	mov	%o1, %l1
	mov	0, %o2
	mov	3329, %o3
	sll	%o0, 4, %o1
	addcc	%o1, %o0, %o1
	call	__umoddi3, 0
	 addx	%g4, 0, %o0
	sll	%l1, 16, %o4
	srl	%o4, 16, %o5
	mov	%o1, %i2
	mov	0, %o2
	umul	%o5, 1175, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%i5, 6, %g1
	mov	%i2, %g3
	mov	0, %g4
	sll	%g3, 16, %g2
	srl	%g2, 16, %o0
	mov	%o1, %l1
	sth	%i2, [%i3+%g1]
	sth	%o1, [%i4+%g1]
	mov	0, %o2
	mov	3329, %o3
	sll	%o0, 4, %o1
	addcc	%o1, %o0, %o1
	call	__umoddi3, 0
	 addx	%g4, 0, %o0
	sll	%l1, 16, %o4
	srl	%o4, 16, %o5
	mov	%o1, %i2
	mov	0, %o2
	umul	%o5, 1175, %o1
	rd	%y, %o0
	call	__umoddi3, 0
	 mov	3329, %o3
	add	%i5, 8, %i5
	cmp	%i5, 256
	bne	.L72
	 mov	%o1, %l1
	mov	0, %g1
.L73:
	lduh	[%l0+%g1], %o2
	add	%o2, %o2, %o3
	add	%fp, %o3, %o7
	lduh	[%o7-768], %i3
	sth	%i3, [%i0+%g1]
	lduh	[%o7-512], %i4
	sth	%i4, [%i1+%g1]
	add	%g1, 2, %g2
	lduh	[%l0+%g2], %g3
	add	%g3, %g3, %o0
	add	%fp, %o0, %o1
	lduh	[%o1-768], %g4
	sth	%g4, [%i0+%g2]
	lduh	[%o1-512], %i2
	sth	%i2, [%i1+%g2]
	add	%g1, 4, %o4
	lduh	[%l0+%o4], %o5
	add	%o5, %o5, %l1
	add	%fp, %l1, %i5
	lduh	[%i5-768], %o2
	sth	%o2, [%i0+%o4]
	lduh	[%i5-512], %o3
	sth	%o3, [%i1+%o4]
	add	%g1, 6, %o7
	lduh	[%l0+%o7], %i3
	add	%i3, %i3, %i4
	add	%fp, %i4, %g2
	lduh	[%g2-768], %g3
	sth	%g3, [%i0+%o7]
	lduh	[%g2-512], %o0
	sth	%o0, [%i1+%o7]
	add	%g1, 8, %o1
	lduh	[%l0+%o1], %g4
	add	%g4, %g4, %i2
	add	%fp, %i2, %o4
	lduh	[%o4-768], %o5
	sth	%o5, [%i0+%o1]
	lduh	[%o4-512], %l1
	sth	%l1, [%i1+%o1]
	add	%g1, 10, %i5
	lduh	[%l0+%i5], %o2
	add	%o2, %o2, %o3
	add	%fp, %o3, %o7
	lduh	[%o7-768], %i3
	sth	%i3, [%i0+%i5]
	lduh	[%o7-512], %i4
	sth	%i4, [%i1+%i5]
	add	%g1, 12, %g3
	lduh	[%l0+%g3], %g2
	add	%g2, %g2, %o0
	add	%fp, %o0, %o1
	lduh	[%o1-768], %g4
	sth	%g4, [%i0+%g3]
	add	%g1, 14, %i2
	lduh	[%o1-512], %o4
	sth	%o4, [%i1+%g3]
	lduh	[%l0+%i2], %o5
	add	%o5, %o5, %l1
	add	%fp, %l1, %i5
	lduh	[%i5-768], %o2
	sth	%o2, [%i0+%i2]
	lduh	[%i5-512], %o3
	add	%g1, 16, %g1
	cmp	%g1, 256
	bne	.L73
	 sth	%o3, [%i1+%i2]
	jmp	%i7+8
	 restore
.L74:
	add	%g2, %g2, %g1
	mov	0, %g3
	add	%g2, 1, %g2
	cmp	%g2, 128
	bne	.L71
	 sth	%g3, [%l0+%g1]
	b	.L125
	 mov	0, %i5
	.size	gen_tf, .-gen_tf
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.asciz	"[INFO]  :   NTT_256 Executing\n"
	.section	".text"
	.align 4
	.global ntt_256
	.type	ntt_256, #function
	.proc	020
ntt_256:
	save	%sp, -608, %sp
	mov	0, %g2
	mov	%i0, %g1
	add	%fp, -512, %i4
	add	%fp, -256, %i5
.L136:
	lduh	[%g1], %g4
	lduh	[%g1+2], %g3
	sth	%g4, [%i4+%g2]
	sth	%g3, [%i5+%g2]
	add	%g2, 2, %o0
	lduh	[%g1+4], %i3
	lduh	[%g1+6], %o1
	sth	%i3, [%i4+%o0]
	sth	%o1, [%i5+%o0]
	add	%g2, 4, %o2
	lduh	[%g1+8], %o3
	lduh	[%g1+10], %o4
	sth	%o3, [%i4+%o2]
	sth	%o4, [%i5+%o2]
	add	%g2, 6, %o5
	lduh	[%g1+12], %o7
	lduh	[%g1+14], %g4
	sth	%o7, [%i4+%o5]
	sth	%g4, [%i5+%o5]
	add	%g2, 8, %g3
	lduh	[%g1+16], %o0
	lduh	[%g1+18], %i3
	sth	%o0, [%i4+%g3]
	sth	%i3, [%i5+%g3]
	add	%g2, 10, %o1
	lduh	[%g1+20], %o2
	lduh	[%g1+22], %o3
	sth	%o2, [%i4+%o1]
	sth	%o3, [%i5+%o1]
	add	%g2, 12, %o4
	lduh	[%g1+24], %o5
	lduh	[%g1+26], %o7
	sth	%o5, [%i4+%o4]
	sth	%o7, [%i5+%o4]
	add	%g2, 14, %g3
	lduh	[%g1+28], %o0
	lduh	[%g1+30], %g4
	sth	%o0, [%i4+%g3]
	sth	%g4, [%i5+%g3]
	add	%g2, 16, %g2
	cmp	%g2, 256
	bne	.L136
	 add	%g1, 32, %g1
	mov	%i4, %o0
	call	ct_ntt, 0
	 mov	%i1, %o1
	mov	%i5, %o0
	call	ct_ntt, 0
	 mov	%i1, %o1
	mov	0, %g1
.L137:
	lduh	[%i4+%g1], %i1
	sth	%i1, [%i0+%g1]
	add	%i0, %g1, %i3
	lduh	[%i5+%g1], %o1
	sth	%o1, [%i3+256]
	add	%g1, 2, %o2
	lduh	[%i4+%o2], %o3
	sth	%o3, [%i0+%o2]
	add	%i0, %o2, %o4
	lduh	[%i5+%o2], %o5
	sth	%o5, [%o4+256]
	add	%g1, 4, %o7
	lduh	[%i4+%o7], %g3
	sth	%g3, [%i0+%o7]
	add	%i0, %o7, %o0
	lduh	[%i5+%o7], %g4
	sth	%g4, [%o0+256]
	add	%g1, 6, %g2
	lduh	[%i4+%g2], %i1
	sth	%i1, [%i0+%g2]
	add	%i0, %g2, %i3
	lduh	[%i5+%g2], %o1
	sth	%o1, [%i3+256]
	add	%g1, 8, %o2
	lduh	[%i4+%o2], %o3
	sth	%o3, [%i0+%o2]
	add	%i0, %o2, %o4
	lduh	[%i5+%o2], %o5
	sth	%o5, [%o4+256]
	add	%g1, 10, %o7
	lduh	[%i4+%o7], %g3
	sth	%g3, [%i0+%o7]
	add	%i0, %o7, %o0
	lduh	[%i5+%o7], %g4
	sth	%g4, [%o0+256]
	add	%g1, 12, %g2
	lduh	[%i4+%g2], %i1
	sth	%i1, [%i0+%g2]
	add	%i0, %g2, %i3
	lduh	[%i5+%g2], %o1
	sth	%o1, [%i3+256]
	add	%g1, 14, %o2
	lduh	[%i4+%o2], %o3
	sth	%o3, [%i0+%o2]
	add	%i0, %o2, %o4
	lduh	[%i5+%o2], %o5
	add	%g1, 16, %g1
	cmp	%g1, 256
	bne	.L137
	 sth	%o5, [%o4+256]
	sethi	%hi(.LC2), %i0
	call	cortos_printf, 0
	 or	%i0, %lo(.LC2), %o0
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
