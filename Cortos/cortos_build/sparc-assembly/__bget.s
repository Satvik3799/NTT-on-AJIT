	.file	"__bget.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.section	".data"
	.align 4
	.type	freelist, #object
	.size	freelist, 16
freelist:
	.long	0
	.long	0
	.long	freelist
	.long	freelist
	.section	".text"
	.align 4
	.global bget
	.type	bget, #function
	.proc	0120
bget:
.LFB0:
	.file 1 "cortos_src/__bget.c"
	.loc 1 173 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 174 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 186 0
	ld	[%fp-4], %g1
	cmp	%g1, 7
	bgu	.L2
	 nop
	.loc 1 187 0
	mov	8, %g1
	st	%g1, [%fp-4]
.L2:
	.loc 1 191 0
	ld	[%fp-4], %g1
	add	%g1, 7, %g1
	and	%g1, -8, %g1
	st	%g1, [%fp-4]
	.loc 1 195 0
	ld	[%fp-4], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp-4]
	.loc 1 205 0
	sethi	%hi(freelist), %g1
	or	%g1, %lo(freelist), %g1
	ld	[%g1+8], %g1
	st	%g1, [%fp-8]
	.loc 1 226 0
	b	.L3
	 nop
.L7:
	.loc 1 227 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g2
	ld	[%fp-4], %g1
	cmp	%g2, %g1
	bl	.L4
	 nop
	.loc 1 238 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g1
	cmp	%g1, 16
	bleu	.L5
	 nop
.LBB2:
	.loc 1 241 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-12]
	.loc 1 242 0
	ld	[%fp-4], %g1
	ld	[%fp-12], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-16]
	.loc 1 245 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g2
	ld	[%fp-8], %g1
	st	%g2, [%g1+4]
	.loc 1 247 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g2
	ld	[%fp-12], %g1
	st	%g2, [%g1]
	.loc 1 249 0
	ld	[%fp-4], %g1
	sub	%g0, %g1, %g2
	ld	[%fp-12], %g1
	st	%g2, [%g1+4]
	.loc 1 251 0
	ld	[%fp-16], %g1
	st	%g0, [%g1]
	.loc 1 257 0
	ld	[%fp-12], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp-20]
	.loc 1 258 0
	ld	[%fp-20], %g1
	b	.L6
	 nop
.L5:
.LBE2:
.LBB3:
	.loc 1 262 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-24]
	.loc 1 270 0
	ld	[%fp-8], %g1
	ld	[%g1+12], %g1
	ld	[%fp-8], %g2
	ld	[%g2+8], %g2
	st	%g2, [%g1+8]
	.loc 1 271 0
	ld	[%fp-8], %g1
	ld	[%g1+8], %g1
	ld	[%fp-8], %g2
	ld	[%g2+12], %g2
	st	%g2, [%g1+12]
	.loc 1 278 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g1
	sub	%g0, %g1, %g2
	ld	[%fp-8], %g1
	st	%g2, [%g1+4]
	.loc 1 282 0
	ld	[%fp-24], %g1
	st	%g0, [%g1]
	.loc 1 285 0
	ld	[%fp-8], %g1
	add	%g1, 8, %g1
	st	%g1, [%fp-20]
	.loc 1 286 0
	ld	[%fp-20], %g1
	b	.L6
	 nop
.L4:
.LBE3:
	.loc 1 289 0
	ld	[%fp-8], %g1
	ld	[%g1+8], %g1
	st	%g1, [%fp-8]
.L3:
	.loc 1 226 0 discriminator 1
	ld	[%fp-8], %g2
	sethi	%hi(freelist), %g1
	or	%g1, %lo(freelist), %g1
	cmp	%g2, %g1
	bne	.L7
	 nop
	.loc 1 350 0
	mov	0, %g1
.L6:
	.loc 1 351 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	bget, .-bget
	.align 4
	.global bpool
	.type	bpool, #function
	.proc	020
bpool:
.LFB1:
	.loc 1 359 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 360 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 364 0
	ld	[%fp+72], %g1
	and	%g1, -8, %g1
	st	%g1, [%fp+72]
	.loc 1 389 0
	ld	[%fp-4], %g1
	st	%g0, [%g1]
	.loc 1 395 0
	ld	[%fp-4], %g1
	sethi	%hi(freelist), %g2
	or	%g2, %lo(freelist), %g2
	st	%g2, [%g1+8]
	.loc 1 396 0
	sethi	%hi(freelist), %g1
	or	%g1, %lo(freelist), %g1
	ld	[%g1+12], %g2
	ld	[%fp-4], %g1
	st	%g2, [%g1+12]
	.loc 1 397 0
	sethi	%hi(freelist), %g1
	or	%g1, %lo(freelist), %g1
	ld	[%fp-4], %g2
	st	%g2, [%g1+12]
	.loc 1 398 0
	ld	[%fp-4], %g1
	ld	[%g1+12], %g1
	ld	[%fp-4], %g2
	st	%g2, [%g1+8]
	.loc 1 408 0
	ld	[%fp+72], %g1
	add	%g1, -8, %g1
	st	%g1, [%fp+72]
	.loc 1 409 0
	ld	[%fp-4], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1+4]
	.loc 1 414 0
	ld	[%fp+72], %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 415 0
	ld	[%fp-8], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1]
	.loc 1 418 0
	ld	[%fp-8], %g1
	sethi	%hi(-2147483648), %g2
	st	%g2, [%g1+4]
	.loc 1 419 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	bpool, .-bpool
	.align 4
	.global brel
	.type	brel, #function
	.proc	020
brel:
.LFB2:
	.loc 1 426 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 429 0
	ld	[%fp+68], %g1
	add	%g1, -8, %g1
	st	%g1, [%fp-4]
	.loc 1 459 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g1
	cmp	%g1, 0
	bl	.L10
	 nop
	.loc 1 460 0
	st	%g0, [%fp-8]
.L10:
	.loc 1 476 0
	ld	[%fp-4], %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	be	.L11
	 nop
.LBB4:
	.loc 1 484 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %i5
	.loc 1 488 0
	ld	[%fp-4], %g1
	ld	[%g1], %g1
	sub	%g0, %g1, %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 489 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g1
	sub	%g1, %i5, %g2
	ld	[%fp-4], %g1
	st	%g2, [%g1+4]
	b	.L12
	 nop
.L11:
.LBE4:
	.loc 1 497 0
	ld	[%fp-4], %g1
	sethi	%hi(freelist), %g2
	or	%g2, %lo(freelist), %g2
	st	%g2, [%g1+8]
	.loc 1 498 0
	sethi	%hi(freelist), %g1
	or	%g1, %lo(freelist), %g1
	ld	[%g1+12], %g2
	ld	[%fp-4], %g1
	st	%g2, [%g1+12]
	.loc 1 499 0
	sethi	%hi(freelist), %g1
	or	%g1, %lo(freelist), %g1
	ld	[%fp-4], %g2
	st	%g2, [%g1+12]
	.loc 1 500 0
	ld	[%fp-4], %g1
	ld	[%g1+12], %g1
	ld	[%fp-4], %g2
	st	%g2, [%g1+8]
	.loc 1 501 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g1
	sub	%g0, %g1, %g2
	ld	[%fp-4], %g1
	st	%g2, [%g1+4]
.L12:
	.loc 1 509 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 510 0
	ld	[%fp-8], %g1
	ld	[%g1+4], %g1
	cmp	%g1, 0
	ble	.L13
	 nop
	.loc 1 518 0
	ld	[%fp-8], %g1
	ld	[%g1+12], %g1
	ld	[%fp-8], %g2
	ld	[%g2+8], %g2
	st	%g2, [%g1+8]
	.loc 1 519 0
	ld	[%fp-8], %g1
	ld	[%g1+8], %g1
	ld	[%fp-8], %g2
	ld	[%g2+12], %g2
	st	%g2, [%g1+12]
	.loc 1 520 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g2
	ld	[%fp-8], %g1
	ld	[%g1+4], %g1
	add	%g2, %g1, %g2
	ld	[%fp-4], %g1
	st	%g2, [%g1+4]
	.loc 1 529 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
.L13:
	.loc 1 540 0
	ld	[%fp-4], %g1
	ld	[%g1+4], %g2
	ld	[%fp-8], %g1
	st	%g2, [%g1]
	.loc 1 567 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	brel, .-brel
.Letext0:
	.file 2 "cortos_src/__bget.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x215
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF12
	.byte	0x1
	.uaword	.LASF13
	.uaword	.LASF14
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.uaword	.LASF15
	.byte	0x2
	.byte	0xf
	.uaword	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.uaword	.LASF16
	.uleb128 0x4
	.uaword	.LASF2
	.byte	0x8
	.byte	0x1
	.byte	0x5b
	.uaword	0x60
	.uleb128 0x5
	.uaword	.LASF0
	.byte	0x1
	.byte	0x5c
	.uaword	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.uaword	.LASF1
	.byte	0x1
	.byte	0x5d
	.uaword	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x4
	.uaword	.LASF3
	.byte	0x10
	.byte	0x1
	.byte	0x75
	.uaword	0x87
	.uleb128 0x6
	.asciz	"bh"
	.byte	0x1
	.byte	0x76
	.uaword	0x8d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.asciz	"ql"
	.byte	0x1
	.byte	0x77
	.uaword	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0x60
	.uleb128 0x4
	.uaword	.LASF4
	.byte	0x8
	.byte	0x1
	.byte	0x62
	.uaword	0xb6
	.uleb128 0x5
	.uaword	.LASF5
	.byte	0x1
	.byte	0x63
	.uaword	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.uaword	.LASF6
	.byte	0x1
	.byte	0x66
	.uaword	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF17
	.byte	0x1
	.byte	0xab
	.uaword	0x14b
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x14b
	.uleb128 0x9
	.uaword	.LASF8
	.byte	0x1
	.byte	0xac
	.uaword	0x25
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.uaword	.LASF7
	.byte	0x1
	.byte	0xae
	.uaword	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xb
	.asciz	"b"
	.byte	0x1
	.byte	0xaf
	.uaword	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xb
	.asciz	"buf"
	.byte	0x1
	.byte	0xb3
	.uaword	0x14b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.uaword	.LBB2
	.uaword	.LBE2
	.uaword	0x132
	.uleb128 0xb
	.asciz	"ba"
	.byte	0x1
	.byte	0xef
	.uaword	0x14d
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.asciz	"bn"
	.byte	0x1
	.byte	0xef
	.uaword	0x14d
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.uaword	.LBB3
	.uaword	.LBE3
	.uleb128 0xe
	.asciz	"ba"
	.byte	0x1
	.uahalf	0x104
	.uaword	0x14d
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.uleb128 0x7
	.byte	0x4
	.uaword	0x8d
	.uleb128 0x10
	.byte	0x1
	.uaword	.LASF9
	.byte	0x1
	.uahalf	0x164
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x1a9
	.uleb128 0x11
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x165
	.uaword	0x14b
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x11
	.asciz	"len"
	.byte	0x1
	.uahalf	0x166
	.uaword	0x25
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.asciz	"b"
	.byte	0x1
	.uahalf	0x168
	.uaword	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.asciz	"bn"
	.byte	0x1
	.uahalf	0x169
	.uaword	0x14d
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.uaword	.LASF10
	.byte	0x1
	.uahalf	0x1a8
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x207
	.uleb128 0x11
	.asciz	"buf"
	.byte	0x1
	.uahalf	0x1a9
	.uaword	0x14b
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xe
	.asciz	"b"
	.byte	0x1
	.uahalf	0x1ab
	.uaword	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.asciz	"bn"
	.byte	0x1
	.uahalf	0x1ab
	.uaword	0x87
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xd
	.uaword	.LBB4
	.uaword	.LBE4
	.uleb128 0x12
	.uaword	.LASF7
	.byte	0x1
	.uahalf	0x1e4
	.uaword	0x25
	.byte	0x1
	.byte	0x6d
	.byte	0
	.byte	0
	.uleb128 0xa
	.uaword	.LASF11
	.byte	0x1
	.byte	0x7b
	.uaword	0x60
	.byte	0x5
	.byte	0x3
	.uaword	freelist
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
.LASF0:
	.asciz	"flink"
.LASF2:
	.asciz	"qlinks"
.LASF8:
	.asciz	"requested_size"
.LASF3:
	.asciz	"bfhead"
.LASF5:
	.asciz	"prevfree"
.LASF10:
	.asciz	"brel"
.LASF12:
	.asciz	"GNU C 4.7.4"
.LASF6:
	.asciz	"bsize"
.LASF14:
	.asciz	"/Satvik/fft/cortos_build"
.LASF1:
	.asciz	"blink"
.LASF4:
	.asciz	"bhead"
.LASF16:
	.asciz	"long int"
.LASF9:
	.asciz	"bpool"
.LASF7:
	.asciz	"size"
.LASF13:
	.asciz	"cortos_src/__bget.c"
.LASF17:
	.asciz	"bget"
.LASF15:
	.asciz	"bufsize"
.LASF11:
	.asciz	"freelist"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
