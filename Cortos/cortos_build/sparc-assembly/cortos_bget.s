	.file	"cortos_bget.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.global bgetLockAddr
	.section	".bss"
	.align 4
	.type	bgetLockAddr, #object
	.size	bgetLockAddr, 4
bgetLockAddr:
	.skip	4
	.global bgetNcramLockAddr
	.align 4
	.type	bgetNcramLockAddr, #object
	.size	bgetNcramLockAddr, 4
bgetNcramLockAddr:
	.skip	4
	.section	".text"
	.align 4
	.global __cortos_bpool
	.type	__cortos_bpool, #function
	.proc	020
__cortos_bpool:
.LFB0:
	.file 1 "cortos_src/cortos_bget.c"
	.loc 1 16 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 17 0
	sethi	%hi(bgetLockAddr), %g1
	or	%g1, %lo(bgetLockAddr), %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	bne	.L1
	 nop
.LBB2:
	.loc 1 19 0
	sethi	%hi(1073844224), %o0
	sethi	%hi(4096), %o1
	call	bpool, 0
	 nop
	.loc 1 22 0
	sethi	%hi(1073840128), %g1
	st	%g1, [%fp-4]
	.loc 1 23 0
	sethi	%hi(allocatedLocksNc), %g1
	or	%g1, %lo(allocatedLocksNc), %g1
	mov	1, %g2
	stb	%g2, [%g1+2]
	.loc 1 24 0
	ld	[%fp-4], %g1
	add	%g1, 2, %g2
	sethi	%hi(bgetLockAddr), %g1
	or	%g1, %lo(bgetLockAddr), %g1
	st	%g2, [%g1]
.L1:
.LBE2:
	.loc 1 26 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	__cortos_bpool, .-__cortos_bpool
	.align 4
	.global cortos_bget
	.type	cortos_bget, #function
	.proc	0120
cortos_bget:
.LFB1:
	.loc 1 30 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 31 0
	st	%g0, [%fp-4]
	.loc 1 32 0
	sethi	%hi(bgetLockAddr), %g1
	or	%g1, %lo(bgetLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 34 0
	ld	[%fp+68], %o0
	call	bget, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 36 0
	sethi	%hi(bgetLockAddr), %g1
	or	%g1, %lo(bgetLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 38 0
	ld	[%fp-4], %g1
	.loc 1 39 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	cortos_bget, .-cortos_bget
	.align 4
	.global cortos_brel
	.type	cortos_brel, #function
	.proc	020
cortos_brel:
.LFB2:
	.loc 1 43 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 44 0
	sethi	%hi(bgetLockAddr), %g1
	or	%g1, %lo(bgetLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 46 0
	ld	[%fp+68], %o0
	call	brel, 0
	 nop
	.loc 1 48 0
	sethi	%hi(bgetLockAddr), %g1
	or	%g1, %lo(bgetLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 49 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	cortos_brel, .-cortos_brel
	.align 4
	.global __cortos_bpool_ncram
	.type	__cortos_bpool_ncram, #function
	.proc	020
__cortos_bpool_ncram:
.LFB3:
	.loc 1 56 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 57 0
	sethi	%hi(bgetNcramLockAddr), %g1
	or	%g1, %lo(bgetNcramLockAddr), %g1
	ld	[%g1], %g1
	cmp	%g1, 0
	bne	.L6
	 nop
.LBB3:
	.loc 1 58 0
	mov	0, %o0
	mov	-1, %o1
	call	bpool_ncram, 0
	 nop
	.loc 1 61 0
	sethi	%hi(1073840128), %g1
	st	%g1, [%fp-4]
	.loc 1 62 0
	sethi	%hi(allocatedLocksNc), %g1
	or	%g1, %lo(allocatedLocksNc), %g1
	mov	1, %g2
	stb	%g2, [%g1+3]
	.loc 1 63 0
	ld	[%fp-4], %g1
	add	%g1, 3, %g2
	sethi	%hi(bgetNcramLockAddr), %g1
	or	%g1, %lo(bgetNcramLockAddr), %g1
	st	%g2, [%g1]
.L6:
.LBE3:
	.loc 1 65 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	__cortos_bpool_ncram, .-__cortos_bpool_ncram
	.align 4
	.global cortos_bget_ncram
	.type	cortos_bget_ncram, #function
	.proc	0120
cortos_bget_ncram:
.LFB4:
	.loc 1 69 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 70 0
	st	%g0, [%fp-4]
	.loc 1 71 0
	sethi	%hi(bgetNcramLockAddr), %g1
	or	%g1, %lo(bgetNcramLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 73 0
	ld	[%fp+68], %o0
	call	bget_ncram, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 75 0
	sethi	%hi(bgetNcramLockAddr), %g1
	or	%g1, %lo(bgetNcramLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 77 0
	ld	[%fp-4], %g1
	.loc 1 78 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	cortos_bget_ncram, .-cortos_bget_ncram
	.align 4
	.global cortos_brel_ncram
	.type	cortos_brel_ncram, #function
	.proc	020
cortos_brel_ncram:
.LFB5:
	.loc 1 82 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 83 0
	sethi	%hi(bgetNcramLockAddr), %g1
	or	%g1, %lo(bgetNcramLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 85 0
	ld	[%fp+68], %o0
	call	brel_ncram, 0
	 nop
	.loc 1 87 0
	sethi	%hi(bgetNcramLockAddr), %g1
	or	%g1, %lo(bgetNcramLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 88 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	cortos_brel_ncram, .-cortos_brel_ncram
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 3 "cortos_src/cortos_bget.h"
	.file 4 "cortos_src/cortos_locks.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x1fe
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF23
	.byte	0x1
	.uaword	.LASF24
	.uaword	.LASF25
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF3
	.uleb128 0x4
	.uaword	.LASF8
	.byte	0x2
	.byte	0x2e
	.uaword	0x53
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x4
	.uaword	.LASF9
	.byte	0x3
	.byte	0x8
	.uaword	0x25
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF12
	.byte	0x1
	.byte	0x10
	.byte	0x1
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xad
	.uleb128 0x6
	.uaword	.LBB2
	.uaword	.LBE2
	.uleb128 0x7
	.uaword	.LASF10
	.byte	0x1
	.byte	0x16
	.uaword	0xad
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x48
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF16
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.uaword	0xef
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0xef
	.uleb128 0xa
	.uaword	.LASF14
	.byte	0x1
	.byte	0x1e
	.uaword	0x6f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.uaword	.LASF11
	.byte	0x1
	.byte	0x1f
	.uaword	0xef
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF13
	.byte	0x1
	.byte	0x2b
	.byte	0x1
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x11b
	.uleb128 0xc
	.asciz	"buf"
	.byte	0x1
	.byte	0x2b
	.uaword	0xef
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF15
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x14e
	.uleb128 0x6
	.uaword	.LBB3
	.uaword	.LBE3
	.uleb128 0x7
	.uaword	.LASF10
	.byte	0x1
	.byte	0x3d
	.uaword	0xad
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF17
	.byte	0x1
	.byte	0x45
	.byte	0x1
	.uaword	0xef
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x18a
	.uleb128 0xa
	.uaword	.LASF14
	.byte	0x1
	.byte	0x45
	.uaword	0x6f
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.uaword	.LASF11
	.byte	0x1
	.byte	0x46
	.uaword	0xef
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.uaword	.LASF18
	.byte	0x1
	.byte	0x52
	.byte	0x1
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x1b4
	.uleb128 0xc
	.asciz	"buf"
	.byte	0x1
	.byte	0x52
	.uaword	0xef
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0xd
	.uaword	0x48
	.uaword	0x1c4
	.uleb128 0xe
	.uaword	0x1c4
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF19
	.uleb128 0xf
	.uaword	.LASF20
	.byte	0x4
	.byte	0xe
	.uaword	0x1d8
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.uaword	0x1b4
	.uleb128 0x11
	.uaword	.LASF21
	.byte	0x1
	.byte	0xd
	.uaword	0xad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	bgetLockAddr
	.uleb128 0x11
	.uaword	.LASF22
	.byte	0x1
	.byte	0xe
	.uaword	0xad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	bgetNcramLockAddr
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
	.uleb128 0x6
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
.LASF22:
	.asciz	"bgetNcramLockAddr"
.LASF10:
	.asciz	"lockStartAddrNc"
.LASF17:
	.asciz	"cortos_bget_ncram"
.LASF15:
	.asciz	"__cortos_bpool_ncram"
.LASF4:
	.asciz	"unsigned char"
.LASF13:
	.asciz	"cortos_brel"
.LASF11:
	.asciz	"base"
.LASF5:
	.asciz	"short unsigned int"
.LASF25:
	.asciz	"/Satvik/fft/cortos_build"
.LASF6:
	.asciz	"unsigned int"
.LASF16:
	.asciz	"cortos_bget"
.LASF7:
	.asciz	"long long unsigned int"
.LASF8:
	.asciz	"uint8_t"
.LASF9:
	.asciz	"cortos_bufsize"
.LASF19:
	.asciz	"sizetype"
.LASF3:
	.asciz	"long long int"
.LASF21:
	.asciz	"bgetLockAddr"
.LASF18:
	.asciz	"cortos_brel_ncram"
.LASF23:
	.asciz	"GNU C 4.7.4"
.LASF2:
	.asciz	"short int"
.LASF12:
	.asciz	"__cortos_bpool"
.LASF0:
	.asciz	"long int"
.LASF24:
	.asciz	"cortos_src/cortos_bget.c"
.LASF1:
	.asciz	"signed char"
.LASF14:
	.asciz	"size"
.LASF20:
	.asciz	"allocatedLocksNc"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
