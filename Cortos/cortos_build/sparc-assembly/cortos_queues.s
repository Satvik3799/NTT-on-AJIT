	.file	"cortos_queues.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global cortos_reserveQueue
	.type	cortos_reserveQueue, #function
	.proc	0110
cortos_reserveQueue:
.LFB0:
	.file 1 "cortos_src/cortos_queues.c"
	.loc 1 10 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	mov	%i2, %g1
	stb	%g1, [%fp+76]
	.loc 1 11 0
	st	%g0, [%fp-4]
	.loc 1 12 0
	ld	[%fp+68], %g2
	ld	[%fp+72], %g1
	smul	%g2, %g1, %g1
	add	%g1, 32, %g1
	st	%g1, [%fp-8]
	.loc 1 13 0
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L2
	 nop
	.loc 1 14 0
	ld	[%fp-8], %g1
	add	%g1, 16, %g1
	mov	%g1, %o0
	call	cortos_bget_ncram, 0
	 nop
	st	%o0, [%fp-4]
	b	.L3
	 nop
.L2:
	.loc 1 16 0
	ld	[%fp-8], %g1
	add	%g1, 16, %g1
	mov	%g1, %o0
	call	cortos_bget, 0
	 nop
	st	%o0, [%fp-4]
.L3:
	.loc 1 18 0
	ld	[%fp-4], %g1
	cmp	%g1, 0
	bne	.L4
	 nop
	.loc 1 18 0 is_stmt 0 discriminator 1
	mov	0, %g1
	b	.L5
	 nop
.L4:
	.loc 1 21 0 is_stmt 1
	ld	[%fp-4], %g1
	and	%g1, 15, %g1
	st	%g1, [%fp-12]
	.loc 1 25 0
	mov	16, %g2
	ld	[%fp-12], %g1
	sub	%g2, %g1, %g1
	ld	[%fp-4], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-16]
	.loc 1 26 0
	ld	[%fp-16], %g1
	st	%g0, [%g1]
	.loc 1 27 0
	ld	[%fp-16], %g1
	st	%g0, [%g1+4]
	.loc 1 28 0
	ld	[%fp-16], %g1
	st	%g0, [%g1+8]
	.loc 1 29 0
	ld	[%fp-16], %g1
	ld	[%fp+68], %g2
	st	%g2, [%g1+16]
	.loc 1 30 0
	ld	[%fp-16], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1+12]
	.loc 1 31 0
	mov	1, %o0
	call	cortos_reserveLock, 0
	 nop
	mov	%o0, %g2
	ld	[%fp-16], %g1
	st	%g2, [%g1+20]
	.loc 1 32 0
	ld	[%fp-16], %g1
	ld	[%fp-4], %g2
	st	%g2, [%g1+24]
	.loc 1 33 0
	ld	[%fp-16], %g1
	st	%g0, [%g1+28]
	.loc 1 35 0
	ld	[%fp-16], %g1
.L5:
	.loc 1 36 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	cortos_reserveQueue, .-cortos_reserveQueue
	.align 4
	.global cortos_freeQueue
	.type	cortos_freeQueue, #function
	.proc	020
cortos_freeQueue:
.LFB1:
	.loc 1 38 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 39 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	mov	%g1, %o0
	call	cortos_freeLock, 0
	 nop
	.loc 1 40 0
	ld	[%fp+68], %o0
	call	cortos_IsNcRamAddr, 0
	 nop
	mov	%o0, %g1
	and	%g1, 0xff, %g1
	cmp	%g1, 0
	be	.L7
	 nop
	.loc 1 41 0
	ld	[%fp+68], %g1
	ld	[%g1+24], %g1
	mov	%g1, %o0
	call	cortos_brel_ncram, 0
	 nop
	b	.L6
	 nop
.L7:
	.loc 1 43 0
	ld	[%fp+68], %g1
	ld	[%g1+24], %g1
	mov	%g1, %o0
	call	cortos_brel, 0
	 nop
.L6:
	.loc 1 45 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	cortos_freeQueue, .-cortos_freeQueue
	.align 4
	.global cortos_writeMessages
	.type	cortos_writeMessages, #function
	.proc	016
cortos_writeMessages:
.LFB2:
	.loc 1 48 0
	.cfi_startproc
	save	%sp, -136, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 49 0
	st	%g0, [%fp-20]
	st	%g0, [%fp-24]
	.loc 1 50 0
	ld	[%fp+76], %g1
	st	%g1, [%fp-4]
	.loc 1 53 0
	ld	[%fp+68], %g1
	ld	[%g1+28], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L10
	 nop
	.loc 1 54 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	b	.L11
	 nop
.L10:
	.loc 1 56 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	be	.L11
	 nop
	.loc 1 56 0 is_stmt 0 discriminator 1
	mov	0, %g1
	b	.L12
	 nop
.L11:
	.loc 1 59 0 is_stmt 1
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-12]
	.loc 1 60 0
	ld	[%fp+68], %g1
	ld	[%g1+8], %g1
	st	%g1, [%fp-16]
	.loc 1 61 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	st	%g1, [%fp-28]
	.loc 1 62 0
	ld	[%fp+68], %g1
	ld	[%g1+16], %g1
	st	%g1, [%fp-32]
	.loc 1 63 0
	ld	[%fp+68], %g1
	add	%g1, 32, %g1
	st	%g1, [%fp-36]
	.loc 1 65 0
	b	.L13
	 nop
.L17:
	.loc 1 66 0
	ld	[%fp+76], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g2
	ld	[%fp-32], %g1
	smul	%g2, %g1, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-24]
	.loc 1 67 0
	ld	[%fp-32], %g2
	ld	[%fp-16], %g1
	smul	%g2, %g1, %g1
	ld	[%fp-36], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-20]
	.loc 1 68 0
	st	%g0, [%fp-8]
	b	.L14
	 nop
.L15:
	.loc 1 69 0 discriminator 2
	ld	[%fp-20], %g2
	ld	[%fp-8], %g1
	add	%g2, %g1, %g1
	ld	[%fp-24], %g3
	ld	[%fp-8], %g2
	add	%g3, %g2, %g2
	ldub	[%g2], %g2
	stb	%g2, [%g1]
	.loc 1 68 0 discriminator 2
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L14:
	.loc 1 68 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g2
	ld	[%fp-32], %g1
	cmp	%g2, %g1
	blu	.L15
	 nop
	.loc 1 71 0 is_stmt 1
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	wr	%g0, 0, %y
	ld	[%fp-28], %g3
	nop
	nop
	udiv	%g1, %g3, %g3
	ld	[%fp-28], %g2
	smul	%g3, %g2, %g2
	sub	%g1, %g2, %g1
	st	%g1, [%fp-16]
	.loc 1 72 0
	ld	[%fp-12], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-12]
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
.L13:
	.loc 1 65 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 0
	be	.L16
	 nop
	.loc 1 65 0 is_stmt 0 discriminator 2
	ld	[%fp+68], %g1
	ld	[%g1+12], %g2
	ld	[%fp-12], %g1
	cmp	%g2, %g1
	bgu	.L17
	 nop
.L16:
	.loc 1 75 0 is_stmt 1
	ld	[%fp+68], %g1
	ld	[%fp-16], %g2
	st	%g2, [%g1+8]
	.loc 1 76 0
	ld	[%fp+68], %g1
	ld	[%fp-12], %g2
	st	%g2, [%g1]
	.loc 1 78 0
	ld	[%fp+68], %g1
	ld	[%g1+28], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L18
	 nop
	.loc 1 79 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
.L18:
	.loc 1 81 0
	ld	[%fp+76], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g1
.L12:
	.loc 1 82 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	cortos_writeMessages, .-cortos_writeMessages
	.align 4
	.global cortos_readMessages
	.type	cortos_readMessages, #function
	.proc	016
cortos_readMessages:
.LFB3:
	.loc 1 85 0
	.cfi_startproc
	save	%sp, -136, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 86 0
	st	%g0, [%fp-20]
	st	%g0, [%fp-24]
	.loc 1 87 0
	ld	[%fp+76], %g1
	st	%g1, [%fp-4]
	.loc 1 90 0
	ld	[%fp+68], %g1
	ld	[%g1+28], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L20
	 nop
	.loc 1 91 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	b	.L21
	 nop
.L20:
	.loc 1 93 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	bne	.L21
	 nop
	.loc 1 93 0 is_stmt 0 discriminator 1
	mov	0, %g1
	b	.L22
	 nop
.L21:
	.loc 1 96 0 is_stmt 1
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-12]
	.loc 1 97 0
	ld	[%fp+68], %g1
	ld	[%g1+4], %g1
	st	%g1, [%fp-16]
	.loc 1 98 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g1
	st	%g1, [%fp-28]
	.loc 1 99 0
	ld	[%fp+68], %g1
	ld	[%g1+16], %g1
	st	%g1, [%fp-32]
	.loc 1 100 0
	ld	[%fp+68], %g1
	add	%g1, 32, %g1
	st	%g1, [%fp-36]
	.loc 1 102 0
	b	.L23
	 nop
.L27:
	.loc 1 103 0
	ld	[%fp+76], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g2
	ld	[%fp-32], %g1
	smul	%g2, %g1, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-20]
	.loc 1 104 0
	ld	[%fp-32], %g2
	ld	[%fp-16], %g1
	smul	%g2, %g1, %g1
	ld	[%fp-36], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-24]
	.loc 1 105 0
	st	%g0, [%fp-8]
	b	.L24
	 nop
.L25:
	.loc 1 106 0 discriminator 2
	ld	[%fp-20], %g2
	ld	[%fp-8], %g1
	add	%g2, %g1, %g1
	ld	[%fp-24], %g3
	ld	[%fp-8], %g2
	add	%g3, %g2, %g2
	ldub	[%g2], %g2
	stb	%g2, [%g1]
	.loc 1 105 0 discriminator 2
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L24:
	.loc 1 105 0 is_stmt 0 discriminator 1
	ld	[%fp-8], %g2
	ld	[%fp-32], %g1
	cmp	%g2, %g1
	blu	.L25
	 nop
	.loc 1 108 0 is_stmt 1
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	wr	%g0, 0, %y
	ld	[%fp-28], %g3
	nop
	nop
	udiv	%g1, %g3, %g3
	ld	[%fp-28], %g2
	smul	%g3, %g2, %g2
	sub	%g1, %g2, %g1
	st	%g1, [%fp-16]
	.loc 1 109 0
	ld	[%fp-12], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-12]
	ld	[%fp-4], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-4]
.L23:
	.loc 1 102 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 0
	be	.L26
	 nop
	.loc 1 102 0 is_stmt 0 discriminator 2
	ld	[%fp-12], %g1
	cmp	%g1, 0
	bne	.L27
	 nop
.L26:
	.loc 1 112 0 is_stmt 1
	ld	[%fp+68], %g1
	ld	[%fp-16], %g2
	st	%g2, [%g1+4]
	.loc 1 113 0
	ld	[%fp+68], %g1
	ld	[%fp-12], %g2
	st	%g2, [%g1]
	.loc 1 115 0
	ld	[%fp+68], %g1
	ld	[%g1+28], %g1
	and	%g1, 1, %g1
	cmp	%g1, 0
	bne	.L28
	 nop
	.loc 1 116 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
.L28:
	.loc 1 118 0
	ld	[%fp+76], %g2
	ld	[%fp-4], %g1
	sub	%g2, %g1, %g1
.L22:
	.loc 1 119 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	cortos_readMessages, .-cortos_readMessages
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 3 "cortos_src/cortos_queues.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x344
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF30
	.byte	0x1
	.uaword	.LASF31
	.uaword	.LASF32
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF8
	.uleb128 0x5
	.uaword	.LASF33
	.byte	0x20
	.byte	0x3
	.byte	0xb
	.uaword	0xf0
	.uleb128 0x6
	.uaword	.LASF9
	.byte	0x3
	.byte	0xc
	.uaword	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.uaword	.LASF10
	.byte	0x3
	.byte	0xd
	.uaword	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x3
	.byte	0xe
	.uaword	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x3
	.byte	0xf
	.uaword	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.uaword	.LASF13
	.byte	0x3
	.byte	0x10
	.uaword	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.uaword	.LASF14
	.byte	0x3
	.byte	0x11
	.uaword	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.uaword	.LASF15
	.byte	0x3
	.byte	0x12
	.uaword	0xf0
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.uaword	.LASF16
	.byte	0x3
	.byte	0x14
	.uaword	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0x41
	.uleb128 0x4
	.uaword	.LASF17
	.byte	0x3
	.byte	0x15
	.uaword	0x73
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF18
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF21
	.byte	0x1
	.byte	0xa
	.byte	0x1
	.uaword	0x18b
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x18b
	.uleb128 0x9
	.uaword	.LASF13
	.byte	0x1
	.byte	0xa
	.uaword	0x5a
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF12
	.byte	0x1
	.byte	0xa
	.uaword	0x5a
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xa
	.asciz	"nc"
	.byte	0x1
	.byte	0xa
	.uaword	0x41
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xb
	.uaword	.LASF19
	.byte	0x1
	.byte	0xb
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xb
	.uaword	.LASF20
	.byte	0x1
	.byte	0xc
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xc
	.asciz	"rem"
	.byte	0x1
	.byte	0x15
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.asciz	"hdr"
	.byte	0x1
	.byte	0x18
	.uaword	0x18b
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0xf6
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF28
	.byte	0x1
	.byte	0x26
	.byte	0x1
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x1bb
	.uleb128 0xa
	.asciz	"hdr"
	.byte	0x1
	.byte	0x26
	.uaword	0x18b
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF22
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.uaword	0x5a
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x283
	.uleb128 0xa
	.asciz	"hdr"
	.byte	0x1
	.byte	0x30
	.uaword	0x18b
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF23
	.byte	0x1
	.byte	0x30
	.uaword	0xf0
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF24
	.byte	0x1
	.byte	0x30
	.uaword	0x5a
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xb
	.uaword	.LASF25
	.byte	0x1
	.byte	0x31
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.asciz	"src"
	.byte	0x1
	.byte	0x31
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.uaword	.LASF26
	.byte	0x1
	.byte	0x32
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xc
	.asciz	"i"
	.byte	0x1
	.byte	0x33
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xb
	.uaword	.LASF9
	.byte	0x1
	.byte	0x3b
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.uaword	.LASF11
	.byte	0x1
	.byte	0x3c
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.uaword	.LASF12
	.byte	0x1
	.byte	0x3d
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.uaword	.LASF13
	.byte	0x1
	.byte	0x3e
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.uaword	.LASF27
	.byte	0x1
	.byte	0x3f
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.uaword	.LASF29
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.uaword	0x5a
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uleb128 0xa
	.asciz	"hdr"
	.byte	0x1
	.byte	0x55
	.uaword	0x18b
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF23
	.byte	0x1
	.byte	0x55
	.uaword	0xf0
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF24
	.byte	0x1
	.byte	0x55
	.uaword	0x5a
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xb
	.uaword	.LASF25
	.byte	0x1
	.byte	0x56
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.asciz	"src"
	.byte	0x1
	.byte	0x56
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.uaword	.LASF26
	.byte	0x1
	.byte	0x57
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xc
	.asciz	"i"
	.byte	0x1
	.byte	0x58
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xb
	.uaword	.LASF9
	.byte	0x1
	.byte	0x60
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.uaword	.LASF10
	.byte	0x1
	.byte	0x61
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.uaword	.LASF12
	.byte	0x1
	.byte	0x62
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.uaword	.LASF13
	.byte	0x1
	.byte	0x63
	.uaword	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.uaword	.LASF27
	.byte	0x1
	.byte	0x64
	.uaword	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
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
	.uleb128 0x6
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x2116
	.uleb128 0xc
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
.LASF10:
	.asciz	"readIndex"
.LASF22:
	.asciz	"cortos_writeMessages"
.LASF17:
	.asciz	"CortosQueueHeader"
.LASF24:
	.asciz	"count"
.LASF23:
	.asciz	"msgs"
.LASF27:
	.asciz	"queuePtr"
.LASF20:
	.asciz	"size"
.LASF28:
	.asciz	"cortos_freeQueue"
.LASF25:
	.asciz	"dest"
.LASF29:
	.asciz	"cortos_readMessages"
.LASF3:
	.asciz	"unsigned char"
.LASF31:
	.asciz	"cortos_src/cortos_queues.c"
.LASF4:
	.asciz	"short unsigned int"
.LASF9:
	.asciz	"totalMsgs"
.LASF16:
	.asciz	"misc"
.LASF11:
	.asciz	"writeIndex"
.LASF32:
	.asciz	"/Satvik/fft/cortos_build"
.LASF13:
	.asciz	"msgSizeInBytes"
.LASF7:
	.asciz	"unsigned int"
.LASF33:
	.asciz	"_CortosQueueHeader"
.LASF8:
	.asciz	"long long unsigned int"
.LASF5:
	.asciz	"uint8_t"
.LASF26:
	.asciz	"process"
.LASF19:
	.asciz	"queue"
.LASF2:
	.asciz	"long long int"
.LASF30:
	.asciz	"GNU C 4.7.4"
.LASF1:
	.asciz	"short int"
.LASF6:
	.asciz	"uint32_t"
.LASF18:
	.asciz	"long int"
.LASF0:
	.asciz	"signed char"
.LASF14:
	.asciz	"lock"
.LASF21:
	.asciz	"cortos_reserveQueue"
.LASF12:
	.asciz	"length"
.LASF15:
	.asciz	"bget_addr"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
