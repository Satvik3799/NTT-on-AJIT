	.file	"ajit_mmap.c"
	.section	".text"
	.align 4
	.global initPageTableAllocator
	.type	initPageTableAllocator, #function
	.proc	020
initPageTableAllocator:
	save	%sp, -96, %sp
	mov	%i3, %l0
	mov	%i2, %i3
	cmp	%l0, 0
	mov	%i1, %i2
	be	.L4
	 mov	0, %i1
	add	%l0, -1, %g1
	srl	%g1, 2, %g1
	mov	0, %o0
	mov	%i2, %o1
	mov	%i3, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 and	%g1, 7, %l1
	mov	0, %i4
	cmp	%l0, 4
	bleu	.L4
	 mov	4, %i5
	cmp	%l1, 0
	be	.L7
	 cmp	%l1, 1
	be	.L33
	 cmp	%l1, 2
	be	.L34
	 cmp	%l1, 3
	be	.L35
	 cmp	%l1, 4
	be	.L36
	 cmp	%l1, 5
	be	.L37
	 cmp	%l1, 6
	be,a	.L52
	 addcc	%i5, %i3, %o2
	addcc	%i5, %i3, %g3
	addx	%i4, %i2, %g2
	mov	0, %o0
	mov	%g2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%g3, %o2
	addcc	%i5, 4, %g4
	addx	%i4, 0, %o0
	mov	%g4, %i5
	cmp	%i1, %o0
	bne	.L4
	 mov	%o0, %i4
	addcc	%i5, %i3, %o2
.L52:
	mov	0, %o0
	call	__ajit_store_word_to_physical_address__, 0
	 addx	%i4, %i2, %o1
	addcc	%i5, 4, %o3
	addx	%i4, 0, %o4
	mov	%o3, %i5
	cmp	%i1, %o4
	bne	.L4
	 mov	%o4, %i4
.L37:
	addcc	%i5, %i3, %o5
	addx	%i4, %i2, %o7
	mov	0, %o0
	mov	%o7, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%o5, %o2
	addcc	%i5, 4, %i5
	addx	%i4, 0, %i4
	cmp	%i1, %i4
	bne,a	.L53
	 std	%i2, [%i0]
.L36:
	addcc	%i5, %i3, %g1
	mov	0, %o0
	addx	%i4, %i2, %l1
	mov	%g1, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%l1, %o1
	addcc	%i5, 4, %g3
	addx	%i4, 0, %g2
	mov	%g3, %i5
	cmp	%i1, %g2
	bne	.L4
	 mov	%g2, %i4
.L35:
	addcc	%i5, %i3, %g4
	addx	%i4, %i2, %o2
	mov	0, %o0
	mov	%o2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%g4, %o2
	addcc	%i5, 4, %o0
	addx	%i4, 0, %o1
	mov	%o0, %i5
	cmp	%i1, %o1
	bne	.L4
	 mov	%o1, %i4
.L34:
	addcc	%i5, %i3, %o3
	addx	%i4, %i2, %o4
	mov	0, %o0
	mov	%o4, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%o3, %o2
	addcc	%i5, 4, %o5
	addx	%i4, 0, %i5
	mov	%i5, %i4
	cmp	%i1, %i4
	bne	.L4
	 mov	%o5, %i5
.L33:
	addcc	%i5, %i3, %o7
	addx	%i4, %i2, %g1
	mov	0, %o0
	mov	%o7, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%g1, %o1
	addcc	%i5, 4, %o0
.L50:
	addx	%i4, 0, %i4
	cmp	%i1, %i4
	bne	.L4
	 mov	%o0, %i5
	cmp	%l0, %o0
	bleu,a	.L53
	 std	%i2, [%i0]
.L7:
	addcc	%i5, %i3, %l1
	addx	%i4, %i2, %g3
	mov	0, %o0
	mov	%g3, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%l1, %o2
	addcc	%i5, 4, %g4
	addx	%i4, 0, %g2
	cmp	%i1, %g2
	bne	.L4
	 mov	0, %o0
	addcc	%g4, %i3, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 addx	%g2, %i2, %o1
	addcc	%i5, 8, %o3
	addx	%i4, 0, %o4
	cmp	%i1, %o4
	bne	.L4
	 mov	0, %o0
	addcc	%o3, %i3, %o5
	addx	%o4, %i2, %o7
	mov	%o7, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%o5, %o2
	addcc	%i5, 12, %g1
	addx	%i4, 0, %l1
	cmp	%i1, %l1
	bne	.L4
	 mov	0, %o0
	addcc	%g1, %i3, %g3
	addx	%l1, %i2, %g4
	mov	%g3, %o2
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%g4, %o1
	addcc	%i5, 16, %o2
	addx	%i4, 0, %g2
	cmp	%i1, %g2
	bne	.L4
	 mov	0, %o0
	addcc	%o2, %i3, %o3
	addx	%g2, %i2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%o3, %o2
	addcc	%i5, 20, %o4
	addx	%i4, 0, %g1
	cmp	%i1, %g1
	bne	.L4
	 mov	0, %o0
	addcc	%o4, %i3, %o5
	addx	%g1, %i2, %o7
	mov	%o7, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%o5, %o2
	addcc	%i5, 24, %l1
	addx	%i4, 0, %g3
	cmp	%i1, %g3
	bne	.L4
	 mov	0, %o0
	addcc	%l1, %i3, %g4
	addx	%g3, %i2, %o2
	mov	%o2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%g4, %o2
	addcc	%i5, 28, %o3
	addx	%i4, 0, %g2
	cmp	%i1, %g2
	bne	.L4
	 mov	0, %o0
	addcc	%o3, %i3, %g1
	addx	%g2, %i2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%g1, %o2
	b	.L50
	 addcc	%i5, 32, %o0
.L4:
	std	%i2, [%i0]
.L53:
	st	%g0, [%i0+8]
	st	%l0, [%i0+12]
	st	%g0, [%i0+16]
	st	%g0, [%i0+20]
	jmp	%i7+8
	 restore
	.size	initPageTableAllocator, .-initPageTableAllocator
	.align 4
	.global allocatePageTableBlock
	.type	allocatePageTableBlock, #function
	.proc	016
allocatePageTableBlock:
	save	%sp, -96, %sp
	mov	0, %i4
	cmp	%i1, 1
	bleu	.L64
	 mov	256, %i5
.L55:
	ldd	[%i0+16], %o0
	addcc	%i5, %o1, %g3
	ldd	[%i0], %o2
	addx	%i4, %o0, %g2
	addcc	%i5, %o3, %o5
	addx	%i4, %o2, %o4
	cmp	%g2, %o4
	bgu	.L59
	 nop
	be	.L62
	 cmp	%g3, %o5
	std	%o0, [%i2]
.L63:
	std	%g2, [%i0+16]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L62:
	bleu,a	.L63
	 std	%o0, [%i2]
.L59:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L64:
	b	.L55
	 mov	1024, %i5
	.size	allocatePageTableBlock, .-allocatePageTableBlock
	.align 4
	.global ajit_mmap_index_into_table
	.type	ajit_mmap_index_into_table, #function
	.proc	016
ajit_mmap_index_into_table:
	cmp	%o0, 2
	be	.L68
	 cmp	%o0, 3
	be	.L69
	 cmp	%o0, 1
	be	.L72
	 nop
	jmp	%o7+8
	 mov	0, %o0
.L72:
	jmp	%o7+8
	 srl	%o1, 24, %o0
.L69:
	srl	%o1, 12, %o0
	jmp	%o7+8
	 and	%o0, 63, %o0
.L68:
	srl	%o1, 18, %g1
	jmp	%o7+8
	 and	%g1, 63, %o0
	.size	ajit_mmap_index_into_table, .-ajit_mmap_index_into_table
	.align 4
	.global ajit_mmap_is_pte
	.type	ajit_mmap_is_pte, #function
	.proc	014
ajit_mmap_is_pte:
	and	%o0, 3, %o0
	xor	%o0, 2, %g1
	subcc	%g0, %g1, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	ajit_mmap_is_pte, .-ajit_mmap_is_pte
	.align 4
	.global ajit_mmap_is_ptd
	.type	ajit_mmap_is_ptd, #function
	.proc	014
ajit_mmap_is_ptd:
	and	%o0, 3, %o0
	xor	%o0, 1, %g1
	subcc	%g0, %g1, %g0
	jmp	%o7+8
	 subx	%g0, -1, %o0
	.size	ajit_mmap_is_ptd, .-ajit_mmap_is_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_ptd
	.type	ajit_mmap_get_phy_addr_from_ptd, #function
	.proc	017
ajit_mmap_get_phy_addr_from_ptd:
	and	%o0, -4, %o0
	sll	%o2, 2, %o2
	srl	%o0, 28, %g2
	sll	%o0, 4, %g3
	mov	0, %g1
	or	%o2, %g3, %o1
	or	%g1, %g2, %g4
	jmp	%o7+8
	 mov	%g4, %o0
	.size	ajit_mmap_get_phy_addr_from_ptd, .-ajit_mmap_get_phy_addr_from_ptd
	.align 4
	.global ajit_mmap_get_phy_addr_from_pte
	.type	ajit_mmap_get_phy_addr_from_pte, #function
	.proc	017
ajit_mmap_get_phy_addr_from_pte:
	cmp	%o1, 3
	be	.L81
	 cmp	%o1, 2
	be	.L82
	 mov	0, %g4
	cmp	%o1, 1
	be	.L83
	 mov	%o2, %o5
	srl	%o0, 8, %g1
	srl	%o0, 28, %o0
	sll	%g1, 12, %o2
	or	%g4, %o0, %o4
	or	%o5, %o2, %o5
	mov	%o4, %o0
	jmp	%o7+8
	 mov	%o5, %o1
.L81:
	and	%o2, 4095, %o1
	srl	%o0, 8, %g1
	srl	%o0, 28, %o0
	mov	%o1, %o5
	mov	0, %g4
	sll	%g1, 12, %o2
	or	%g4, %o0, %o4
	or	%o5, %o2, %o5
	mov	%o4, %o0
	jmp	%o7+8
	 mov	%o5, %o1
.L82:
	srl	%o0, 8, %g1
	srl	%o0, 28, %o0
	sethi	%hi(-16384), %g2
	andn	%o2, %g2, %g3
	or	%g4, %o0, %o4
	mov	%g3, %o5
	sll	%g1, 12, %o2
	mov	%o4, %o0
	or	%o5, %o2, %o5
	jmp	%o7+8
	 mov	%o5, %o1
.L83:
	sethi	%hi(-16777216), %o4
	andn	%o2, %o4, %g1
	mov	%g1, %o5
	srl	%o0, 8, %g1
	srl	%o0, 28, %o0
	mov	0, %g4
	sll	%g1, 12, %o2
	or	%g4, %o0, %o4
	or	%o5, %o2, %o5
	mov	%o4, %o0
	jmp	%o7+8
	 mov	%o5, %o1
	.size	ajit_mmap_get_phy_addr_from_pte, .-ajit_mmap_get_phy_addr_from_pte
	.align 4
	.global ajit_mmap_make_ptd
	.type	ajit_mmap_make_ptd, #function
	.proc	016
ajit_mmap_make_ptd:
	srl	%o2, 6, %o2
	sll	%o1, 26, %g1
	or	%g1, %o2, %g4
	sll	%g4, 2, %g3
	jmp	%o7+8
	 or	%g3, 1, %o0
	.size	ajit_mmap_make_ptd, .-ajit_mmap_make_ptd
	.align 4
	.global ajit_mmap_make_pte
	.type	ajit_mmap_make_pte, #function
	.proc	016
ajit_mmap_make_pte:
	sll	%o1, 2, %o1
	sll	%o3, 20, %o3
	or	%o1, 2, %g1
	srl	%o4, 12, %o4
	or	%o3, %o4, %g2
	sll	%g2, 8, %o0
	jmp	%o7+8
	 or	%g1, %o0, %o0
	.size	ajit_mmap_make_pte, .-ajit_mmap_make_pte
	.align 4
	.global ajit_lookup_mmap
	.type	ajit_lookup_mmap, #function
	.proc	04
ajit_lookup_mmap:
	save	%sp, -96, %sp
	stb	%g0, [%i4]
	st	%g0, [%i5]
	st	%g0, [%i5+4]
	ld	[%fp+92], %l6
	srl	%i3, 24, %l0
	st	%g0, [%l6]
	sll	%l0, 2, %g1
	st	%g0, [%l6+4]
	srl	%i3, 16, %l2
	srl	%i3, 10, %l4
	and	%l2, 252, %g2
	and	%l4, 252, %g3
	sll	%i2, 2, %i2
	addcc	%i1, %i2, %i1
	ld	[%fp+96], %l7
	addx	%i0, 0, %i0
	st	%g0, [%l7]
	mov	%i0, %o0
	mov	%g1, %l1
	mov	%g2, %l3
	mov	%i1, %o1
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%g3, %l5
	stb	%g0, [%i4]
	std	%i0, [%l6]
	st	%o0, [%l7]
	and	%o0, 3, %i0
	mov	0, %l0
	mov	0, %l2
	cmp	%i0, 1
	bne	.L87
	 mov	0, %l4
	and	%o0, -4, %o0
	srl	%o0, 28, %o1
	sll	%o0, 4, %o2
	or	%l0, %o1, %l0
	or	%l1, %o2, %l1
	mov	%l0, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l1, %o1
	stb	%i0, [%i4]
	std	%l0, [%l6]
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L88
	 st	%o0, [%l7]
	and	%o0, -4, %o3
	srl	%o3, 28, %o4
	sll	%o3, 4, %o5
	or	%l2, %o4, %l2
	or	%l3, %o5, %l3
	mov	%l2, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l3, %o1
	mov	2, %g1
	stb	%g1, [%i4]
	std	%l2, [%l6]
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L89
	 st	%o0, [%l7]
	and	%o0, -4, %o7
	srl	%o7, 28, %i1
	sll	%o7, 4, %i2
	or	%l4, %i1, %l4
	or	%l5, %i2, %l5
	mov	%l4, %o0
	call	__ajit_load_word_from_physical_address__, 0
	 mov	%l5, %o1
	mov	3, %g1
	stb	%g1, [%i4]
	std	%l4, [%l6]
	st	%o0, [%l7]
	and	%o0, 3, %g1
	cmp	%g1, 1
	bne	.L102
	 mov	1, %i0
.L103:
	jmp	%i7+8
	 restore
.L102:
	cmp	%g1, 2
	bne	.L103
	 and	%i3, 4095, %i3
	mov	0, %g4
.L92:
	srl	%o0, 8, %g1
.L104:
	srl	%o0, 28, %i4
	sll	%g1, 12, %l6
	or	%g4, %i4, %g2
	or	%i3, %l6, %g3
	std	%g2, [%i5]
	jmp	%i7+8
	 restore %g0, 0, %o0
.L89:
	cmp	%g1, 2
	be	.L96
	 sethi	%hi(-16384), %g1
.L101:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L96:
	mov	0, %g4
	b	.L92
	 andn	%i3, %g1, %i3
.L88:
	cmp	%g1, 2
	bne	.L101
	 sethi	%hi(-16777216), %g1
	mov	0, %g4
	b	.L92
	 andn	%i3, %g1, %i3
.L87:
	cmp	%i0, 2
	bne	.L101
	 mov	0, %g4
	b	.L104
	 srl	%o0, 8, %g1
	.size	ajit_lookup_mmap, .-ajit_lookup_mmap
	.align 4
	.global ajit_mmap_operation
	.type	ajit_mmap_operation, #function
	.proc	04
ajit_mmap_operation:
	save	%sp, -128, %sp
	add	%fp, -16, %g1
	st	%g1, [%sp+92]
	add	%fp, -20, %g1
	ld	[%fp+96], %l6
	mov	%i1, %o0
	mov	%i2, %o1
	ld	[%fp+100], %l4
	ld	[%fp+104], %i2
	ldub	[%fp+95], %l5
	st	%g1, [%sp+96]
	mov	%i4, %o2
	mov	%l6, %o3
	add	%fp, -21, %o4
	add	%fp, -8, %o5
	call	ajit_lookup_mmap, 0
	 mov	%i5, %i1
	cmp	%o0, 0
	bne	.L106
	 cmp	%i3, 1
	be	.L128
	 cmp	%i3, 2
	bne	.L108
	 ld	[%fp-20], %o0
	st	%g0, [%fp-20]
	mov	0, %o0
.L108:
	ld	[%fp-16], %o1
	ld	[%fp-12], %o2
	call	__ajit_store_word_to_physical_address__, 0
	 mov	0, %i0
	jmp	%i7+8
	 restore
.L106:
	be	.L111
	 ldub	[%fp-21], %g4
.L112:
	jmp	%i7+8
	 restore %g0, 0, %o0
.L111:
	and	%g4, 0xff, %g2
	cmp	%g2, %i5
	bgu	.L112
	 ldd	[%fp-16], %l2
	sll	%l4, 20, %g3
	srl	%i2, 12, %o0
	sll	%l5, 2, %g1
	srl	%l6, 24, %o1
	or	%g1, 2, %g1
	or	%g3, %o0, %o2
	srl	%l6, 16, %o3
	sll	%o2, 8, %o4
	srl	%l6, 10, %o5
	or	%g1, %o4, %l0
	sll	%o1, 2, %l4
	and	%o3, 252, %i2
	b	.L121
	 and	%o5, 252, %i3
.L131:
	bne	.L132
	 and	%g4, 0xff, %g4
	cmp	%o5, %l5
	bgu	.L123
	 nop
.L132:
	cmp	%g4, %i1
	be	.L129
	 std	%o4, [%i0+16]
	sll	%i4, 26, %g3
	srl	%i5, 6, %g1
	or	%g3, %g1, %o0
	sll	%o0, 2, %o1
	or	%o1, 1, %o2
	mov	%o2, %o0
	st	%o2, [%fp-20]
.L116:
	mov	%l2, %o1
	call	__ajit_store_word_to_physical_address__, 0
	 mov	%l3, %o2
	mov	0, %l2
	cmp	%l6, 2
	be	.L117
	 mov	%i2, %l3
	cmp	%l6, 3
	be	.L117
	 mov	%i3, %l3
	cmp	%l6, 1
	be	.L117
	 mov	%l4, %l3
	mov	0, %l3
.L117:
	addcc	%l3, %i5, %l3
	addx	%l2, %i4, %l2
	cmp	%l6, %i1
	bgu	.L112
	 mov	%l7, %g4
.L121:
	add	%g4, 1, %l7
	mov	0, %o7
	and	%l7, 0xff, %l6
	cmp	%l6, 1
	bleu	.L133
	 mov	256, %l1
.L113:
	ldd	[%i0+16], %i4
	addcc	%l1, %i5, %o5
	ldd	[%i0], %o0
	addx	%o7, %i4, %o4
	addcc	%l1, %o1, %l5
	addx	%o7, %o0, %g2
	cmp	%o4, %g2
	bleu	.L131
	 nop
.L123:
	jmp	%i7+8
	 restore %g0, 1, %o0
.L128:
	sll	%l5, 2, %i0
	sll	%l4, 20, %i4
	srl	%i2, 12, %i1
	or	%i4, %i1, %o3
	sll	%o3, 8, %o4
	or	%i0, 2, %i5
	ld	[%fp-16], %o1
	or	%i5, %o4, %o0
	ld	[%fp-12], %o2
	st	%o0, [%fp-20]
	call	__ajit_store_word_to_physical_address__, 0
	 mov	0, %i0
	jmp	%i7+8
	 restore
.L133:
	b	.L113
	 mov	1024, %l1
.L129:
	st	%l0, [%fp-20]
	b	.L116
	 mov	%l0, %o0
	.size	ajit_mmap_operation, .-ajit_mmap_operation
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
