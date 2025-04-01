	.file	"cortos_locks.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.global lockStartAddr
	.section	".data"
	.align 4
	.type	lockStartAddr, #object
	.size	lockStartAddr, 4
lockStartAddr:
	.long	1073836032
	.global lockStartAddrNc
	.align 4
	.type	lockStartAddrNc, #object
	.size	lockStartAddrNc, 4
lockStartAddrNc:
	.long	1073840128
	.common	allocatedLocks,256,8
	.common	allocatedLocksNc,256,8
	.common	cortos_reservedLockAddr,4,4
	.section	".text"
	.align 4
	.global cortos_init_locks
	.type	cortos_init_locks, #function
	.proc	020
cortos_init_locks:
.LFB0:
	.file 1 "cortos_src/cortos_locks.c"
	.loc 1 12 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 14 0
	sethi	%hi(1073836032), %g1
	st	%g1, [%fp-4]
	.loc 1 15 0
	sethi	%hi(1073840128), %g1
	st	%g1, [%fp-8]
	.loc 1 16 0
	sethi	%hi(allocatedLocksNc), %g1
	or	%g1, %lo(allocatedLocksNc), %g1
	mov	1, %g2
	stb	%g2, [%g1]
	.loc 1 17 0
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%fp-8], %g2
	st	%g2, [%g1]
	.loc 1 18 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	cortos_init_locks, .-cortos_init_locks
	.align 4
	.global cortos_reserveLock
	.type	cortos_reserveLock, #function
	.proc	0114
cortos_reserveLock:
.LFB1:
	.loc 1 20 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 21 0
	st	%g0, [%fp-4]
	.loc 1 22 0
	ld	[%fp+68], %g1
	cmp	%g1, 0
	be	.L3
	 nop
	.loc 1 22 0 is_stmt 0 discriminator 1
	sethi	%hi(allocatedLocksNc), %g1
	or	%g1, %lo(allocatedLocksNc), %g1
	b	.L4
	 nop
.L3:
	.loc 1 22 0 discriminator 2
	sethi	%hi(allocatedLocks), %g1
	or	%g1, %lo(allocatedLocks), %g1
.L4:
	.loc 1 22 0 discriminator 3
	st	%g1, [%fp-8]
	.loc 1 23 0 is_stmt 1 discriminator 3
	ld	[%fp+68], %g1
	cmp	%g1, 0
	be	.L5
	 nop
	.loc 1 23 0 is_stmt 0 discriminator 1
	sethi	%hi(lockStartAddrNc), %g1
	or	%g1, %lo(lockStartAddrNc), %g1
	ld	[%g1], %g1
	b	.L6
	 nop
.L5:
	.loc 1 23 0 discriminator 2
	sethi	%hi(lockStartAddr), %g1
	or	%g1, %lo(lockStartAddr), %g1
	ld	[%g1], %g1
.L6:
	.loc 1 23 0 discriminator 3
	st	%g1, [%fp-12]
	.loc 1 25 0 is_stmt 1 discriminator 3
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 27 0 discriminator 3
	b	.L7
	 nop
.L10:
	.loc 1 28 0
	ld	[%fp-4], %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	bne	.L8
	 nop
	.loc 1 29 0
	ld	[%fp-4], %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	mov	1, %g2
	stb	%g2, [%g1]
	.loc 1 30 0
	b	.L9
	 nop
.L8:
	.loc 1 27 0
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L7:
	.loc 1 27 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g1
	cmp	%g1, 255
	ble	.L10
	 nop
.L9:
	.loc 1 34 0 is_stmt 1
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 35 0
	ld	[%fp-4], %g1
	ld	[%fp-12], %g2
	add	%g2, %g1, %g1
	.loc 1 36 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	cortos_reserveLock, .-cortos_reserveLock
	.align 4
	.global cortos_freeLock
	.type	cortos_freeLock, #function
	.proc	020
cortos_freeLock:
.LFB2:
	.loc 1 38 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 39 0
	sethi	%hi(lockStartAddr), %g1
	or	%g1, %lo(lockStartAddr), %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	cmp	%g2, %g1
	blu	.L13
	 nop
	.loc 1 39 0 is_stmt 0 discriminator 1
	sethi	%hi(lockStartAddr), %g1
	or	%g1, %lo(lockStartAddr), %g1
	ld	[%g1], %g1
	add	%g1, 256, %g2
	ld	[%fp+68], %g1
	cmp	%g2, %g1
	bleu	.L13
	 nop
	.loc 1 40 0 is_stmt 1
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 41 0
	ld	[%fp+68], %g2
	sethi	%hi(lockStartAddr), %g1
	or	%g1, %lo(lockStartAddr), %g1
	ld	[%g1], %g1
	sub	%g2, %g1, %g1
	sethi	%hi(allocatedLocks), %g2
	or	%g2, %lo(allocatedLocks), %g2
	stb	%g0, [%g2+%g1]
	.loc 1 42 0
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	b	.L12
	 nop
.L13:
	.loc 1 44 0
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 45 0
	ld	[%fp+68], %g2
	sethi	%hi(lockStartAddrNc), %g1
	or	%g1, %lo(lockStartAddrNc), %g1
	ld	[%g1], %g1
	sub	%g2, %g1, %g1
	sethi	%hi(allocatedLocksNc), %g2
	or	%g2, %lo(allocatedLocksNc), %g2
	stb	%g0, [%g2+%g1]
	.loc 1 46 0
	sethi	%hi(cortos_reservedLockAddr), %g1
	or	%g1, %lo(cortos_reservedLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
.L12:
	.loc 1 48 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	cortos_freeLock, .-cortos_freeLock
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x1b3
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF19
	.byte	0x1
	.uaword	.LASF20
	.uaword	.LASF21
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
	.byte	0x1
	.uaword	.LASF22
	.byte	0x1
	.byte	0xc
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xa9
	.uleb128 0x6
	.uaword	.LASF9
	.byte	0x1
	.byte	0xe
	.uaword	0xa9
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x6
	.uaword	.LASF10
	.byte	0x1
	.byte	0xf
	.uaword	0xa9
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0x41
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.uaword	0xa9
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x104
	.uleb128 0x9
	.asciz	"nc"
	.byte	0x1
	.byte	0x14
	.uaword	0x5a
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.asciz	"i"
	.byte	0x1
	.byte	0x15
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x6
	.uaword	.LASF11
	.byte	0x1
	.byte	0x16
	.uaword	0x104
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x6
	.uaword	.LASF12
	.byte	0x1
	.byte	0x17
	.uaword	0xa9
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uaword	0x10a
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF13
	.uleb128 0xb
	.byte	0x1
	.uaword	.LASF24
	.byte	0x1
	.byte	0x26
	.byte	0x1
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x13b
	.uleb128 0xc
	.uaword	.LASF14
	.byte	0x1
	.byte	0x26
	.uaword	0xa9
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0xd
	.uaword	0x41
	.uaword	0x14b
	.uleb128 0xe
	.uaword	0x14b
	.byte	0xff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF15
	.uleb128 0xf
	.uaword	.LASF16
	.byte	0x1
	.byte	0x6
	.uaword	0x164
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	allocatedLocks
	.uleb128 0x10
	.uaword	0x13b
	.uleb128 0xf
	.uaword	.LASF17
	.byte	0x1
	.byte	0x7
	.uaword	0x17b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	allocatedLocksNc
	.uleb128 0x10
	.uaword	0x13b
	.uleb128 0xf
	.uaword	.LASF9
	.byte	0x1
	.byte	0x4
	.uaword	0xa9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	lockStartAddr
	.uleb128 0xf
	.uaword	.LASF10
	.byte	0x1
	.byte	0x5
	.uaword	0xa9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	lockStartAddrNc
	.uleb128 0xf
	.uaword	.LASF18
	.byte	0x1
	.byte	0x8
	.uaword	0xa9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	cortos_reservedLockAddr
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
	.uleb128 0x6
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
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
.LASF20:
	.asciz	"cortos_src/cortos_locks.c"
.LASF16:
	.asciz	"allocatedLocks"
.LASF10:
	.asciz	"lockStartAddrNc"
.LASF18:
	.asciz	"cortos_reservedLockAddr"
.LASF3:
	.asciz	"unsigned char"
.LASF4:
	.asciz	"short unsigned int"
.LASF23:
	.asciz	"cortos_reserveLock"
.LASF22:
	.asciz	"cortos_init_locks"
.LASF12:
	.asciz	"lockAddr"
.LASF21:
	.asciz	"/Satvik/fft/cortos_build"
.LASF7:
	.asciz	"unsigned int"
.LASF8:
	.asciz	"long long unsigned int"
.LASF5:
	.asciz	"uint8_t"
.LASF15:
	.asciz	"sizetype"
.LASF2:
	.asciz	"long long int"
.LASF13:
	.asciz	"char"
.LASF11:
	.asciz	"resArr"
.LASF19:
	.asciz	"GNU C 4.7.4"
.LASF1:
	.asciz	"short int"
.LASF24:
	.asciz	"cortos_freeLock"
.LASF6:
	.asciz	"uint32_t"
.LASF17:
	.asciz	"allocatedLocksNc"
.LASF0:
	.asciz	"signed char"
.LASF14:
	.asciz	"lock"
.LASF9:
	.asciz	"lockStartAddr"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
