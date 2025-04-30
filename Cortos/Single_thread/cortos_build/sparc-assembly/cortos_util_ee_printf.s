	.file	"cortos_util_ee_printf.c"
	.global __fixdfdi
	.global __floatdidf
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1071644672
	.long	0
	.section	".text"
	.align 4
	.type	get_components, #function
	.proc	010
get_components:
	save	%sp, -128, %sp
	mov	%i0, %g2
	mov	%i1, %g3
	std	%g2, [%fp-8]
	srl	%i0, 31, %l2
	andcc	%l2, 0xff, %g0
	be	.L2
	 ld	[%fp+64], %i3
	ldd	[%fp-8], %f8
	fnegs	%f8, %f8
	std	%f8, [%fp-8]
.L2:
	call	__fixdfdi, 0
	 ldd	[%fp-8], %o0
	sll	%i2, 3, %g1
	sethi	%hi(powers_of_10), %g2
	or	%g2, %lo(powers_of_10), %g3
	ldd	[%g3+%g1], %f10
	mov	%o0, %l0
	std	%f10, [%fp-16]
	call	__floatdidf, 0
	 mov	%o1, %l1
	ldd	[%fp-8], %f2
	ldd	[%fp-16], %f4
	fsubd	%f2, %f0, %f0
	fmuld	%f0, %f4, %f8
	std	%f8, [%fp-32]
	std	%f8, [%fp-24]
	call	__fixdfdi, 0
	 ldd	[%fp-32], %o0
	mov	%o0, %i4
	call	__floatdidf, 0
	 mov	%o1, %i5
	sethi	%hi(.LC0), %i1
	ldd	[%fp-24], %f8
	ldd	[%i1+%lo(.LC0)], %f12
	fsubd	%f8, %f0, %f6
	fcmped	%f6, %f12
	nop
	fbule	.L28
	 nop
	addcc	%i5, 1, %o3
	addx	%i4, 0, %o4
	mov	%o3, %i5
	mov	%o4, %i4
	mov	%o4, %o0
	call	__floatdidf, 0
	 mov	%o3, %o1
	ldd	[%fp-16], %f14
	fcmped	%f14, %f0
	nop
	fble	.L30
	 addcc	%l1, 1, %o5
.L5:
	cmp	%i2, 0
.L33:
	bne	.L10
	 mov	%l0, %o0
	call	__floatdidf, 0
	 mov	%l1, %o1
	ldd	[%i1+%lo(.LC0)], %f16
	ldd	[%fp-8], %f18
	fsubd	%f18, %f0, %f20
	fcmped	%f20, %f16
	nop
	fbuge	.L11
	 nop
	nop
	fbule	.L10
	 nop
.L11:
	and	%l0, 0, %i0
	and	%l1, 1, %i2
	or	%i0, %i2, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, 0, %g1
	addcc	%l1, %g1, %l1
	addx	%l0, 0, %l0
.L10:
	std	%l0, [%i3]
	std	%i4, [%i3+8]
	stb	%l2, [%i3+16]
	jmp	%i7+12
	 restore %g0, %i3, %o0
.L28:
	fcmpd	%f6, %f12
	nop
	fbne	.L33
	 cmp	%i2, 0
	orcc	%i4, %i5, %g0
	bne	.L31
	 and	%i4, 0, %g4
	addcc	%i5, 1, %o1
.L32:
	addx	%i4, 0, %o2
	mov	%o1, %i5
	b	.L5
	 mov	%o2, %i4
.L30:
	mov	0, %i4
	addx	%l0, 0, %o7
	mov	%o5, %l1
	mov	%o7, %l0
	b	.L5
	 mov	0, %i5
.L31:
	and	%i5, 1, %o0
	orcc	%g4, %o0, %g0
	be,a	.L33
	 cmp	%i2, 0
	b	.L32
	 addcc	%i5, 1, %o1
	.size	get_components, .-get_components
	.align 4
	.type	putchar_wrapper, #function
	.proc	020
putchar_wrapper:
	save	%sp, -96, %sp
.L35:
	call	__ajit_serial_putchar_via_vmap__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L35
	 nop
.L41:
	call	__ajit_read_serial_control_register_via_vmap__, 0
	 nop
	and	%o0, 9, %o0
	cmp	%o0, 9
	be	.L41
	 nop
	jmp	%i7+8
	 restore
	.size	putchar_wrapper, .-putchar_wrapper
	.align 4
	.type	out_rev_, #function
	.proc	020
out_rev_:
	save	%sp, -96, %sp
	andcc	%i4, 3, %g0
	bne	.L50
	 ld	[%i0+12], %l0
	cmp	%i2, %i3
	bgeu	.L50
	 add	%i2, 1, %i5
	mov	%l0, %g1
	sub	%i3, %i5, %l2
	andcc	%l2, 3, %l2
	be	.L53
	 mov	32, %l1
	add	%l0, 1, %g1
	st	%g1, [%i0+12]
	ld	[%i0+16], %g1
	cmp	%g1, %l0
	bleu,a	.L211
	 ld	[%i0+12], %g1
	ld	[%i0], %g1
	cmp	%g1, 0
	be	.L197
	 mov	32, %o0
	call	%g1, 0
	 ld	[%i0+4], %o1
.L128:
	ld	[%i0+12], %g1
.L211:
	cmp	%l2, 1
	be	.L53
	 add	%i5, 1, %i5
	cmp	%l2, 2
	be,a	.L212
	 add	%g1, 1, %o1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g3, %g1
	bleu,a	.L213
	 ld	[%i0+12], %g1
	ld	[%i0], %g4
	cmp	%g4, 0
	be	.L198
	 mov	32, %o0
	call	%g4, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
.L213:
	add	%i5, 1, %i5
.L158:
	add	%g1, 1, %o1
.L212:
	st	%o1, [%i0+12]
	ld	[%i0+16], %o2
	cmp	%o2, %g1
	bleu,a	.L214
	 ld	[%i0+12], %g1
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L199
	 mov	32, %o0
	call	%o3, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
.L214:
	add	%i5, 1, %i5
.L53:
	add	%g1, 1, %o5
	st	%o5, [%i0+12]
	ld	[%i0+16], %o7
	cmp	%o7, %g1
	bleu	.L215
	 cmp	%i5, %i3
	ld	[%i0], %l2
	cmp	%l2, 0
	be	.L52
	 mov	32, %o0
	call	%l2, 0
	 ld	[%i0+4], %o1
.L51:
	cmp	%i5, %i3
.L215:
	be	.L216
	 cmp	%i2, 0
	ld	[%i0+12], %g1
	add	%g1, 1, %o0
	st	%o0, [%i0+12]
	ld	[%i0+16], %o3
	cmp	%o3, %g1
	bleu	.L137
	 add	%i5, 1, %l2
	ld	[%i0], %o4
	cmp	%o4, 0
	be	.L200
	 mov	32, %o0
	call	%o4, 0
	 ld	[%i0+4], %o1
.L137:
	ld	[%i0+12], %g1
	add	%g1, 1, %o5
	st	%o5, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g2, %g1
	bleu,a	.L217
	 ld	[%i0+12], %g1
	ld	[%i0], %g4
	cmp	%g4, 0
	be	.L201
	 mov	32, %o0
	call	%g4, 0
	 ld	[%i0+4], %o1
.L139:
	ld	[%i0+12], %g1
.L217:
	add	%g1, 1, %g3
	st	%g3, [%i0+12]
	ld	[%i0+16], %o2
	cmp	%o2, %g1
	bleu,a	.L218
	 ld	[%i0+12], %g1
	ld	[%i0], %i5
	cmp	%i5, 0
	be	.L202
	 mov	32, %o0
	call	%i5, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
.L218:
	b	.L53
	 add	%l2, 3, %i5
.L50:
	cmp	%i2, 0
.L216:
	be	.L49
	 add	%i2, -1, %i2
	ld	[%i0+12], %g1
	add	%g1, 1, %l1
	ldub	[%i1+%i2], %g3
	st	%l1, [%i0+12]
	ld	[%i0+16], %g4
	mov	%i2, %i5
	cmp	%g1, %g4
	bgeu	.L103
	 and	%i2, 3, %l2
	ld	[%i0], %o2
	cmp	%o2, 0
	be	.L203
	 sll	%g3, 24, %o3
	ld	[%i0+4], %o1
	call	%o2, 0
	 sra	%o3, 24, %o0
.L103:
	cmp	%i5, 0
	be	.L49
	 cmp	%l2, 0
	be	.L66
	 cmp	%l2, 1
	be	.L156
	 cmp	%l2, 2
	be	.L219
	 ld	[%i0+12], %g1
	add	%i5, -1, %i5
	add	%g1, 1, %o1
	ldub	[%i1+%i5], %o4
	st	%o1, [%i0+12]
	ld	[%i0+16], %o5
	cmp	%g1, %o5
	bgeu,a	.L219
	 ld	[%i0+12], %g1
	ld	[%i0], %g2
	cmp	%g2, 0
	be,a	.L204
	 ld	[%i0+8], %o7
	sll	%o4, 24, %i2
	ld	[%i0+4], %o1
	call	%g2, 0
	 sra	%i2, 24, %o0
.L157:
	ld	[%i0+12], %g1
.L219:
	add	%i5, -1, %i5
	add	%g1, 1, %l1
	ldub	[%i1+%i5], %g3
	st	%l1, [%i0+12]
	ld	[%i0+16], %g4
	cmp	%g1, %g4
	bgeu,a	.L220
	 ld	[%i0+12], %g1
	ld	[%i0], %l2
	cmp	%l2, 0
	be,a	.L205
	 ld	[%i0+8], %o2
	sll	%g3, 24, %o0
	ld	[%i0+4], %o1
	call	%l2, 0
	 sra	%o0, 24, %o0
.L156:
	ld	[%i0+12], %g1
.L220:
	add	%i5, -1, %i5
.L196:
	add	%g1, 1, %o3
	ldub	[%i1+%i5], %o1
	st	%o3, [%i0+12]
	ld	[%i0+16], %o4
	cmp	%g1, %o4
	bgeu	.L221
	 cmp	%i5, 0
	ld	[%i0], %o5
	cmp	%o5, 0
	be	.L206
	 sll	%o1, 24, %o7
	sra	%o7, 24, %o0
	call	%o5, 0
	 ld	[%i0+4], %o1
.L124:
	cmp	%i5, 0
.L221:
	be	.L222
	 andcc	%i4, 2, %g0
.L66:
	ld	[%i0+12], %g1
	add	%i5, -1, %i2
	add	%g1, 1, %o7
	ldub	[%i1+%i2], %i5
	st	%o7, [%i0+12]
	ld	[%i0+16], %l1
	cmp	%g1, %l1
	bgeu,a	.L223
	 ld	[%i0+12], %g1
	ld	[%i0], %l2
	cmp	%l2, 0
	be	.L57
	 sll	%i5, 24, %g3
	ld	[%i0+4], %o1
	call	%l2, 0
	 sra	%g3, 24, %o0
.L56:
	ld	[%i0+12], %g1
.L223:
	add	%i2, -1, %o2
	add	%g1, 1, %o0
	ldub	[%i1+%o2], %o3
	st	%o0, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%g1, %o1
	bgeu,a	.L224
	 ld	[%i0+12], %g1
	ld	[%i0], %o4
	cmp	%o4, 0
	be	.L207
	 sll	%o3, 24, %g2
	ld	[%i0+4], %o1
	call	%o4, 0
	 sra	%g2, 24, %o0
.L118:
	ld	[%i0+12], %g1
.L224:
	add	%i2, -2, %o7
	add	%g1, 1, %i5
	ldub	[%i1+%o7], %l1
	st	%i5, [%i0+12]
	ld	[%i0+16], %l2
	cmp	%g1, %l2
	bgeu,a	.L225
	 ld	[%i0+12], %g1
	ld	[%i0], %g4
	cmp	%g4, 0
	be	.L208
	 sll	%l1, 24, %o2
	ld	[%i0+4], %o1
	call	%g4, 0
	 sra	%o2, 24, %o0
	ld	[%i0+12], %g1
.L225:
	b	.L196
	 add	%i2, -3, %i5
.L49:
	andcc	%i4, 2, %g0
.L222:
	be	.L232
	 mov	32, %i5
.L172:
	ld	[%i0+12], %g1
	sub	%l0, %g1, %i1
	add	%i1, %i3, %i4
	andcc	%i4, 7, %i2
	be,a	.L226
	 sub	%g1, %l0, %i2
	sub	%g1, %l0, %l1
.L227:
	cmp	%i3, %l1
	bleu	.L232
	 add	%g1, 1, %g4
	st	%g4, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g3, %g1
	bleu	.L210
	 cmp	%i2, 1
.L178:
	ld	[%i0], %o5
.L228:
	cmp	%o5, 0
	be	.L60
	 mov	32, %o0
	call	%o5, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	sub	%l0, %g1, %i1
	add	%i1, %i3, %i4
	andcc	%i4, 7, %i2
	bne	.L227
	 sub	%g1, %l0, %l1
.L59:
	sub	%g1, %l0, %i2
.L226:
	cmp	%i3, %i2
	bleu	.L232
	 add	%g1, 1, %l1
.L229:
	st	%l1, [%i0+12]
	ld	[%i0+16], %l2
	cmp	%l2, %g1
	bgu,a	.L228
	 ld	[%i0], %o5
	add	%l1, 1, %g4
	st	%g4, [%i0+12]
	cmp	%l2, %l1
	bgu	.L178
	 mov	%l1, %g1
	add	%g4, 1, %g3
	st	%g3, [%i0+12]
	cmp	%l2, %g4
	bgu	.L178
	 mov	%g4, %g1
	add	%l1, 3, %o2
	add	%l1, 2, %g1
	cmp	%l2, %g1
	bgu	.L178
	 st	%o2, [%i0+12]
	add	%l1, 4, %o0
	st	%o0, [%i0+12]
	cmp	%l2, %o2
	bgu	.L178
	 mov	%o2, %g1
	add	%l1, 5, %o3
	st	%o3, [%i0+12]
	cmp	%l2, %o0
	bgu	.L178
	 mov	%o0, %g1
	add	%l1, 6, %o1
	st	%o1, [%i0+12]
	cmp	%l2, %o3
	bgu	.L178
	 mov	%o3, %g1
	add	%l1, 7, %o4
	st	%o4, [%i0+12]
	cmp	%l2, %o1
	bgu	.L178
	 mov	%o1, %g1
	mov	%o4, %g1
	sub	%g1, %l0, %i2
	cmp	%i3, %i2
	bgu	.L229
	 add	%g1, 1, %l1
.L232:
	jmp	%i7+8
	 restore
.L210:
	be	.L59
	 mov	%g4, %g1
	cmp	%i2, 2
	be	.L150
	 cmp	%i2, 3
	be	.L151
	 cmp	%i2, 4
	be	.L152
	 cmp	%i2, 5
	be	.L153
	 cmp	%i2, 6
	be	.L230
	 add	%g1, 1, %o2
	add	%g4, 1, %l2
	cmp	%g3, %g4
	bgu	.L178
	 st	%l2, [%i0+12]
	mov	%l2, %g1
	add	%g1, 1, %o2
.L230:
	st	%o2, [%i0+12]
	ld	[%i0+16], %o0
	cmp	%o0, %g1
	bgu,a	.L228
	 ld	[%i0], %o5
	mov	%o2, %g1
.L153:
	add	%g1, 1, %o3
	st	%o3, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%o1, %g1
	bgu,a	.L228
	 ld	[%i0], %o5
	mov	%o3, %g1
.L152:
	add	%g1, 1, %o4
	st	%o4, [%i0+12]
	ld	[%i0+16], %o5
	cmp	%o5, %g1
	bgu,a	.L228
	 ld	[%i0], %o5
	mov	%o4, %g1
.L151:
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %o7
	cmp	%o7, %g1
	bgu,a	.L228
	 ld	[%i0], %o5
	mov	%g2, %g1
.L150:
	add	%g1, 1, %i1
	st	%i1, [%i0+12]
	ld	[%i0+16], %i4
	cmp	%i4, %g1
	bgu,a	.L228
	 ld	[%i0], %o5
	b	.L59
	 mov	%i1, %g1
.L60:
	ld	[%i0+8], %g2
	b	.L172
	 stb	%i5, [%g2+%g1]
.L206:
	ld	[%i0+8], %g2
	b	.L124
	 stb	%o1, [%g2+%g1]
.L208:
	ld	[%i0+8], %g3
	add	%i2, -3, %i5
	stb	%l1, [%g3+%g1]
	b	.L196
	 ld	[%i0+12], %g1
.L57:
	ld	[%i0+8], %g4
	b	.L56
	 stb	%i5, [%g4+%g1]
.L207:
	ld	[%i0+8], %o5
	b	.L118
	 stb	%o3, [%o5+%g1]
.L203:
	ld	[%i0+8], %o0
	b	.L103
	 stb	%g3, [%o0+%g1]
.L204:
	b	.L157
	 stb	%o4, [%o7+%g1]
.L205:
	b	.L156
	 stb	%g3, [%o2+%g1]
.L52:
	ld	[%i0+8], %g2
	b	.L51
	 stb	%l1, [%g2+%g1]
.L200:
	ld	[%i0+8], %o1
	b	.L137
	 stb	%l1, [%o1+%g1]
.L201:
	ld	[%i0+8], %o7
	b	.L139
	 stb	%l1, [%o7+%g1]
.L202:
	ld	[%i0+8], %o0
	add	%l2, 3, %i5
	stb	%l1, [%o0+%g1]
	b	.L53
	 ld	[%i0+12], %g1
.L199:
	ld	[%i0+8], %o4
	add	%i5, 1, %i5
	stb	%l1, [%o4+%g1]
	b	.L53
	 ld	[%i0+12], %g1
.L197:
	ld	[%i0+8], %g1
	b	.L128
	 stb	%l1, [%g1+%l0]
.L198:
	ld	[%i0+8], %o0
	add	%i5, 1, %i5
	stb	%l1, [%o0+%g1]
	b	.L158
	 ld	[%i0+12], %g1
	.size	out_rev_, .-out_rev_
	.global __umoddi3
	.global __udivdi3
	.align 4
	.type	print_integer, #function
	.proc	020
print_integer:
	save	%sp, -128, %sp
	ld	[%fp+92], %l3
	orcc	%i1, %i2, %g0
	bne	.L234
	 ld	[%fp+96], %l2
	andcc	%l2, 2048, %g0
	be	.L334
	 cmp	%i4, 16
	be,a	.L335
	 and	%l2, -17, %l2
	mov	1, %g1
	mov	0, %l0
	add	%fp, -32, %l1
.L236:
	andcc	%l2, 2, %g0
.L350:
	bne	.L243
	 mov	%l0, %o2
	cmp	%l3, 0
	bne	.L336
	 andcc	%l2, 1, %g0
.L243:
	cmp	%o2, %i5
.L347:
	bgeu	.L248
	 andcc	%g1, 0xff, %g0
	bne	.L313
	 mov	48, %o0
	b	.L346
	 cmp	%l0, %o2
.L337:
	bgeu	.L348
	 cmp	%l0, %o2
.L313:
	stb	%o0, [%l1+%o2]
	add	%o2, 1, %o2
	cmp	%o2, 31
	bleu	.L337
	 cmp	%o2, %i5
.L248:
	cmp	%l0, %o2
.L346:
.L348:
	bgeu	.L255
	 addx	%g0, 0, %o3
	cmp	%i4, 8
	be,a	.L255
	 and	%l2, -17, %l2
.L255:
	sethi	%hi(8192), %g1
	or	%g1, 16, %g1
	andcc	%l2, %g1, %g0
	be	.L349
	 cmp	%o2, 31
	andcc	%l2, 2048, %g0
	be	.L339
	 cmp	%o2, 0
.L257:
	cmp	%i4, 16
.L351:
	be	.L340
	 cmp	%o2, 31
	bgu	.L265
	 cmp	%i4, 2
	bne	.L265
	 add	%fp, %o2, %g1
	mov	98, %o4
	add	%o2, 1, %o2
	stb	%o4, [%g1-32]
.L265:
	cmp	%o2, 31
	bgu	.L264
	 add	%fp, %o2, %g1
	mov	48, %i1
	add	%o2, 1, %o2
	stb	%i1, [%g1-32]
	cmp	%o2, 31
.L349:
	bgu	.L264
	 cmp	%i3, 0
	bne	.L341
	 andcc	%l2, 4, %g0
	bne	.L342
	 andcc	%l2, 8, %g0
	be	.L264
	 add	%fp, %o2, %g1
	mov	32, %i2
	add	%o2, 1, %o2
	stb	%i2, [%g1-32]
.L264:
	mov	%i0, %o0
.L353:
	mov	%l1, %o1
	mov	%l3, %o3
	call	out_rev_, 0
	 mov	%l2, %o4
	jmp	%i7+8
	 restore
.L234:
	and	%l2, 32, %g1
	subcc	%g0, %g1, %g0
	addx	%g0, -1, %l4
	mov	0, %l0
	and	%l4, 32, %g2
	add	%fp, -32, %l1
	b	.L241
	 add	%g2, 65, %l4
.L343:
.L238:
	stb	%g3, [%l1+%l0]
	mov	%i1, %o0
	mov	%i2, %o1
	mov	0, %o2
	call	__udivdi3, 0
	 mov	%i4, %o3
	add	%l0, 1, %l0
	cmp	%l0, 32
	mov	%o0, %i1
	addx	%g0, 0, %g1
	andcc	%g1, 0xff, %g0
	be	.L236
	 mov	%o1, %i2
	orcc	%i1, %o1, %g0
	be	.L350
	 andcc	%l2, 2, %g0
.L241:
	mov	%i1, %o0
	mov	%i2, %o1
	mov	0, %o2
	call	__umoddi3, 0
	 mov	%i4, %o3
	sll	%o1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 9
	ble,a	.L343
	 add	%o1, 48, %g3
	add	%o1, -10, %o1
	b	.L238
	 add	%o1, %l4, %g3
.L339:
	be	.L351
	 cmp	%i4, 16
	cmp	%o2, %l3
	be	.L352
	 cmp	%o3, 0
	cmp	%i5, %o2
	bne	.L351
	 cmp	%i4, 16
	cmp	%o3, 0
.L352:
	be	.L259
	 cmp	%i4, 2
	addcc	%o2, -1, %g1
	bne	.L344
	 cmp	%i4, 2
	b	.L257
	 mov	0, %o2
.L336:
	be	.L347
	 cmp	%o2, %i5
	cmp	%i3, 0
	bne,a	.L245
	 add	%l3, -1, %l3
	andcc	%l2, 12, %g0
	bne,a	.L245
	 add	%l3, -1, %l3
.L245:
	cmp	%l0, %l3
	bgeu	.L282
	 andcc	%g1, 0xff, %g0
	be	.L282
	 mov	48, %g4
	add	%fp, %l0, %g1
	add	%l0, 1, %o2
	b	.L272
	 stb	%g4, [%g1-32]
.L345:
	bgeu	.L347
	 cmp	%o2, %i5
	stb	%g4, [%l1+%o2]
	add	%o2, 1, %o2
.L272:
	cmp	%o2, 32
	addx	%g0, 0, %g1
	andcc	%g1, 0xff, %g0
	bne,a	.L345
	 cmp	%o2, %l3
	b	.L347
	 cmp	%o2, %i5
.L341:
	add	%fp, %o2, %g1
	mov	45, %i4
	add	%o2, 1, %o2
	stb	%i4, [%g1-32]
	mov	%i0, %o0
	mov	%l1, %o1
	mov	%l3, %o3
	call	out_rev_, 0
	 mov	%l2, %o4
	jmp	%i7+8
	 restore
.L334:
	mov	48, %g1
	and	%l2, -17, %l2
	stb	%g1, [%fp-32]
	mov	1, %l0
	mov	1, %g1
	b	.L236
	 add	%fp, -32, %l1
.L342:
	add	%fp, %o2, %g1
	mov	43, %i3
	add	%o2, 1, %o2
	stb	%i3, [%g1-32]
	mov	%i0, %o0
	mov	%l1, %o1
	mov	%l3, %o3
	call	out_rev_, 0
	 mov	%l2, %o4
	jmp	%i7+8
	 restore
.L340:
	andcc	%l2, 32, %g0
	bne	.L263
	 cmp	%o2, 31
	bgu,a	.L353
	 mov	%i0, %o0
	add	%fp, %o2, %g1
	mov	120, %o7
	add	%o2, 1, %o2
	b	.L265
	 stb	%o7, [%g1-32]
.L335:
	mov	1, %g1
	mov	0, %l0
	b	.L236
	 add	%fp, -32, %l1
.L263:
	bgu,a	.L353
	 mov	%i0, %o0
	add	%fp, %o2, %g1
	mov	88, %o5
	add	%o2, 1, %o2
	b	.L265
	 stb	%o5, [%g1-32]
.L259:
	be	.L351
	 cmp	%i4, 16
	be	.L351
	 mov	%o2, %g1
	b	.L265
	 mov	%g1, %o2
.L344:
	be	.L354
	 cmp	%l0, %g1
	cmp	%i4, 16
	bne,a	.L265
	 mov	%g1, %o2
	cmp	%l0, %g1
.L354:
	blu	.L257
	 add	%o2, -2, %o2
	b	.L257
	 mov	%g1, %o2
.L282:
	b	.L243
	 mov	%l0, %o2
	.size	print_integer, .-print_integer
	.global __moddi3
	.global __divdi3
	.align 4
	.type	print_broken_up_decimal.isra.4, #function
	.proc	020
print_broken_up_decimal.isra.4:
	save	%sp, -96, %sp
	ld	[%fp+92], %l3
	mov	%i2, %l1
	mov	%i3, %l2
	mov	%i4, %l5
	ld	[%fp+96], %i3
	ld	[%fp+100], %i4
	ld	[%fp+104], %l0
	cmp	%l3, 0
	be	.L356
	 ld	[%fp+108], %i2
	sethi	%hi(4096), %g1
	or	%g1, 16, %g2
	and	%i4, %g2, %g3
	cmp	%g3, %g1
	be	.L466
	 cmp	%l1, 0
	cmp	%i2, 31
.L481:
	bgu	.L374
	 mov	0, %o2
	mov	10, %o3
	mov	%l1, %o0
	call	__moddi3, 0
	 mov	%l2, %o1
	add	%o1, 48, %o1
	mov	%l1, %o0
	stb	%o1, [%l0+%i2]
	mov	0, %o2
	mov	%l2, %o1
	mov	10, %o3
	call	__divdi3, 0
	 add	%l3, -1, %l1
	add	%i2, 1, %i2
	mov	%o0, %l4
	orcc	%l4, %o1, %g0
	be	.L362
	 mov	%o1, %l2
	andcc	%i2, 1, %g0
	bne	.L460
	 mov	0, %o2
.L431:
	mov	%l4, %o0
	mov	%l2, %o1
	mov	0, %o2
	cmp	%i2, 32
	be	.L374
	 mov	10, %o3
	call	__moddi3, 0
	 add	%l1, -1, %l1
	add	%o1, 48, %o4
	mov	%l4, %o0
	mov	0, %o2
	mov	10, %o3
	stb	%o4, [%l0+%i2]
	call	__divdi3, 0
	 mov	%l2, %o1
	mov	0, %o2
	mov	%o0, %l4
	mov	%o1, %l2
	mov	10, %o3
	orcc	%l4, %o1, %g0
	be	.L362
	 add	%i2, 1, %i2
	call	__moddi3, 0
	 add	%l1, -1, %l1
	add	%o1, 48, %o5
	mov	%l4, %o0
	stb	%o5, [%l0+%i2]
	mov	%l2, %o1
	mov	0, %o2
	call	__divdi3, 0
	 mov	10, %o3
	add	%i2, 1, %i2
	mov	%o0, %l4
	orcc	%l4, %o1, %g0
	bne	.L431
	 mov	%o1, %l2
.L362:
	cmp	%i2, 31
.L475:
	bgu	.L465
	 cmp	%l1, 0
	be	.L465
	 mov	48, %g1
	b	.L484
	 stb	%g1, [%l0+%i2]
.L467:
	cmp	%l1, 0
	be	.L478
	 cmp	%i2, 31
	stb	%g1, [%l0+%i2]
.L484:
	add	%i2, 1, %i2
	cmp	%i2, 31
	bleu	.L467
	 add	%l1, -1, %l1
.L465:
	cmp	%i2, 31
.L478:
	bgu	.L474
	 and	%i4, 3, %g1
	mov	46, %g1
.L480:
	stb	%g1, [%l0+%i2]
	add	%i2, 1, %i2
.L358:
	cmp	%i2, 31
.L477:
	bgu	.L374
	 mov	0, %o2
	mov	10, %o3
	mov	%i1, %o1
	call	__moddi3, 0
	 mov	%i0, %o0
	add	%o1, 48, %g1
	mov	0, %o2
	mov	%i1, %o1
	stb	%g1, [%l0+%i2]
	mov	10, %o3
	mov	%i0, %o0
	call	__divdi3, 0
	 add	%i2, 1, %i2
	mov	%o0, %l1
	orcc	%l1, %o1, %g0
	be	.L374
	 mov	%o1, %i1
	sub	%g0, %i2, %g1
	andcc	%g1, 3, %i0
	be	.L432
	 mov	0, %o2
	call	__moddi3, 0
	 mov	10, %o3
	add	%o1, 48, %g2
	mov	%l1, %o0
	stb	%g2, [%l0+%i2]
	mov	%i1, %o1
	mov	0, %o2
	mov	10, %o3
	call	__divdi3, 0
	 add	%i2, 1, %i2
	mov	%o0, %l1
	orcc	%l1, %o1, %g0
	be	.L374
	 mov	%o1, %i1
	cmp	%i0, 1
	be	.L432
	 cmp	%i0, 2
	be,a	.L479
	 mov	%l1, %o0
	mov	0, %o2
	call	__moddi3, 0
	 mov	10, %o3
	add	%o1, 48, %g3
	mov	%l1, %o0
	stb	%g3, [%l0+%i2]
	mov	%i1, %o1
	mov	0, %o2
	mov	10, %o3
	call	__divdi3, 0
	 add	%i2, 1, %i2
	mov	%o0, %l1
	orcc	%l1, %o1, %g0
	be	.L374
	 mov	%o1, %i1
	mov	%l1, %o0
.L479:
	mov	%i1, %o1
	mov	0, %o2
	call	__moddi3, 0
	 mov	10, %o3
	mov	%l1, %o0
	add	%o1, 48, %l3
	mov	0, %o2
	stb	%l3, [%l0+%i2]
	mov	%i1, %o1
	mov	10, %o3
	call	__divdi3, 0
	 add	%i2, 1, %i2
	mov	%o0, %l1
	orcc	%l1, %o1, %g0
	be	.L374
	 mov	%o1, %i1
.L432:
	mov	%l1, %o0
	mov	%i1, %o1
	mov	0, %o2
	cmp	%i2, 32
	be	.L374
	 mov	10, %o3
	call	__moddi3, 0
	 nop
	add	%o1, 48, %o1
	mov	0, %o2
	stb	%o1, [%l0+%i2]
	mov	10, %o3
	mov	%i1, %o1
	call	__divdi3, 0
	 mov	%l1, %o0
	add	%i2, 1, %i2
	mov	%o0, %l4
	mov	%o1, %i1
	mov	0, %o2
	mov	10, %o3
	orcc	%l4, %o1, %g0
	be	.L374
	 mov	%i2, %l2
	call	__moddi3, 0
	 nop
	add	%o1, 48, %g4
	mov	0, %o2
	mov	10, %o3
	stb	%g4, [%l0+%i2]
	mov	%l4, %o0
	call	__divdi3, 0
	 mov	%i1, %o1
	mov	0, %o2
	mov	%o0, %l1
	mov	%o1, %i0
	mov	10, %o3
	orcc	%l1, %o1, %g0
	be	.L374
	 add	%i2, 1, %i2
	call	__moddi3, 0
	 nop
	add	%o1, 48, %o4
	mov	0, %o2
	mov	10, %o3
	stb	%o4, [%l0+%i2]
	mov	%l1, %o0
	call	__divdi3, 0
	 mov	%i0, %o1
	mov	0, %o2
	mov	%o0, %l3
	mov	%o1, %l4
	mov	10, %o3
	orcc	%l3, %o1, %g0
	be	.L374
	 add	%l2, 2, %i2
	call	__moddi3, 0
	 nop
	add	%o1, 48, %o5
	mov	%l3, %o0
	stb	%o5, [%l0+%i2]
	mov	0, %o2
	mov	10, %o3
	mov	%l4, %o1
	call	__divdi3, 0
	 add	%l2, 3, %i2
	mov	%o0, %l1
	orcc	%l1, %o1, %g0
	bne	.L432
	 mov	%o1, %i1
.L374:
	and	%i4, 3, %g1
.L474:
	cmp	%g1, 1
	be	.L468
	 cmp	%i3, 0
.L379:
	cmp	%i2, 31
.L476:
	bgu	.L386
	 cmp	%l5, 0
	bne	.L469
	 andcc	%i4, 4, %g0
	bne	.L470
	 andcc	%i4, 8, %g0
	be	.L386
	 mov	32, %g1
	stb	%g1, [%l0+%i2]
	add	%i2, 1, %i2
.L386:
	mov	%i5, %i0
	call	out_rev_, 0
	 restore %g0, %l0, %o1
.L356:
	andcc	%i4, 16, %g0
	be	.L477
	 cmp	%i2, 31
	bleu,a	.L480
	 mov	46, %g1
	b	.L474
	 and	%i4, 3, %g1
.L469:
	mov	45, %g1
	mov	%i5, %i0
	stb	%g1, [%l0+%i2]
	mov	%l0, %i1
	call	out_rev_, 0
	 restore %i2, 1, %o2
.L460:
	call	__moddi3, 0
	 mov	10, %o3
	add	%o1, 48, %g4
	mov	%l4, %o0
	stb	%g4, [%l0+%i2]
	mov	%l2, %o1
	mov	0, %o2
	mov	10, %o3
	call	__divdi3, 0
	 add	%l3, -2, %l1
	add	%i2, 1, %i2
	mov	%o0, %l4
	orcc	%l4, %o1, %g0
	bne	.L431
	 mov	%o1, %l2
	b	.L475
	 cmp	%i2, 31
.L468:
	be	.L476
	 cmp	%i2, 31
	cmp	%l5, 0
	bne,a	.L381
	 add	%i3, -1, %i3
	andcc	%i4, 12, %g0
	bne,a	.L381
	 add	%i3, -1, %i3
.L381:
	cmp	%i2, %i3
	bgeu	.L379
	 cmp	%i2, 31
	bgu	.L476
	 mov	48, %g1
	b	.L485
	 stb	%g1, [%l0+%i2]
.L472:
	bgeu	.L476
	 cmp	%i2, 31
	stb	%g1, [%l0+%i2]
.L485:
	add	%i2, 1, %i2
	cmp	%i2, 31
	bleu,a	.L472
	 cmp	%i2, %i3
	b,a	.L476
.L466:
	ble	.L473
	 cmp	%l1, 0
	mov	%l1, %o0
.L483:
	mov	%l2, %o1
	mov	0, %o2
	call	__moddi3, 0
	 mov	10, %o3
	orcc	%o0, %o1, %g0
	bne	.L481
	 cmp	%i2, 31
	mov	0, %o2
.L482:
	mov	10, %o3
	mov	%l1, %o0
	call	__divdi3, 0
	 mov	%l2, %o1
	mov	0, %o2
	mov	%o0, %l1
	mov	%o1, %l2
	mov	10, %o3
	call	__moddi3, 0
	 add	%l3, -1, %l3
	orcc	%o0, %o1, %g0
	be	.L482
	 mov	0, %o2
	cmp	%l1, 0
	bg	.L481
	 cmp	%i2, 31
	cmp	%l1, 0
	bne	.L358
	 cmp	%l2, 0
	bne	.L481
	 cmp	%i2, 31
	b,a	.L477
.L470:
	mov	43, %g1
	mov	%i5, %i0
	stb	%g1, [%l0+%i2]
	mov	%l0, %i1
	call	out_rev_, 0
	 restore %i2, 1, %o2
.L473:
	bne	.L358
	 cmp	%l2, 0
	bne	.L483
	 mov	%l1, %o0
	b	.L477
	 cmp	%i2, 31
	.size	print_broken_up_decimal.isra.4, .-print_broken_up_decimal.isra.4
	.section	.rodata.cst8
	.align 8
.LC1:
	.long	471254
	.long	2014963922
	.align 8
.LC2:
	.long	0
	.long	0
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
	.align 8
.LC9:
	.long	1074434895
	.long	158966641
	.align 8
.LC10:
	.long	1071644672
	.long	0
	.align 8
.LC11:
	.long	1073900465
	.long	3149223190
	.align 8
.LC12:
	.long	1072049730
	.long	4277811695
	.align 8
.LC13:
	.long	1073741824
	.long	0
	.align 8
.LC14:
	.long	1076625408
	.long	0
	.align 8
.LC15:
	.long	1076101120
	.long	0
	.align 8
.LC16:
	.long	1075314688
	.long	0
	.align 8
.LC17:
	.long	1072693248
	.long	0
	.section	".text"
	.align 4
	.type	print_exponential_number, #function
	.proc	020
print_exponential_number:
	save	%sp, -192, %sp
	mov	%i1, %g2
	mov	%i2, %g3
	std	%g2, [%fp-56]
	srl	%i1, 31, %l6
	mov	%i3, %l4
	andcc	%l6, 0xff, %g1
	be	.L487
	 ldd	[%fp-56], %f8
	fnegs	%f8, %f8
.L487:
	sethi	%hi(.LC2), %g4
	ldd	[%g4+%lo(.LC2)], %f10
	fcmpd	%f8, %f10
	nop
	fbe	.L544
	 mov	1, %i2
	std	%f8, [%fp-64]
	sethi	%hi(1047552), %o4
	ldd	[%fp-64], %i2
	or	%o4, 1023, %g2
	sethi	%hi(4294966272), %o5
	or	%o5, 1023, %g3
	and	%i2, %g2, %o0
	and	%i3, %g3, %o1
	sethi	%hi(1072693248), %o2
	mov	0, %o3
	or	%o0, %o2, %g2
	or	%o1, %o3, %g3
	sethi	%hi(.LC3), %i3
	std	%g2, [%fp-56]
	ldd	[%i3+%lo(.LC3)], %f14
	ldd	[%fp-56], %f16
	fsubd	%f16, %f14, %f12
	fmuld	%f12, %f12, %f0
	srl	%i2, 20, %l2
	fmuld	%f12, %f0, %f24
	sethi	%hi(.LC4), %o7
	sethi	%hi(.LC6), %l1
	ldd	[%o7+%lo(.LC4)], %f2
	ldd	[%l1+%lo(.LC6)], %f20
	and	%l2, 2047, %l5
	fmuld	%f0, %f20, %f22
	add	%l5, -1023, %i1
	st	%i1, [%fp-68]
	ld	[%fp-68], %f1
	fmuld	%f12, %f2, %f4
	sethi	%hi(.LC5), %l0
	sethi	%hi(.LC7), %l3
	ldd	[%l0+%lo(.LC5)], %f18
	ldd	[%l3+%lo(.LC7)], %f28
	faddd	%f4, %f18, %f6
	fmuld	%f24, %f28, %f30
	fsubd	%f6, %f22, %f26
	fitod	%f1, %f16
	faddd	%f26, %f30, %f12
	sethi	%hi(.LC8), %i2
	ldd	[%i2+%lo(.LC8)], %f14
	fmuld	%f16, %f14, %f0
	faddd	%f12, %f0, %f2
	fcmped	%f2, %f10
	nop
	fbul	.L623
	 nop
	fdtoi	%f2, %f3
	st	%f3, [%fp-68]
	ld	[%fp-68], %l5
.L491:
	cmp	%l5, -308
	be	.L545
	 ldd	[%g4+%lo(.LC2)], %f20
	st	%l5, [%fp-68]
	ld	[%fp-68], %f7
	fitod	%f7, %f4
	sethi	%hi(.LC9), %o4
	sethi	%hi(.LC10), %g4
	ldd	[%o4+%lo(.LC9)], %f18
	ldd	[%g4+%lo(.LC10)], %f22
	fmuld	%f4, %f18, %f6
	faddd	%f6, %f22, %f24
	fcmped	%f24, %f20
	nop
	fbul	.L624
	 nop
	fdtoi	%f24, %f17
	st	%f17, [%fp-68]
	fitod	%f17, %f26
	ld	[%fp-68], %g2
.L496:
	sethi	%hi(.LC12), %g3
	sethi	%hi(.LC11), %o5
	ldd	[%g3+%lo(.LC12)], %f12
	ldd	[%o5+%lo(.LC11)], %f28
	fmuld	%f26, %f12, %f16
	fmuld	%f4, %f28, %f30
	sethi	%hi(.LC13), %o2
	fsubd	%f30, %f16, %f0
	ldd	[%o2+%lo(.LC13)], %f10
	fmuld	%f0, %f0, %f2
	faddd	%f0, %f0, %f14
	fsubd	%f10, %f0, %f4
	addcc	%g2, 1023, %o1
	mov	0, %g3
	sll	%o1, 20, %g2
	sethi	%hi(.LC14), %o3
	sethi	%hi(.LC15), %i3
	ldd	[%o3+%lo(.LC14)], %f18
	ldd	[%i3+%lo(.LC15)], %f20
	fdivd	%f2, %f18, %f6
	sethi	%hi(.LC16), %o7
	faddd	%f6, %f20, %f22
	ldd	[%o7+%lo(.LC16)], %f26
	fdivd	%f2, %f22, %f24
	sethi	%hi(.LC17), %l0
	faddd	%f24, %f26, %f28
	ldd	[%l0+%lo(.LC17)], %f0
	fdivd	%f2, %f28, %f30
	std	%g2, [%fp-56]
	faddd	%f4, %f30, %f12
	fdivd	%f14, %f12, %f16
	ldd	[%fp-56], %f14
	faddd	%f16, %f0, %f2
	fmuld	%f2, %f14, %f10
.L493:
	fcmped	%f8, %f10
	nop
	fbuge	.L498
	 nop
	sethi	%hi(.LC15), %l2
	add	%l5, -1, %l5
	ldd	[%l2+%lo(.LC15)], %f4
	fdivd	%f10, %f4, %f10
.L498:
	add	%l5, 17, %l3
	cmp	%l3, 34
	bgu,a	.L546
	 fmovs	%f10, %f12
	subcc	%g0, %l5, %g0
	sra	%l5, 31, %i1
	subx	%g0, -1, %i2
	xor	%i1, %l5, %g4
	sethi	%hi(powers_of_10), %g3
	sub	%g4, %i1, %g2
	or	%g3, %lo(powers_of_10), %o0
	sll	%g2, 3, %o5
	sethi	%hi(4096), %o1
	srl	%l5, 31, %o4
	andcc	%i5, %o1, %g0
	bne	.L629
	 ldd	[%o0+%o5], %f12
	mov	0, %i1
.L625:
	andcc	%i2, 0xff, %g0
	be	.L507
	 cmp	%g1, 0
	bne,a	.L630
	 fnegs	%f8, %f8
	add	%fp, -24, %g1
.L651:
	std	%f8, [%fp-56]
	st	%g1, [%sp+64]
	ldd	[%fp-56], %o0
	mov	%l4, %o2
	call	get_components, 0
	 nop
	unimp	24
	cmp	%i1, 0
	ldd	[%fp-24], %i2
	ld	[%fp-16], %l3
	ld	[%fp-12], %l1
	be	.L631
	 ldub	[%fp-8], %l6
.L510:
	sethi	%hi(4096), %g1
	andcc	%i5, %g1, %g0
	bne	.L632
	 cmp	%l5, -1
.L525:
	mov	%i2, %o0
.L653:
	mov	%l3, %o2
	and	%i5, 2, %i2
	mov	%l1, %o3
	mov	%i3, %o1
	mov	0, %l2
	cmp	%i4, %l2
.L644:
	bgu	.L633
	 mov	0, %g1
.L528:
	st	%g1, [%sp+96]
	ld	[%fp+92], %g1
	st	%g1, [%sp+104]
	ld	[%fp+96], %g1
	ld	[%i0+12], %i3
	st	%l4, [%sp+92]
	st	%i5, [%sp+100]
	st	%g1, [%sp+108]
	and	%l6, 0xff, %o4
	call	print_broken_up_decimal.isra.4, 0
	 mov	%i0, %o5
	cmp	%i1, 0
	bne	.L655
	 and	%i5, 32, %i5
	ld	[%i0+12], %g1
	add	%g1, 1, %l6
	subcc	%g0, %i5, %g0
	st	%l6, [%i0+12]
	addx	%g0, -1, %i1
	ld	[%i0+16], %g3
	and	%i1, 32, %o0
	cmp	%g1, %g3
	add	%o0, 69, %o1
	bgeu	.L531
	 mov	%o1, %o2
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L532
	 sll	%o2, 24, %o4
	ld	[%i0+4], %o1
	call	%o3, 0
	 sra	%o4, 24, %o0
.L531:
	mov	%l5, %g4
	cmp	%l5, 0
	ble	.L533
	 sra	%l5, 31, %l3
.L534:
	mov	5, %g1
	add	%l2, -1, %l1
	st	%g1, [%sp+96]
	st	%l1, [%sp+92]
	mov	%i0, %o0
	mov	%l3, %o1
	mov	%g4, %o2
	srl	%l5, 31, %o3
	mov	10, %o4
	call	print_integer, 0
	 mov	0, %o5
	cmp	%i2, 0
	be	.L655
	 mov	32, %i5
.L622:
	ld	[%i0+12], %g1
	sub	%i3, %g1, %l5
	add	%l5, %i4, %l2
	andcc	%l2, 7, %i2
	be	.L648
	 sub	%g1, %i3, %l3
	sub	%g1, %i3, %l0
.L649:
	cmp	%i4, %l0
	bleu	.L655
	 add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %o5
	cmp	%o5, %g1
	bleu	.L635
	 cmp	%i2, 1
.L627:
	ld	[%i0], %i1
.L650:
	cmp	%i1, 0
	be	.L538
	 mov	32, %o0
	call	%i1, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	sub	%i3, %g1, %l5
	add	%l5, %i4, %l2
	andcc	%l2, 7, %i2
	bne	.L649
	 sub	%g1, %i3, %l0
.L537:
	sub	%g1, %i3, %l3
.L648:
	cmp	%i4, %l3
	bleu	.L655
	 add	%g1, 1, %l1
	st	%l1, [%i0+12]
	ld	[%i0+16], %l5
	cmp	%l5, %g1
	bgu,a	.L650
	 ld	[%i0], %i1
	add	%l1, 1, %l2
	st	%l2, [%i0+12]
	cmp	%l5, %l1
	bgu	.L627
	 mov	%l1, %g1
	add	%l2, 1, %i2
	st	%i2, [%i0+12]
	cmp	%l5, %l2
	bgu	.L627
	 mov	%l2, %g1
	add	%l1, 3, %l0
	add	%l1, 2, %g1
	cmp	%l5, %g1
	bgu	.L627
	 st	%l0, [%i0+12]
	add	%l1, 4, %g2
	st	%g2, [%i0+12]
	cmp	%l5, %l0
	bgu	.L627
	 mov	%l0, %g1
	add	%l1, 5, %o5
	st	%o5, [%i0+12]
	cmp	%l5, %g2
	bgu	.L627
	 mov	%g2, %g1
	add	%l1, 6, %l4
	st	%l4, [%i0+12]
	cmp	%l5, %o5
	bgu	.L627
	 mov	%o5, %g1
	add	%l1, 7, %l6
	st	%l6, [%i0+12]
	cmp	%l5, %l4
	bgu	.L627
	 mov	%l4, %g1
	b	.L537
	 mov	%l6, %g1
.L544:
	mov	0, %o4
	mov	0, %l5
.L488:
	sethi	%hi(4096), %o1
	andcc	%i5, %o1, %g0
	be	.L625
	 mov	0, %i1
.L629:
	cmp	%l4, 0
	bne	.L501
	 mov	%l4, %o2
	mov	0, %o2
	mov	1, %l4
.L501:
	cmp	%l5, %l4
	bge	.L637
	 mov	1, %o3
	cmp	%l5, -4
	bl	.L638
	 mov	1, %l4
.L503:
	and	%o3, %l4, %i3
	andcc	%i3, 0xff, %i1
	be	.L505
	 add	%o2, -1, %o7
	sub	%o7, %l5, %o7
.L505:
	xnor	%g0, %o7, %l0
	or	%i5, 2048, %i5
	sra	%l0, 31, %l1
	cmp	%i1, 0
	be	.L625
	 and	%o7, %l1, %l4
	cmp	%g1, 0
	be	.L651
	 add	%fp, -24, %g1
	b	.L656
	 fnegs	%f8, %f8
.L635:
	be	.L537
	 mov	%g2, %g1
	cmp	%i2, 2
	be	.L604
	 cmp	%i2, 3
	be	.L605
	 cmp	%i2, 4
	be	.L606
	 cmp	%i2, 5
	be	.L607
	 cmp	%i2, 6
	be	.L652
	 add	%g1, 1, %l6
	add	%g2, 1, %l4
	cmp	%o5, %g2
	bgu	.L627
	 st	%l4, [%i0+12]
	mov	%l4, %g1
	add	%g1, 1, %l6
.L652:
	st	%l6, [%i0+12]
	ld	[%i0+16], %i1
	cmp	%i1, %g1
	bgu,a	.L650
	 ld	[%i0], %i1
	mov	%l6, %g1
.L607:
	add	%g1, 1, %o0
	st	%o0, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g3, %g1
	bgu,a	.L650
	 ld	[%i0], %i1
	mov	%o0, %g1
.L606:
	add	%g1, 1, %o1
	st	%o1, [%i0+12]
	ld	[%i0+16], %o2
	cmp	%o2, %g1
	bgu,a	.L650
	 ld	[%i0], %i1
	mov	%o1, %g1
.L605:
	add	%g1, 1, %o3
	st	%o3, [%i0+12]
	ld	[%i0+16], %o7
	cmp	%o7, %g1
	bgu,a	.L650
	 ld	[%i0], %i1
	mov	%o3, %g1
.L604:
	add	%g1, 1, %o4
	st	%o4, [%i0+12]
	ld	[%i0+16], %g4
	cmp	%g4, %g1
	bgu,a	.L650
	 ld	[%i0], %i1
	b	.L537
	 mov	%o4, %g1
.L538:
	ld	[%i0+8], %o0
	b	.L622
	 stb	%i5, [%o0+%g1]
.L633:
	b	.L528
	 sub	%i4, %l2, %g1
.L630:
	add	%fp, -24, %g1
.L656:
	std	%f8, [%fp-56]
	st	%g1, [%sp+64]
	ldd	[%fp-56], %o0
	mov	%l4, %o2
	call	get_components, 0
	 nop
	unimp	24
	cmp	%i1, 0
	ldd	[%fp-24], %i2
	ld	[%fp-16], %l3
	ld	[%fp-12], %l1
	bne	.L510
	 ldub	[%fp-8], %l6
.L631:
	mov	%i2, %o0
	mov	%l3, %o2
	mov	%i3, %o1
	cmp	%o0, 0
	bg	.L558
	 mov	%l1, %o3
	cmp	%o0, 0
.L657:
	be	.L639
	 cmp	%o1, 9
.L526:
	add	%l5, 99, %g1
.L654:
	cmp	%g1, 198
	bgu	.L541
	 mov	5, %l2
	mov	4, %l2
.L541:
	andcc	%i5, 2, %i2
	bne	.L528
	 mov	0, %g1
	b	.L644
	 cmp	%i4, %l2
.L632:
	bl	.L525
	 mov	%i2, %o0
	call	__floatdidf, 0
	 mov	%i3, %o1
	add	%l5, 1, %l0
	sethi	%hi(powers_of_10), %g2
	sll	%l0, 3, %g1
	or	%g2, %lo(powers_of_10), %o5
	ldd	[%o5+%g1], %f14
	fcmpd	%f0, %f14
	nop
	fbne	.L653
	 mov	%i2, %o0
	add	%l4, -1, %l4
	b	.L653
	 mov	%l0, %l5
.L638:
	mov	0, %l4
.L645:
	and	%o3, %l4, %i3
	andcc	%i3, 0xff, %i1
	be	.L505
	 add	%o2, -1, %o7
	b	.L505
	 sub	%o7, %l5, %o7
.L637:
	mov	0, %o3
	cmp	%l5, -4
	bge	.L503
	 mov	1, %l4
	b	.L645
	 mov	0, %l4
.L507:
	andcc	%o4, 0xff, %l2
	be	.L512
	 sub	%l4, %l5, %l3
	cmp	%l3, 306
	ble	.L514
	 fmuld	%f8, %f12, %f10
.L642:
	cmp	%g1, 0
	bne,a	.L515
	 fnegs	%f10, %f10
.L515:
	add	%fp, -24, %g1
	std	%f10, [%fp-56]
	st	%g1, [%sp+64]
	ldd	[%fp-56], %o0
	mov	%l4, %o2
	call	get_components, 0
	 nop
	unimp	24
	ldd	[%fp-24], %l0
	ldd	[%fp-16], %i2
	ldub	[%fp-8], %l6
.L516:
	mov	%l0, %o0
	mov	%l1, %o1
	mov	%i2, %o2
	cmp	%o0, 0
	ble	.L657
	 mov	%i3, %o3
.L558:
	add	%l5, 1, %l5
.L646:
	mov	0, %o2
	mov	0, %o3
	mov	0, %o0
	b	.L526
	 mov	1, %o1
.L546:
	fmovs	%f11, %f13
	mov	0, %i2
	b	.L488
	 mov	0, %o4
.L623:
	fdtoi	%f2, %f11
	st	%f11, [%fp-68]
	fitod	%f11, %f10
	fcmpd	%f2, %f10
	nop
	fbe	.L491
	 ld	[%fp-68], %l5
	b	.L491
	 add	%l5, -1, %l5
.L533:
	subcc	%g0, %l5, %g4
.L647:
	mov	5, %g1
	subx	%g0, %l3, %l3
	add	%l2, -1, %l1
	st	%g1, [%sp+96]
	st	%l1, [%sp+92]
	mov	%i0, %o0
	mov	%l3, %o1
	mov	%g4, %o2
	srl	%l5, 31, %o3
	mov	10, %o4
	call	print_integer, 0
	 mov	0, %o5
	cmp	%i2, 0
	bne	.L622
	 mov	32, %i5
	b,a	.L655
.L512:
	cmp	%l3, 306
	bg	.L642
	 fdivd	%f8, %f12, %f10
.L514:
	std	%f10, [%fp-56]
	std	%f8, [%fp-40]
	std	%f12, [%fp-48]
	call	__fixdfdi, 0
	 ldd	[%fp-56], %o0
	mov	%o0, %l0
	call	__floatdidf, 0
	 mov	%o1, %l1
	cmp	%l2, 0
	ldd	[%fp-40], %f8
	be	.L517
	 ldd	[%fp-48], %f12
	fdivd	%f0, %f12, %f28
	sll	%l4, 3, %g1
	sethi	%hi(powers_of_10), %o7
	fsubd	%f8, %f28, %f20
	or	%o7, %lo(powers_of_10), %l2
	ldd	[%l2+%g1], %f30
	std	%f30, [%fp-32]
	fmuld	%f12, %f30, %f24
.L518:
	fmuld	%f20, %f24, %f8
.L520:
	std	%f8, [%fp-56]
	std	%f8, [%fp-40]
	call	__fixdfdi, 0
	 ldd	[%fp-56], %o0
	mov	%o0, %i2
	call	__floatdidf, 0
	 mov	%o1, %l3
	sethi	%hi(.LC10), %g1
	ldd	[%fp-40], %f8
	ldd	[%g1+%lo(.LC10)], %f16
	fsubd	%f8, %f0, %f12
	mov	0, %o4
	fcmped	%f12, %f16
	nop
	fbge	.L521
	 mov	1, %g4
	mov	0, %o4
	mov	0, %g4
.L521:
	ldd	[%g1+%lo(.LC10)], %f0
	addcc	%l3, %g4, %i3
	fcmpd	%f12, %f0
	nop
	fbne	.L522
	 addx	%i2, %o4, %i2
	and	%i2, -1, %i2
	and	%i3, -2, %i3
.L522:
	mov	%i2, %o0
	call	__floatdidf, 0
	 mov	%i3, %o1
	ldd	[%fp-32], %f2
	fcmped	%f0, %f2
	nop
	fbul	.L516
	 nop
	addcc	%l1, 1, %l1
	mov	0, %i2
	addx	%l0, 0, %l0
	b	.L516
	 mov	0, %i3
.L639:
	bleu	.L654
	 add	%l5, 99, %g1
	b	.L646
	 add	%l5, 1, %l5
.L532:
	ld	[%i0+8], %o7
	stb	%o1, [%o7+%g1]
	mov	%l5, %g4
	cmp	%l5, 0
	bg	.L534
	 sra	%l5, 31, %l3
	b	.L647
	 subcc	%g0, %l5, %g4
.L624:
	fdtoi	%f24, %f13
	st	%f13, [%fp-68]
	fitod	%f13, %f26
	fcmpd	%f24, %f26
	nop
	fbe	.L496
	 ld	[%fp-68], %g2
	add	%g2, -1, %g2
	st	%g2, [%fp-68]
	ld	[%fp-68], %f15
	b	.L496
	 fitod	%f15, %f26
.L545:
	sethi	%hi(.LC1), %l1
	b	.L493
	 ldd	[%l1+%lo(.LC1)], %f10
.L517:
	sll	%l4, 3, %g1
	sethi	%hi(powers_of_10), %i2
	st	%f12, [%fp-68]
	or	%i2, %lo(powers_of_10), %o4
	ldd	[%o4+%g1], %f6
	ld	[%fp-68], %g1
	std	%f6, [%fp-32]
	srl	%g1, 20, %g4
	ld	[%fp-32], %g1
	and	%g4, 2047, %o5
	srl	%g1, 20, %g2
	add	%o5, -1023, %g1
	fmuld	%f12, %f0, %f18
	sra	%g1, 31, %o0
	and	%g2, 2047, %g3
	xor	%o0, %g1, %o2
	add	%g3, -1023, %o1
	sub	%o2, %o0, %o3
	sra	%o1, 31, %g1
	xor	%g1, %o1, %i3
	sub	%i3, %g1, %g1
	cmp	%o3, %g1
	ble	.L519
	 fsubd	%f8, %f18, %f20
	fdivd	%f12, %f6, %f26
	b	.L520
	 fdivd	%f20, %f26, %f8
.L519:
	ldd	[%fp-32], %f22
	b	.L518
	 fdivd	%f22, %f12, %f24
.L655:
	jmp	%i7+8
	 restore
	.size	print_exponential_number, .-print_exponential_number
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC18:
	.asciz	"fni+"
	.align 8
.LC19:
	.asciz	"fni"
	.align 8
.LC20:
	.asciz	"nan"
	.align 8
.LC22:
	.asciz	"fni-"
	.section	.rodata.cst8
	.align 8
.LC21:
	.long	-1048577
	.long	4294967295
	.align 8
.LC23:
	.long	2146435071
	.long	4294967295
	.align 8
.LC24:
	.long	1104006501
	.long	0
	.align 8
.LC25:
	.long	-1043477147
	.long	0
	.section	".text"
	.align 4
	.type	print_floating_point, #function
	.proc	020
print_floating_point:
	save	%sp, -184, %sp
	st	%i1, [%fp-64]
	st	%i2, [%fp-60]
	ldd	[%fp-64], %f8
	fcmpd	%f8, %f8
	nop
	fbne	.L689
	 ldub	[%fp+95], %g3
	sethi	%hi(.LC21), %g1
	ldd	[%g1+%lo(.LC21)], %f10
	fcmped	%f8, %f10
	nop
	fbl	.L690
	 sethi	%hi(.LC23), %g1
	ldd	[%g1+%lo(.LC23)], %f0
	fcmped	%f8, %f0
	nop
	fbule	.L687
	 nop
	andcc	%i5, 4, %g0
	bne	.L691
	 sethi	%hi(.LC18), %g4
	mov	3, %o2
	sethi	%hi(.LC19), %o1
	mov	%i0, %o0
	or	%o1, %lo(.LC19), %o1
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L687:
	cmp	%g3, 0
	be	.L692
	 sethi	%hi(.LC24), %g1
.L666:
	andcc	%i5, 2048, %g0
	be	.L678
	 mov	0, %i2
	cmp	%i3, 17
	bleu	.L669
	 add	%fp, -32, %i1
	b	.L670
	 mov	48, %g2
.L693:
	cmp	%i3, 17
	bgu	.L673
	 mov	1, %g1
	mov	0, %g1
.L673:
	andcc	%g1, 0xff, %g0
	be	.L694
	 cmp	%g3, 0
.L670:
	stb	%g2, [%i1+%i2]
	add	%i2, 1, %i2
	cmp	%i2, 31
	bleu	.L693
	 add	%i3, -1, %i3
.L669:
	cmp	%g3, 0
.L694:
	be	.L674
	 add	%fp, -56, %g1
	st	%i1, [%sp+92]
	st	%i2, [%sp+96]
.L688:
	std	%f8, [%fp-64]
	ldd	[%fp-64], %g2
	mov	%i0, %o0
	mov	%g2, %o1
	mov	%g3, %o2
	mov	%i3, %o3
	mov	%i4, %o4
	call	print_exponential_number, 0
	 mov	%i5, %o5
	jmp	%i7+8
	 restore
.L689:
	sethi	%hi(.LC20), %o3
	mov	%i0, %o0
	or	%o3, %lo(.LC20), %o1
	mov	3, %o2
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L690:
	sethi	%hi(.LC22), %o2
	mov	%i0, %o0
	or	%o2, %lo(.LC22), %o1
	mov	%i4, %o3
	mov	4, %o2
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L692:
	ldd	[%g1+%lo(.LC24)], %f2
	fcmped	%f8, %f2
	nop
	fbg	.L667
	 sethi	%hi(.LC25), %g1
	ldd	[%g1+%lo(.LC25)], %f4
	fcmped	%f8, %f4
	nop
	fbuge	.L666
	 nop
.L667:
	add	%fp, -32, %g1
	st	%g0, [%sp+96]
	b	.L688
	 st	%g1, [%sp+92]
.L691:
	mov	4, %o2
	or	%g4, %lo(.LC18), %o1
	mov	%i0, %o0
	mov	%i4, %o3
	call	out_rev_, 0
	 mov	%i5, %o4
	jmp	%i7+8
	 restore
.L678:
	mov	6, %i3
	b	.L669
	 add	%fp, -32, %i1
.L674:
	std	%f8, [%fp-64]
	mov	%i3, %o2
	ldd	[%fp-64], %o0
	st	%g1, [%sp+64]
	call	get_components, 0
	 nop
	unimp	24
	ldd	[%fp-56], %o0
	ldub	[%fp-40], %o4
	st	%i3, [%sp+92]
	st	%i4, [%sp+96]
	st	%i5, [%sp+100]
	st	%i1, [%sp+104]
	st	%i2, [%sp+108]
	ldd	[%fp-48], %o2
	call	print_broken_up_decimal.isra.4, 0
	 mov	%i0, %o5
	jmp	%i7+8
	 restore
	.size	print_floating_point, .-print_floating_point
	.section	.rodata.str1.8
	.align 8
.LC26:
	.asciz	")llun("
	.align 8
.LC27:
	.asciz	")lin("
	.section	".text"
	.align 4
	.type	_vsnprintf, #function
	.proc	04
_vsnprintf:
	save	%sp, -184, %sp
	sethi	%hi(8192), %l2
	sethi	%hi(.LC27), %l3
	sethi	%hi(2147482624), %l4
	sethi	%hi(.LC26), %l6
	or	%l2, 1, %l2
	or	%l3, %lo(.LC27), %l3
	or	%l4, 1023, %l4
	or	%l6, %lo(.LC26), %l6
.L1011:
	ldsb	[%i1], %o0
.L1120:
	cmp	%o0, 0
	be	.L1075
	 ldub	[%i1], %g3
.L810:
	cmp	%o0, 37
	be,a	.L697
	 add	%i1, 2, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %o2
	st	%o2, [%i0+12]
	ld	[%i0+16], %i5
	cmp	%g1, %i5
	bgeu,a	.L1080
	 add	%i1, 1, %i1
	ld	[%i0], %i3
	cmp	%i3, 0
	be,a	.L699
	 ld	[%i0+8], %l1
	call	%i3, 0
	 ld	[%i0+4], %o1
	add	%i1, 1, %i1
.L1080:
	ldsb	[%i1], %o0
	cmp	%o0, 0
	bne	.L810
	 ldub	[%i1], %g3
.L1075:
	ld	[%i0], %g1
	cmp	%g1, 0
	be,a	.L1076
	 ld	[%i0+16], %g1
	ld	[%i0+12], %i0
.L1150:
	jmp	%i7+8
	 restore
.L697:
	mov	0, %i3
	sethi	%hi(.L708), %o5
.L701:
	ldub	[%i1-1], %g1
	add	%g1, -32, %o0
	and	%o0, 0xff, %o1
	cmp	%o1, 16
	bleu	.L1077
	 add	%i1, -1, %i5
.L702:
	add	%g1, -48, %o7
	and	%o7, 0xff, %l1
	cmp	%l1, 9
	bgu	.L710
	 mov	%i5, %l0
	mov	0, %i4
.L711:
	add	%i4, %i4, %l7
	sll	%g1, 24, %g1
	sll	%i4, 3, %i4
	sra	%g1, 24, %g1
	add	%l7, %i4, %g3
	add	%i5, 1, %i5
	add	%g3, %g1, %g4
	ldub	[%i5], %g1
	add	%g1, -48, %g2
	and	%g2, 0xff, %o0
	cmp	%o0, 9
	bleu	.L711
	 add	%g4, -48, %i4
.L1070:
	sll	%g1, 24, %o1
.L712:
	sra	%o1, 24, %o2
	cmp	%o2, 46
	be	.L1078
	 mov	0, %l0
.L715:
	add	%g1, -104, %o1
	and	%o1, 0xff, %o2
	cmp	%o2, 18
	bgu	.L1122
	 add	%g1, -37, %l5
	sll	%o2, 2, %o3
	sethi	%hi(.L725), %o4
	or	%o4, %lo(.L725), %o5
	ld	[%o5+%o3], %i1
	jmp	%i1
	 nop
	.section	".rodata"
	.section	".text"
.L724:
	ldub	[%i5+1], %g1
.L1071:
	or	%i3, 512, %i3
	add	%i5, 1, %i5
.L719:
	add	%g1, -37, %l5
.L1122:
	and	%l5, 0xff, %l7
	cmp	%l7, 83
	bleu	.L1079
	 sll	%l7, 2, %g4
.L728:
	ld	[%i0+12], %g4
	add	%g4, 1, %o5
	st	%o5, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g4, %g3
	bgeu	.L1011
	 add	%i5, 1, %i1
	ld	[%i0], %i4
	cmp	%i4, 0
	be	.L809
	 sll	%g1, 24, %l5
	ld	[%i0+4], %o1
	call	%i4, 0
	 sra	%l5, 24, %o0
	b	.L1011
	 add	%i5, 1, %i1
.L1077:
	or	%o5, %lo(.L708), %o2
	sll	%o1, 2, %o3
	ld	[%o2+%o3], %o4
	jmp	%o4
	 nop
	.section	".rodata"
	.section	".text"
.L707:
	or	%i3, 1, %i3
	b	.L701
	 add	%i1, 1, %i1
.L706:
	or	%i3, 2, %i3
	b	.L701
	 add	%i1, 1, %i1
.L705:
	or	%i3, 4, %i3
	b	.L701
	 add	%i1, 1, %i1
.L704:
	or	%i3, 16, %i3
	b	.L701
	 add	%i1, 1, %i1
.L703:
	or	%i3, 8, %i3
	b	.L701
	 add	%i1, 1, %i1
.L699:
	add	%i1, 1, %i1
	b	.L1080
	 stb	%g3, [%l1+%g1]
.L710:
	sll	%g1, 24, %o1
	sra	%o1, 24, %l5
	cmp	%l5, 42
	bne	.L712
	 mov	0, %i4
	ld	[%i2], %i4
	cmp	%i4, 0
	bl	.L1081
	 add	%i2, 4, %i2
	ldub	[%l0+1], %g1
	b	.L1070
	 add	%i5, 1, %i5
.L1079:
	sethi	%hi(.L737), %g3
	or	%g3, %lo(.L737), %g2
	ld	[%g2+%g4], %o0
	jmp	%o0
	 nop
	.section	".rodata"
	.section	".text"
.L1078:
	ldub	[%i5+1], %g1
	or	%i3, 2048, %i3
	add	%g1, -48, %o3
	and	%o3, 0xff, %o4
	cmp	%o4, 9
	bgu	.L716
	 add	%i5, 1, %g4
.L717:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	add	%l0, %l0, %i5
	sll	%l0, 3, %l5
	add	%g4, 1, %g4
	add	%i5, %l5, %l7
	add	%l7, %g1, %g3
	ldub	[%g4], %g1
	add	%g1, -48, %g2
	and	%g2, 0xff, %o0
	cmp	%o0, 9
	bleu	.L717
	 add	%g3, -48, %l0
	b	.L715
	 mov	%g4, %i5
.L716:
	sll	%g1, 24, %o5
	sra	%o5, 24, %i1
	cmp	%i1, 42
	bne,a	.L715
	 mov	%g4, %i5
	ld	[%i2], %o7
	xnor	%g0, %o7, %l0
	ldub	[%i5+2], %g1
	sra	%l0, 31, %l1
	add	%i2, 4, %i2
	add	%i5, 2, %i5
	b	.L715
	 and	%o7, %l1, %l0
.L722:
	ldsb	[%i5+1], %o7
	cmp	%o7, 108
	bne	.L1071
	 ldub	[%i5+1], %g1
	ldub	[%i5+2], %g1
	or	%i3, 1536, %i3
	b	.L719
	 add	%i5, 2, %i5
.L721:
	ldub	[%i5+1], %g1
	or	%i3, 1024, %i3
	b	.L719
	 add	%i5, 1, %i5
.L720:
	ldsb	[%i5+1], %l1
	cmp	%l1, 104
	be	.L727
	 ldub	[%i5+1], %g1
	or	%i3, 128, %i3
	b	.L719
	 add	%i5, 1, %i5
.L729:
	ld	[%i0+12], %g1
	add	%g1, 1, %l0
	st	%l0, [%i0+12]
	ld	[%i0+16], %l7
	cmp	%g1, %l7
	bgeu	.L1011
	 add	%i5, 1, %i1
	ld	[%i0], %o4
	cmp	%o4, 0
	be	.L802
	 mov	37, %o0
	call	%o4, 0
	 ld	[%i0+4], %o1
	b	.L1120
	 ldsb	[%i1], %o0
.L735:
	ld	[%i2], %o2
	or	%i3, %l2, %o4
	cmp	%o2, 0
	bne	.L799
	 add	%i2, 4, %i2
	mov	%i0, %o0
	mov	%l3, %o1
	mov	5, %o2
	mov	10, %o3
	call	out_rev_, 0
	 add	%i5, 1, %i1
	b	.L1120
	 ldsb	[%i1], %o0
.L734:
	ld	[%i2], %g1
	ld	[%i0+12], %l7
	andcc	%i3, 64, %g0
	bne	.L1082
	 add	%i2, 4, %i2
	andcc	%i3, 128, %g0
	be	.L805
	 andcc	%i3, 512, %g0
	sth	%l7, [%g1]
	b	.L1011
	 add	%i5, 1, %i1
.L733:
	andcc	%i3, 2, %l5
	be	.L762
	 add	%i4, -1, %i3
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
	mov	1, %i1
.L763:
	ld	[%i2], %o4
	add	%g1, 1, %l0
	st	%l0, [%i0+12]
	cmp	%g1, %g4
	bgeu	.L768
	 add	%i2, 4, %i2
	ld	[%i0], %l1
	cmp	%l1, 0
	be,a	.L769
	 ld	[%i0+8], %o0
	sll	%o4, 24, %g1
	ld	[%i0+4], %o1
	call	%l1, 0
	 sra	%g1, 24, %o0
.L768:
	cmp	%l5, 0
	be,a	.L1011
	 add	%i5, 1, %i1
	sub	%i4, %i1, %g1
	andcc	%g1, 3, %l7
	be	.L965
	 mov	32, %l5
	cmp	%i4, %i1
	bleu,a	.L1011
	 add	%i5, 1, %i1
	ld	[%i0+12], %g2
	add	%g2, 1, %g1
	st	%g1, [%i0+12]
	ld	[%i0+16], %g1
	cmp	%g2, %g1
	bgeu	.L1123
	 cmp	%l7, 1
	ld	[%i0], %g1
	cmp	%g1, 0
	be	.L1083
	 mov	32, %o0
	call	%g1, 0
	 ld	[%i0+4], %o1
.L845:
	cmp	%l7, 1
.L1123:
	be	.L965
	 add	%i1, 1, %i1
	cmp	%l7, 2
	be	.L1124
	 ld	[%i0+12], %g1
	add	%g1, 1, %o5
	st	%o5, [%i0+12]
	ld	[%i0+16], %o7
	cmp	%g1, %o7
	bgeu,a	.L1125
	 add	%i1, 1, %i1
	ld	[%i0], %g3
	cmp	%g3, 0
	be	.L1084
	 mov	32, %o0
	call	%g3, 0
	 ld	[%i0+4], %o1
.L848:
	add	%i1, 1, %i1
.L1125:
	ld	[%i0+12], %g1
.L1124:
	add	%g1, 1, %o2
	st	%o2, [%i0+12]
	ld	[%i0+16], %i3
	cmp	%g1, %i3
	bgeu,a	.L965
	 add	%i1, 1, %i1
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L1085
	 mov	32, %o0
	call	%o3, 0
	 ld	[%i0+4], %o1
	add	%i1, 1, %i1
.L965:
	cmp	%i4, %i1
	bleu,a	.L1011
	 add	%i5, 1, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %o4
	st	%o4, [%i0+12]
	ld	[%i0+16], %l0
	cmp	%g1, %l0
	bgeu,a	.L1126
	 ld	[%i0+12], %g1
	ld	[%i0], %l1
	cmp	%l1, 0
	be	.L773
	 mov	32, %o0
	call	%l1, 0
	 ld	[%i0+4], %o1
.L772:
	ld	[%i0+12], %g1
.L1126:
	add	%g1, 1, %l7
	st	%l7, [%i0+12]
	ld	[%i0+16], %g2
	cmp	%g1, %g2
	bgeu	.L857
	 add	%i1, 1, %i1
	ld	[%i0], %o5
	cmp	%o5, 0
	be	.L1086
	 mov	32, %o0
	call	%o5, 0
	 ld	[%i0+4], %o1
.L857:
	ld	[%i0+12], %g1
	add	%g1, 1, %g3
	st	%g3, [%i0+12]
	ld	[%i0+16], %g4
	cmp	%g1, %g4
	bgeu,a	.L1127
	 ld	[%i0+12], %g1
	ld	[%i0], %o2
	cmp	%o2, 0
	be	.L1087
	 mov	32, %o0
	call	%o2, 0
	 ld	[%i0+4], %o1
.L860:
	ld	[%i0+12], %g1
.L1127:
	add	%g1, 1, %o3
	st	%o3, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%g1, %o1
	bgeu,a	.L965
	 add	%i1, 3, %i1
	ld	[%i0], %o4
	cmp	%o4, 0
	be	.L1088
	 mov	32, %o0
	call	%o4, 0
	 ld	[%i0+4], %o1
	b	.L965
	 add	%i1, 3, %i1
.L732:
	sll	%g1, 24, %l5
	sra	%l5, 24, %i1
	cmp	%i1, 105
	bne	.L1089
	 cmp	%i1, 100
	sethi	%hi(16384), %o2
.L1121:
	or	%i3, %o2, %i3
	and	%g1, -33, %g1
.L1148:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 88
	be,a	.L740
	 mov	16, %l1
	sra	%l5, 24, %g1
	cmp	%g1, 111
	be	.L742
	 mov	8, %l1
	cmp	%g1, 98
	be	.L742
	 mov	2, %l1
	and	%i3, -17, %i3
	mov	10, %l1
.L740:
	sra	%l5, 24, %o3
	cmp	%o3, 88
	be,a	.L742
	 or	%i3, 32, %i3
.L742:
	andcc	%i3, 2048, %g0
	be	.L743
	 add	%i5, 1, %i1
	and	%i3, -2, %i3
.L743:
	sethi	%hi(16384), %g1
	andcc	%i3, %g1, %g0
	be	.L744
	 andcc	%i3, 1024, %g0
	bne	.L1090
	 andcc	%i3, 512, %g0
	be	.L746
	 andcc	%i3, 64, %g0
	ld	[%i2], %g4
	cmp	%g4, 0
	ble	.L747
	 add	%i2, 4, %i2
	sra	%g4, 31, %g1
	st	%g4, [%fp-44]
	st	%g1, [%fp-48]
.L748:
	st	%i4, [%sp+92]
	st	%i3, [%sp+96]
	mov	%i0, %o0
	ld	[%fp-48], %o1
	ld	[%fp-44], %o2
	srl	%g4, 31, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L1120
	 ldsb	[%i1], %o0
.L736:
	ld	[%i2], %i1
	cmp	%i1, 0
	be	.L1091
	 add	%i2, 4, %i2
	orcc	%l0, 0, %o1
	be,a	.L777
	 mov	%l4, %o1
.L777:
	ldub	[%i1], %g2
	sll	%g2, 24, %o0
	cmp	%o0, 0
	be	.L778
	 mov	0, %l1
	add	%o1, -1, %g3
	ldsb	[%i1+1], %o2
	and	%g3, 7, %o3
	cmp	%o2, 0
	be	.L1055
	 add	%i1, 1, %g1
	cmp	%g3, 0
	be	.L1055
	 cmp	%o3, 0
	be	.L780
	 cmp	%o3, 1
	be	.L973
	 cmp	%o3, 2
	be	.L974
	 cmp	%o3, 3
	be	.L975
	 cmp	%o3, 4
	be	.L976
	 cmp	%o3, 5
	be	.L977
	 cmp	%o3, 6
	be	.L1128
	 add	%g1, 1, %g1
	ldsb	[%g1], %o4
	cmp	%o4, 0
	be	.L1055
	 add	%g3, -1, %g3
	add	%g1, 1, %g1
.L1128:
	ldsb	[%g1], %o5
	cmp	%o5, 0
	be	.L1055
	 add	%g3, -1, %g3
.L977:
	add	%g1, 1, %g1
	ldsb	[%g1], %o7
	cmp	%o7, 0
	be	.L1055
	 add	%g3, -1, %g3
.L976:
	add	%g1, 1, %g1
	ldsb	[%g1], %l1
	cmp	%l1, 0
	be	.L1055
	 add	%g3, -1, %g3
.L975:
	add	%g1, 1, %g1
	ldsb	[%g1], %l5
	cmp	%l5, 0
	be	.L1055
	 add	%g3, -1, %g3
.L974:
	add	%g1, 1, %g1
	ldsb	[%g1], %l7
	cmp	%l7, 0
	be	.L1055
	 add	%g3, -1, %g3
.L973:
	add	%g1, 1, %g1
	ldsb	[%g1], %g4
	cmp	%g4, 0
	be	.L778
	 sub	%g1, %i1, %l1
	addcc	%g3, -1, %g3
	be	.L1129
	 andcc	%i3, 2048, %l5
.L780:
	add	%g1, 1, %g1
.L1130:
	ldsb	[%g1], %o1
	cmp	%o1, 0
	be	.L1055
	 mov	%g1, %o2
	add	%g1, 1, %g1
	ldsb	[%g1], %o3
	cmp	%o3, 0
	be,a	.L778
	 sub	%g1, %i1, %l1
	ldsb	[%o2+2], %o4
	cmp	%o4, 0
	be	.L1055
	 add	%o2, 2, %g1
	ldsb	[%o2+3], %o5
	cmp	%o5, 0
	be	.L1055
	 add	%o2, 3, %g1
	ldsb	[%o2+4], %o7
	cmp	%o7, 0
	be	.L1055
	 add	%o2, 4, %g1
	ldsb	[%o2+5], %l1
	cmp	%l1, 0
	be	.L1055
	 add	%o2, 5, %g1
	ldsb	[%o2+6], %l5
	cmp	%l5, 0
	be	.L1055
	 add	%o2, 6, %g1
	ldsb	[%o2+7], %l7
	cmp	%l7, 0
	be	.L1055
	 add	%o2, 7, %g1
	addcc	%g3, -8, %g3
	bne,a	.L1130
	 add	%g1, 1, %g1
.L1055:
	sub	%g1, %i1, %l1
.L778:
	andcc	%i3, 2048, %l5
.L1129:
	be,a	.L1131
	 andcc	%i3, 2, %i3
	cmp	%l1, %l0
	bgu,a	.L781
	 mov	%l0, %l1
.L781:
	andcc	%i3, 2, %i3
.L1131:
	bne	.L1132
	 cmp	%o0, 0
	sub	%i4, %l1, %g1
	andcc	%g1, 3, %g2
	be	.L966
	 cmp	%i4, %l1
	bleu	.L1048
	 add	%l1, 1, %l7
	ld	[%i0+12], %o0
	add	%o0, 1, %g4
	st	%g4, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%o0, %o1
	bgeu	.L1133
	 cmp	%g2, 1
	ld	[%i0], %o2
	cmp	%o2, 0
	be,a	.L1093
	 ld	[%i0+8], %o3
	ld	[%i0+4], %o1
	mov	32, %o0
	call	%o2, 0
	 st	%g2, [%fp-76]
	ld	[%fp-76], %g2
.L908:
	cmp	%g2, 1
.L1133:
	be	.L966
	 mov	%l7, %l1
	cmp	%g2, 2
	be,a	.L1134
	 ld	[%i0+12], %o0
	ld	[%i0+12], %o5
	add	%o5, 1, %o7
	st	%o7, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%o5, %g3
	bgeu	.L971
	 add	%l7, 1, %l1
	ld	[%i0], %g1
	cmp	%g1, 0
	be	.L1094
	 mov	32, %o0
	call	%g1, 0
	 ld	[%i0+4], %o1
.L971:
	ld	[%i0+12], %o0
.L1134:
	add	%o0, 1, %g1
	st	%g1, [%i0+12]
	ld	[%i0+16], %g1
	cmp	%o0, %g1
	bgeu	.L966
	 add	%l1, 1, %l1
	ld	[%i0], %g1
	cmp	%g1, 0
	be,a	.L1095
	 ld	[%i0+8], %g1
	mov	32, %o0
	call	%g1, 0
	 ld	[%i0+4], %o1
.L966:
.L1138:
	cmp	%i4, %l1
	bleu	.L1048
	 add	%l1, 1, %l7
	ld	[%i0+12], %g1
	add	%g1, 1, %l1
	st	%l1, [%i0+12]
	ld	[%i0+16], %o5
	cmp	%g1, %o5
	bgeu,a	.L1135
	 ld	[%i0+12], %g1
	ld	[%i0], %g3
	cmp	%g3, 0
	be	.L786
	 mov	32, %o0
	call	%g3, 0
	 ld	[%i0+4], %o1
.L785:
	ld	[%i0+12], %g1
.L1135:
	add	%g1, 1, %o2
	st	%o2, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%g1, %o1
	bgeu,a	.L1136
	 ld	[%i0+12], %g1
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L1096
	 mov	32, %o0
	call	%o3, 0
	 ld	[%i0+4], %o1
.L920:
	ld	[%i0+12], %g1
.L1136:
	add	%g1, 1, %o0
	st	%o0, [%i0+12]
	ld	[%i0+16], %l1
	cmp	%g1, %l1
	bgeu,a	.L1137
	 ld	[%i0+12], %g1
	ld	[%i0], %o5
	cmp	%o5, 0
	be	.L1097
	 mov	32, %o0
	call	%o5, 0
	 ld	[%i0+4], %o1
.L923:
	ld	[%i0+12], %g1
.L1137:
	add	%g1, 1, %g4
	st	%g4, [%i0+12]
	ld	[%i0+16], %o2
	cmp	%g1, %o2
	bgeu	.L1138
	 add	%l7, 3, %l1
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L1098
	 mov	32, %o0
	call	%o3, 0
	 ld	[%i0+4], %o1
	b	.L966
	 add	%l7, 3, %l1
.L731:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 70
	be,a	.L759
	 or	%i3, 32, %i3
.L759:
	mov	%i2, %o1
	mov	8, %o2
	call	memcpy, 0
	 add	%fp, -16, %o0
	mov	%i0, %o0
	st	%g0, [%sp+92]
	ld	[%fp-16], %o1
	ld	[%fp-12], %o2
.L1074:
	mov	%l0, %o3
	mov	%i4, %o4
	mov	%i3, %o5
	call	print_floating_point, 0
	 add	%i2, 8, %i2
	b	.L1011
	 add	%i5, 1, %i1
.L730:
	and	%g1, -33, %i1
	sll	%i1, 24, %l1
	sra	%l1, 24, %o3
	cmp	%o3, 71
	bne	.L1139
	 and	%g1, -3, %g1
	sethi	%hi(4096), %o1
	or	%i3, %o1, %i3
.L1139:
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 69
	be,a	.L761
	 or	%i3, 32, %i3
.L761:
	mov	%i2, %o1
	mov	8, %o2
	call	memcpy, 0
	 add	%fp, -8, %o0
	mov	1, %g1
	mov	%i0, %o0
	ld	[%fp-8], %o1
	ld	[%fp-4], %o2
	b	.L1074
	 st	%g1, [%sp+92]
.L1100:
	call	%o3, 0
	 ld	[%i0+4], %o1
.L791:
	ldub	[%i1], %g2
	add	%l0, -1, %l0
	sll	%g2, 24, %o0
.L1072:
	cmp	%o0, 0
.L1132:
	be	.L794
	 cmp	%l5, 0
	be	.L795
	 cmp	%l0, 0
	be	.L1140
	 cmp	%i3, 0
.L795:
	ld	[%i0+12], %g1
	add	%g1, 1, %o2
	st	%o2, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%g1, %o1
	bgeu	.L791
	 add	%i1, 1, %i1
	ld	[%i0], %o3
	cmp	%o3, 0
	bne	.L1100
	 sra	%o0, 24, %o0
	ld	[%i0+8], %o4
	b	.L791
	 stb	%g2, [%o4+%g1]
.L794:
	cmp	%i3, 0
.L1140:
	be	.L1011
	 add	%i5, 1, %i1
	sub	%i4, %l1, %g1
	andcc	%g1, 3, %i1
	be	.L967
	 mov	32, %l0
	cmp	%i4, %l1
	bleu,a	.L1011
	 add	%i5, 1, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %i3
	st	%i3, [%i0+12]
	ld	[%i0+16], %l5
	cmp	%g1, %l5
	bgeu	.L1141
	 cmp	%i1, 1
	ld	[%i0], %o2
	cmp	%o2, 0
	be	.L1101
	 mov	32, %o0
	call	%o2, 0
	 ld	[%i0+4], %o1
.L887:
	cmp	%i1, 1
.L1141:
	be	.L967
	 add	%l1, 1, %l1
	cmp	%i1, 2
	be	.L1142
	 ld	[%i0+12], %g1
	add	%g1, 1, %o3
	st	%o3, [%i0+12]
	ld	[%i0+16], %o4
	cmp	%g1, %o4
	bgeu,a	.L1143
	 add	%l1, 1, %l1
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L1102
	 mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
.L890:
	add	%l1, 1, %l1
.L1143:
	ld	[%i0+12], %g1
.L1142:
	add	%g1, 1, %o7
	st	%o7, [%i0+12]
	ld	[%i0+16], %g3
	cmp	%g1, %g3
	bgeu,a	.L967
	 add	%l1, 1, %l1
	ld	[%i0], %l7
	cmp	%l7, 0
	be	.L1103
	 mov	32, %o0
	call	%l7, 0
	 ld	[%i0+4], %o1
	add	%l1, 1, %l1
.L967:
	cmp	%i4, %l1
	bleu	.L1011
	 add	%i5, 1, %i1
	ld	[%i0+12], %g1
	add	%g1, 1, %g4
	st	%g4, [%i0+12]
	ld	[%i0+16], %i1
	cmp	%g1, %i1
	bgeu,a	.L1144
	 ld	[%i0+12], %g1
	ld	[%i0], %i3
	cmp	%i3, 0
	be	.L797
	 mov	32, %o0
	call	%i3, 0
	 ld	[%i0+4], %o1
.L796:
	ld	[%i0+12], %g1
.L1144:
	add	%g1, 1, %o2
	st	%o2, [%i0+12]
	ld	[%i0+16], %o1
	cmp	%g1, %o1
	bgeu	.L899
	 add	%l1, 1, %l1
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L1104
	 mov	32, %o0
	call	%o3, 0
	 ld	[%i0+4], %o1
.L899:
	ld	[%i0+12], %g1
	add	%g1, 1, %g2
	st	%g2, [%i0+12]
	ld	[%i0+16], %o5
	cmp	%g1, %o5
	bgeu,a	.L1145
	 ld	[%i0+12], %g1
	ld	[%i0], %g3
	cmp	%g3, 0
	be	.L1105
	 mov	32, %o0
	call	%g3, 0
	 ld	[%i0+4], %o1
.L902:
	ld	[%i0+12], %g1
.L1145:
	add	%g1, 1, %l7
	st	%l7, [%i0+12]
	ld	[%i0+16], %o0
	cmp	%g1, %o0
	bgeu,a	.L967
	 add	%l1, 3, %l1
	ld	[%i0], %g4
	cmp	%g4, 0
	be	.L1106
	 mov	32, %o0
	call	%g4, 0
	 ld	[%i0+4], %o1
	b	.L967
	 add	%l1, 3, %l1
.L1076:
	cmp	%g1, 0
	be,a	.L1150
	 ld	[%i0+12], %i0
	ld	[%i0+8], %g4
	cmp	%g4, 0
	be,a	.L1150
	 ld	[%i0+12], %i0
	ld	[%i0+12], %g2
	cmp	%g1, %g2
	bleu,a	.L812
	 add	%g1, -1, %g2
.L812:
	stb	%g0, [%g4+%g2]
	ld	[%i0+12], %i0
	jmp	%i7+8
	 restore
.L799:
	mov	10, %g1
	st	%o4, [%sp+96]
	st	%g1, [%sp+92]
	mov	%i0, %o0
	mov	0, %o1
	mov	0, %o3
	mov	16, %o4
	mov	%l0, %o5
	call	print_integer, 0
	 add	%i5, 1, %i1
	b	.L1120
	 ldsb	[%i1], %o0
.L762:
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
	mov	1, %o7
	andcc	%i3, 3, %l1
	be	.L764
	 mov	32, %l0
	cmp	%i4, 1
	bleu	.L763
	 mov	2, %i1
	add	%g1, 1, %o0
	cmp	%g4, %g1
	bleu	.L1107
	 st	%o0, [%i0+12]
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L1108
	 mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
.L1031:
	cmp	%l1, 1
	be	.L764
	 mov	%i1, %o7
	cmp	%l1, 2
	be	.L1147
	 add	%g1, 1, %o2
	add	%g1, 1, %o7
	st	%o7, [%i0+12]
	cmp	%g4, %g1
	bleu	.L1109
	 add	%i1, 1, %l7
	ld	[%i0], %g3
	cmp	%g3, 0
	be	.L1110
	 mov	32, %o0
	call	%g3, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
.L1034:
	mov	%l7, %o7
	add	%g1, 1, %o2
.L1147:
	st	%o2, [%i0+12]
	cmp	%g4, %g1
	bleu	.L1111
	 add	%o7, 1, %i3
	ld	[%i0], %o3
	cmp	%o3, 0
	be	.L1112
	 mov	32, %o0
	call	%o3, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
	mov	%i3, %o7
.L764:
	cmp	%i4, %o7
	bleu	.L763
	 add	%o7, 1, %i1
	add	%g1, 1, %l7
	cmp	%g4, %g1
	bleu	.L765
	 st	%l7, [%i0+12]
	ld	[%i0], %l1
	cmp	%l1, 0
	be	.L766
	 mov	32, %o0
	call	%l1, 0
	 ld	[%i0+4], %o1
	ld	[%i0+16], %g4
	ld	[%i0+12], %l7
.L765:
	add	%l7, 1, %g1
	cmp	%g4, %l7
	bleu	.L1008
	 st	%g1, [%i0+12]
	ld	[%i0], %g1
	cmp	%g1, 0
	be	.L1113
	 mov	32, %o0
	call	%g1, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
.L1008:
	add	%g1, 1, %g3
	cmp	%g4, %g1
	bleu	.L1009
	 st	%g3, [%i0+12]
	ld	[%i0], %g2
	cmp	%g2, 0
	be	.L1114
	 mov	32, %o0
	call	%g2, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g3
	ld	[%i0+16], %g4
.L1009:
	add	%g3, 1, %g1
	cmp	%g4, %g3
	bleu	.L1010
	 st	%g1, [%i0+12]
	ld	[%i0], %g1
	cmp	%g1, 0
	be	.L1115
	 mov	32, %o0
	call	%g1, 0
	 ld	[%i0+4], %o1
	ld	[%i0+12], %g1
	ld	[%i0+16], %g4
.L1010:
	b	.L764
	 add	%i1, 3, %o7
.L1082:
	stb	%l7, [%g1]
	b	.L1011
	 add	%i5, 1, %i1
.L1089:
	bne,a	.L1148
	 and	%g1, -33, %g1
	b	.L1121
	 sethi	%hi(16384), %o2
.L1081:
	or	%i3, 2, %i3
	sub	%g0, %i4, %i4
	ldub	[%l0+1], %g1
	b	.L1070
	 add	%i5, 1, %i5
.L744:
	bne	.L1116
	 and	%i3, -13, %i5
	andcc	%i3, 512, %g0
	bne	.L1117
	 andcc	%i3, 64, %g0
	bne,a	.L1118
	 ldub	[%i2+3], %o2
	ld	[%i2], %o2
	andcc	%i3, 128, %g0
	be	.L757
	 add	%i2, 4, %i2
	sethi	%hi(64512), %i3
	or	%i3, 1023, %o1
	and	%o2, %o1, %o2
.L757:
	st	%i4, [%sp+92]
.L1073:
	st	%i5, [%sp+96]
	mov	%i0, %o0
	mov	0, %o1
	mov	0, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L1120
	 ldsb	[%i1], %o0
.L1048:
	ldub	[%i1], %g2
	mov	%l7, %l1
	b	.L1072
	 sll	%g2, 24, %o0
.L727:
	ldub	[%i5+2], %g1
	or	%i3, 192, %i3
	b	.L719
	 add	%i5, 2, %i5
.L773:
	ld	[%i0+8], %o0
	b	.L772
	 stb	%l5, [%o0+%g1]
.L1086:
	ld	[%i0+8], %o7
	b	.L857
	 stb	%l5, [%o7+%g1]
.L1087:
	ld	[%i0+8], %i3
	b	.L860
	 stb	%l5, [%i3+%g1]
.L1088:
	ld	[%i0+8], %l0
	add	%i1, 3, %i1
	b	.L965
	 stb	%l5, [%l0+%g1]
.L1115:
	ld	[%i0+8], %g1
	add	%i1, 3, %o7
	stb	%l0, [%g1+%g3]
	ld	[%i0+12], %g1
	b	.L764
	 ld	[%i0+16], %g4
.L766:
	ld	[%i0+8], %o0
	stb	%l0, [%o0+%g1]
	ld	[%i0+12], %l7
	b	.L765
	 ld	[%i0+16], %g4
.L1113:
	ld	[%i0+8], %g1
	stb	%l0, [%g1+%l7]
	ld	[%i0+12], %g1
	b	.L1008
	 ld	[%i0+16], %g4
.L1114:
	ld	[%i0+8], %o5
	stb	%l0, [%o5+%g1]
	ld	[%i0+12], %g3
	b	.L1009
	 ld	[%i0+16], %g4
.L786:
	ld	[%i0+8], %o7
	mov	32, %g4
	b	.L785
	 stb	%g4, [%o7+%g1]
.L797:
	ld	[%i0+8], %l5
	b	.L796
	 stb	%l0, [%l5+%g1]
.L1104:
	ld	[%i0+8], %o4
	b	.L899
	 stb	%l0, [%o4+%g1]
.L1105:
	ld	[%i0+8], %o7
	b	.L902
	 stb	%l0, [%o7+%g1]
.L1096:
	ld	[%i0+8], %o4
	mov	32, %g2
	b	.L920
	 stb	%g2, [%o4+%g1]
.L1097:
	ld	[%i0+8], %o7
	mov	32, %g3
	b	.L923
	 stb	%g3, [%o7+%g1]
.L1098:
	ld	[%i0+8], %o1
	mov	32, %o4
	add	%l7, 3, %l1
	b	.L966
	 stb	%o4, [%o1+%g1]
.L1106:
	ld	[%i0+8], %i1
	add	%l1, 3, %l1
	b	.L967
	 stb	%l0, [%i1+%g1]
.L805:
	bne,a	.L1149
	 st	%l7, [%g1]
	andcc	%i3, 1024, %g0
	be,a	.L807
	 st	%l7, [%g1]
	st	%g0, [%g1]
	st	%l7, [%g1+4]
	b	.L1011
	 add	%i5, 1, %i1
.L807:
.L1149:
	b	.L1011
	 add	%i5, 1, %i1
.L802:
	ld	[%i0+8], %o0
	mov	37, %g2
	add	%i5, 1, %i1
	b	.L1011
	 stb	%g2, [%o0+%g1]
.L809:
	ld	[%i0+8], %o7
	add	%i5, 1, %i1
	b	.L1011
	 stb	%g1, [%o7+%g4]
.L769:
	b	.L768
	 stb	%o4, [%o0+%g1]
.L1111:
	mov	%o2, %g1
	b	.L764
	 mov	%i3, %o7
.L746:
	bne,a	.L1119
	 ldsb	[%i2+3], %l7
	andcc	%i3, 128, %g0
	be,a	.L751
	 ld	[%i2], %l7
	ldsh	[%i2+2], %l7
	add	%i2, 4, %i2
.L750:
	cmp	%l7, 0
	ble	.L752
	 sra	%l7, 31, %g2
	st	%l7, [%fp-52]
	st	%g2, [%fp-56]
.L753:
	st	%i4, [%sp+92]
	st	%i3, [%sp+96]
	mov	%i0, %o0
	ld	[%fp-56], %o1
	ld	[%fp-52], %o2
	srl	%l7, 31, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L1120
	 ldsb	[%i1], %o0
.L1109:
	b	.L1034
	 mov	%o7, %g1
.L1107:
	b	.L1031
	 mov	%o0, %g1
.L1118:
	b	.L757
	 add	%i2, 4, %i2
.L1119:
	b	.L750
	 add	%i2, 4, %i2
.L747:
	sra	%g4, 31, %g3
	st	%g4, [%fp-60]
	st	%g3, [%fp-64]
	ldd	[%fp-64], %g2
	subcc	%g0, %g3, %g3
	subx	%g0, %g2, %g2
	b	.L748
	 std	%g2, [%fp-48]
.L1090:
	mov	%i2, %o1
	add	%fp, -32, %o0
	call	memcpy, 0
	 mov	8, %o2
	ldd	[%fp-32], %g2
	sra	%g2, 31, %g1
	st	%g1, [%fp-36]
	st	%g1, [%fp-40]
	ldd	[%fp-40], %o4
	xor	%o5, %g3, %o2
	subcc	%o2, %o5, %i5
	xor	%o4, %g2, %l5
	st	%i3, [%sp+96]
	add	%i2, 8, %i2
	subx	%l5, %o4, %i3
	st	%i4, [%sp+92]
	mov	%i0, %o0
	srl	%g2, 31, %o3
	and	%l1, 26, %o4
	mov	%i3, %o1
	mov	%i5, %o2
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L1120
	 ldsb	[%i1], %o0
.L1116:
	mov	%i2, %o1
	add	%fp, -24, %o0
	call	memcpy, 0
	 mov	8, %o2
	add	%i2, 8, %i2
	st	%i4, [%sp+92]
	st	%i5, [%sp+96]
	mov	%i0, %o0
	ld	[%fp-24], %o1
	ld	[%fp-20], %o2
	mov	0, %o3
	and	%l1, 26, %o4
	call	print_integer, 0
	 mov	%l0, %o5
	b	.L1120
	 ldsb	[%i1], %o0
.L1110:
	ld	[%i0+8], %g4
	stb	%l0, [%g4+%g1]
	ld	[%i0+12], %g1
	b	.L1034
	 ld	[%i0+16], %g4
.L1108:
	ld	[%i0+8], %o5
	stb	%l0, [%o5+%g1]
	ld	[%i0+12], %g1
	b	.L1031
	 ld	[%i0+16], %g4
.L1084:
	ld	[%i0+8], %g4
	b	.L848
	 stb	%l5, [%g4+%g1]
.L1083:
	ld	[%i0+8], %g1
	b	.L845
	 stb	%l5, [%g1+%g2]
.L1112:
	ld	[%i0+8], %o1
	mov	%i3, %o7
	stb	%l0, [%o1+%g1]
	ld	[%i0+12], %g1
	b	.L764
	 ld	[%i0+16], %g4
.L1085:
	ld	[%i0+8], %o1
	add	%i1, 1, %i1
	b	.L965
	 stb	%l5, [%o1+%g1]
.L1103:
	ld	[%i0+8], %o0
	add	%l1, 1, %l1
	b	.L967
	 stb	%l0, [%o0+%g1]
.L1095:
	mov	32, %g4
	b	.L966
	 stb	%g4, [%g1+%o0]
.L1094:
	ld	[%i0+8], %g1
	mov	32, %l7
	b	.L971
	 stb	%l7, [%g1+%o5]
.L1093:
	mov	32, %o4
	b	.L908
	 stb	%o4, [%o3+%o0]
.L1102:
	ld	[%i0+8], %o5
	b	.L890
	 stb	%l0, [%o5+%g1]
.L1101:
	ld	[%i0+8], %o1
	b	.L887
	 stb	%l0, [%o1+%g1]
.L1117:
	ld	[%i2], %o2
	st	%i4, [%sp+92]
	b	.L1073
	 add	%i2, 4, %i2
.L1091:
	mov	%i0, %o0
	mov	%l6, %o1
	mov	6, %o2
	mov	%i4, %o3
	mov	%i3, %o4
	call	out_rev_, 0
	 add	%i5, 1, %i1
	b	.L1120
	 ldsb	[%i1], %o0
.L752:
	st	%l7, [%fp-68]
	sra	%l7, 31, %g1
	st	%g1, [%fp-72]
	ldd	[%fp-72], %g2
	subcc	%g0, %g3, %g3
	subx	%g0, %g2, %g2
	b	.L753
	 std	%g2, [%fp-56]
.L751:
	b	.L750
	 add	%i2, 4, %i2
	.align 4
	.subsection	-1
	.align 4
.L737:
	.word	.L729
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L730
	.word	.L731
	.word	.L730
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L732
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L732
	.word	.L733
	.word	.L732
	.word	.L730
	.word	.L731
	.word	.L730
	.word	.L728
	.word	.L732
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L728
	.word	.L734
	.word	.L732
	.word	.L735
	.word	.L728
	.word	.L728
	.word	.L736
	.word	.L728
	.word	.L732
	.word	.L728
	.word	.L728
	.word	.L732
	.previous
	.subsection	-1
	.align 4
.L708:
	.word	.L703
	.word	.L702
	.word	.L702
	.word	.L704
	.word	.L702
	.word	.L702
	.word	.L702
	.word	.L702
	.word	.L702
	.word	.L702
	.word	.L702
	.word	.L705
	.word	.L702
	.word	.L706
	.word	.L702
	.word	.L702
	.word	.L707
	.previous
	.subsection	-1
	.align 4
.L725:
	.word	.L720
	.word	.L719
	.word	.L721
	.word	.L719
	.word	.L722
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L724
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L719
	.word	.L724
	.previous
	.size	_vsnprintf, .-_vsnprintf
	.align 4
	.global uart_send_char
	.type	uart_send_char, #function
	.proc	020
uart_send_char:
	save	%sp, -96, %sp
.L1152:
	call	__ajit_serial_putchar_via_vmap__, 0
	 mov	%i0, %o0
	cmp	%o0, 0
	be	.L1152
	 nop
.L1158:
	call	__ajit_read_serial_control_register_via_vmap__, 0
	 nop
	and	%o0, 9, %o0
	cmp	%o0, 9
	be	.L1158
	 nop
	jmp	%i7+8
	 restore
	.size	uart_send_char, .-uart_send_char
	.align 4
	.global vprintf_
	.type	vprintf_, #function
	.proc	04
vprintf_:
	save	%sp, -120, %sp
	sethi	%hi(putchar_wrapper), %g1
	or	%g1, %lo(putchar_wrapper), %g1
	st	%g1, [%fp-20]
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
	mov	%i0, %o1
	st	%g0, [%fp-16]
	st	%g0, [%fp-12]
	st	%g0, [%fp-8]
	add	%fp, -20, %o0
	st	%g1, [%fp-4]
	call	_vsnprintf, 0
	 mov	%i1, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	vprintf_, .-vprintf_
	.align 4
	.global vsnprintf_
	.type	vsnprintf_, #function
	.proc	04
vsnprintf_:
	save	%sp, -120, %sp
	cmp	%i1, 0
	bl	.L1167
	 subcc	%g0, %i0, %g0
	subx	%g0, 0, %g1
	and	%i1, %g1, %g2
	st	%i0, [%fp-12]
	st	%g0, [%fp-20]
	st	%g0, [%fp-16]
	st	%g0, [%fp-8]
	st	%g2, [%fp-4]
	add	%fp, -20, %o0
	mov	%i2, %o1
	call	_vsnprintf, 0
	 mov	%i3, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
.L1167:
	sethi	%hi(2147482624), %i1
	subx	%g0, 0, %g1
	or	%i1, 1023, %i1
	and	%i1, %g1, %g2
	st	%i0, [%fp-12]
	st	%g0, [%fp-20]
	st	%g0, [%fp-16]
	st	%g0, [%fp-8]
	st	%g2, [%fp-4]
	add	%fp, -20, %o0
	mov	%i2, %o1
	call	_vsnprintf, 0
	 mov	%i3, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	vsnprintf_, .-vsnprintf_
	.align 4
	.global vsprintf_
	.type	vsprintf_, #function
	.proc	04
vsprintf_:
	mov	%o2, %o3
	mov	%o1, %o2
	sethi	%hi(2147482624), %o1
	or	%o1, 1023, %o1
	or	%o7, %g0, %g1
	call	vsnprintf_, 0
	 or	%g1, %g0, %o7
	.size	vsprintf_, .-vsprintf_
	.align 4
	.global vfctprintf
	.type	vfctprintf, #function
	.proc	04
vfctprintf:
	save	%sp, -120, %sp
	sethi	%hi(2147482624), %g1
	or	%g1, 1023, %g1
	st	%i0, [%fp-20]
	st	%i1, [%fp-16]
	st	%g0, [%fp-12]
	st	%g0, [%fp-8]
	add	%fp, -20, %o0
	mov	%i2, %o1
	st	%g1, [%fp-4]
	call	_vsnprintf, 0
	 mov	%i3, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	vfctprintf, .-vfctprintf
	.align 4
	.global printf_
	.type	printf_, #function
	.proc	04
printf_:
	save	%sp, -104, %sp
	add	%fp, 72, %o1
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o1, [%fp-4]
	call	vprintf_, 0
	 mov	%i0, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	printf_, .-printf_
	.align 4
	.global sprintf_
	.type	sprintf_, #function
	.proc	04
sprintf_:
	save	%sp, -104, %sp
	add	%fp, 76, %o2
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o2, [%fp-4]
	mov	%i0, %o0
	call	vsprintf_, 0
	 mov	%i1, %o1
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	sprintf_, .-sprintf_
	.align 4
	.global snprintf_
	.type	snprintf_, #function
	.proc	04
snprintf_:
	save	%sp, -104, %sp
	add	%fp, 80, %o3
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o3, [%fp-4]
	mov	%i0, %o0
	mov	%i1, %o1
	call	vsnprintf_, 0
	 mov	%i2, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	snprintf_, .-snprintf_
	.align 4
	.global fctprintf
	.type	fctprintf, #function
	.proc	04
fctprintf:
	save	%sp, -104, %sp
	add	%fp, 80, %o3
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	st	%o3, [%fp-4]
	mov	%i0, %o0
	mov	%i1, %o1
	call	vfctprintf, 0
	 mov	%i2, %o2
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	fctprintf, .-fctprintf
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
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
