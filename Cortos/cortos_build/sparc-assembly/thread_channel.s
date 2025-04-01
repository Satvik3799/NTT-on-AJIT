	.file	"thread_channel.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global initChannel
	.type	initChannel, #function
	.proc	020
initChannel:
.LFB3:
	.file 1 "/home/ajit/ajit-toolchain/application_development/thread_channel/src/thread_channel.c"
	.loc 1 12 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 13 0
	ld	[%fp+68], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1]
	.loc 1 14 0
	ld	[%fp+68], %g1
	st	%g0, [%g1+4]
	.loc 1 15 0
	ld	[%fp+68], %g1
	st	%g0, [%g1+8]
	.loc 1 16 0
	ld	[%fp+68], %g1
	st	%g0, [%g1+12]
	.loc 1 17 0
	ld	[%fp+68], %g1
	st	%g0, [%g1+16]
	.loc 1 18 0
	ld	[%fp+68], %g1
	mov	1, %g2
	st	%g2, [%g1+20]
	.loc 1 19 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	initChannel, .-initChannel
	.section	".rodata"
	.align 8
.LC0:
	.asciz	"DEBUG"
	.align 8
.LC1:
	.asciz	"/home/ajit/ajit-toolchain/application_development/thread_channel/src/thread_channel.c"
	.align 8
.LC2:
	.asciz	"Channel %d: status = %d.\n"
	.section	".text"
	.align 4
	.global scheduleChannelJob
	.type	scheduleChannelJob, #function
	.proc	016
scheduleChannelJob:
.LFB4:
	.loc 1 24 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 25 0
	mov	1, %g1
	st	%g1, [%fp-4]
	.loc 1 26 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	cmp	%g1, 1
	bne	.L3
	 nop
	.loc 1 28 0
	ld	[%fp+68], %g1
	ld	[%g1+4], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1+4]
	.loc 1 29 0
	ld	[%fp+68], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1+12]
	.loc 1 30 0
	ld	[%fp+68], %g1
	ld	[%fp+76], %g2
	st	%g2, [%g1+16]
	.loc 1 31 0
	ld	[%fp+68], %g1
	mov	2, %g2
	st	%g2, [%g1+20]
	.loc 1 33 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+20], %g2
	st	%g2, [%sp+92]
	sethi	%hi(.LC0), %g2
	or	%g2, %lo(.LC0), %o0
	sethi	%hi(.LC1), %g2
	or	%g2, %lo(.LC1), %o1
	sethi	%hi(__func__.2530), %g2
	or	%g2, %lo(__func__.2530), %o2
	mov	33, %o3
	sethi	%hi(.LC2), %g2
	or	%g2, %lo(.LC2), %o4
	mov	%g1, %o5
	call	__cortos_log_printf, 0
	 nop
	.loc 1 35 0
	st	%g0, [%fp-4]
.L3:
	.loc 1 37 0
	ld	[%fp-4], %g1
	.loc 1 38 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	scheduleChannelJob, .-scheduleChannelJob
	.align 4
	.global setChannelResponse
	.type	setChannelResponse, #function
	.proc	016
setChannelResponse:
.LFB5:
	.loc 1 42 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 43 0
	mov	1, %g1
	st	%g1, [%fp-4]
	.loc 1 44 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	cmp	%g1, 3
	bne	.L6
	 nop
	.loc 1 46 0
	ld	[%fp+68], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1+16]
	.loc 1 47 0
	ld	[%fp+68], %g1
	ld	[%g1+8], %g1
	add	%g1, 1, %g2
	ld	[%fp+68], %g1
	st	%g2, [%g1+8]
	.loc 1 48 0
	ld	[%fp+68], %g1
	mov	4, %g2
	st	%g2, [%g1+20]
	.loc 1 50 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+20], %g2
	st	%g2, [%sp+92]
	sethi	%hi(.LC0), %g2
	or	%g2, %lo(.LC0), %o0
	sethi	%hi(.LC1), %g2
	or	%g2, %lo(.LC1), %o1
	sethi	%hi(__func__.2536), %g2
	or	%g2, %lo(__func__.2536), %o2
	mov	50, %o3
	sethi	%hi(.LC2), %g2
	or	%g2, %lo(.LC2), %o4
	mov	%g1, %o5
	call	__cortos_log_printf, 0
	 nop
	.loc 1 52 0
	st	%g0, [%fp-4]
.L6:
	.loc 1 54 0
	ld	[%fp-4], %g1
	.loc 1 55 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	setChannelResponse, .-setChannelResponse
	.align 4
	.global getChannelResponse
	.type	getChannelResponse, #function
	.proc	016
getChannelResponse:
.LFB6:
	.loc 1 59 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 60 0
	mov	1, %g1
	st	%g1, [%fp-4]
	.loc 1 61 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	cmp	%g1, 4
	bne	.L9
	 nop
	.loc 1 63 0
	ld	[%fp+68], %g1
	ld	[%g1+16], %g2
	ld	[%fp+72], %g1
	st	%g2, [%g1]
	.loc 1 65 0
	ld	[%fp+68], %g1
	st	%g0, [%g1+12]
	.loc 1 66 0
	ld	[%fp+68], %g1
	st	%g0, [%g1+16]
	.loc 1 67 0
	ld	[%fp+68], %g1
	mov	1, %g2
	st	%g2, [%g1+20]
	.loc 1 70 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+20], %g2
	st	%g2, [%sp+92]
	sethi	%hi(.LC0), %g2
	or	%g2, %lo(.LC0), %o0
	sethi	%hi(.LC1), %g2
	or	%g2, %lo(.LC1), %o1
	sethi	%hi(__func__.2542), %g2
	or	%g2, %lo(__func__.2542), %o2
	mov	70, %o3
	sethi	%hi(.LC2), %g2
	or	%g2, %lo(.LC2), %o4
	mov	%g1, %o5
	call	__cortos_log_printf, 0
	 nop
	.loc 1 72 0
	st	%g0, [%fp-4]
.L9:
	.loc 1 74 0
	ld	[%fp-4], %g1
	.loc 1 75 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	getChannelResponse, .-getChannelResponse
	.align 4
	.global getChannelJob
	.type	getChannelJob, #function
	.proc	016
getChannelJob:
.LFB7:
	.loc 1 79 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 80 0
	mov	1, %g1
	st	%g1, [%fp-4]
	.loc 1 81 0
	ld	[%fp+68], %g1
	ld	[%g1+20], %g1
	cmp	%g1, 2
	bne	.L12
	 nop
	.loc 1 83 0
	ld	[%fp+68], %g1
	ld	[%g1+12], %g2
	ld	[%fp+72], %g1
	st	%g2, [%g1]
	.loc 1 84 0
	ld	[%fp+68], %g1
	ld	[%g1+16], %g2
	ld	[%fp+76], %g1
	st	%g2, [%g1]
	.loc 1 85 0
	ld	[%fp+68], %g1
	mov	3, %g2
	st	%g2, [%g1+20]
	.loc 1 87 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	ld	[%fp+68], %g2
	ld	[%g2+20], %g2
	st	%g2, [%sp+92]
	sethi	%hi(.LC0), %g2
	or	%g2, %lo(.LC0), %o0
	sethi	%hi(.LC1), %g2
	or	%g2, %lo(.LC1), %o1
	sethi	%hi(__func__.2549), %g2
	or	%g2, %lo(__func__.2549), %o2
	mov	87, %o3
	sethi	%hi(.LC2), %g2
	or	%g2, %lo(.LC2), %o4
	mov	%g1, %o5
	call	__cortos_log_printf, 0
	 nop
	.loc 1 89 0
	st	%g0, [%fp-4]
.L12:
	.loc 1 91 0
	ld	[%fp-4], %g1
	.loc 1 92 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	getChannelJob, .-getChannelJob
	.section	".rodata"
	.align 8
	.type	__func__.2549, #object
	.size	__func__.2549, 14
__func__.2549:
	.asciz	"getChannelJob"
	.align 8
	.type	__func__.2542, #object
	.size	__func__.2542, 19
__func__.2542:
	.asciz	"getChannelResponse"
	.align 8
	.type	__func__.2536, #object
	.size	__func__.2536, 19
__func__.2536:
	.asciz	"setChannelResponse"
	.align 8
	.type	__func__.2530, #object
	.size	__func__.2530, 19
__func__.2530:
	.asciz	"scheduleChannelJob"
	.section	".text"
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/application_development/thread_channel/include/thread_channel.h"
	.file 3 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x2eb
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF26
	.byte	0x1
	.uaword	.LASF27
	.uaword	.LASF28
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF10
	.uleb128 0x5
	.uaword	.LASF16
	.byte	0x3
	.byte	0x34
	.uaword	0x25
	.uleb128 0x6
	.uaword	.LASF29
	.byte	0x18
	.byte	0x2
	.byte	0x1f
	.uaword	0xe6
	.uleb128 0x7
	.asciz	"id"
	.byte	0x2
	.byte	0x21
	.uaword	0x7b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.uaword	.LASF11
	.byte	0x2
	.byte	0x22
	.uaword	0x7b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.uaword	.LASF12
	.byte	0x2
	.byte	0x23
	.uaword	0x7b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.uaword	.LASF13
	.byte	0x2
	.byte	0x24
	.uaword	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.uaword	.LASF14
	.byte	0x2
	.byte	0x25
	.uaword	0x72
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.uaword	.LASF15
	.byte	0x2
	.byte	0x28
	.uaword	0x4f
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x5
	.uaword	.LASF17
	.byte	0x2
	.byte	0x2a
	.uaword	0x86
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF30
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x128
	.uleb128 0xa
	.asciz	"tc"
	.byte	0x1
	.byte	0xb
	.uaword	0x128
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.asciz	"id"
	.byte	0x1
	.byte	0xb
	.uaword	0x7b
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.uaword	0xe6
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF18
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.uaword	0x7b
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x197
	.uleb128 0xa
	.asciz	"tc"
	.byte	0x1
	.byte	0x17
	.uaword	0x128
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.uaword	.LASF13
	.byte	0x1
	.byte	0x17
	.uaword	0x72
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xd
	.uaword	.LASF14
	.byte	0x1
	.byte	0x17
	.uaword	0x72
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x1
	.byte	0x19
	.uaword	0x7b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xf
	.uaword	.LASF21
	.uaword	0x1a7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	__func__.2530
	.byte	0
	.uleb128 0x10
	.uaword	0x74
	.uaword	0x1a7
	.uleb128 0x11
	.uaword	0x6b
	.byte	0x12
	.byte	0
	.uleb128 0x12
	.uaword	0x197
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF19
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.uaword	0x7b
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x206
	.uleb128 0xa
	.asciz	"tc"
	.byte	0x1
	.byte	0x29
	.uaword	0x128
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.uaword	.LASF14
	.byte	0x1
	.byte	0x29
	.uaword	0x72
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x1
	.byte	0x2b
	.uaword	0x7b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xf
	.uaword	.LASF21
	.uaword	0x206
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	__func__.2536
	.byte	0
	.uleb128 0x12
	.uaword	0x197
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF22
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.uaword	0x7b
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x265
	.uleb128 0xa
	.asciz	"tc"
	.byte	0x1
	.byte	0x3a
	.uaword	0x128
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.uaword	.LASF14
	.byte	0x1
	.byte	0x3a
	.uaword	0x265
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x1
	.byte	0x3c
	.uaword	0x7b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xf
	.uaword	.LASF21
	.uaword	0x26b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	__func__.2542
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.uaword	0x72
	.uleb128 0x12
	.uaword	0x197
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0x4e
	.byte	0x1
	.uaword	0x7b
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x2d9
	.uleb128 0xa
	.asciz	"tc"
	.byte	0x1
	.byte	0x4e
	.uaword	0x128
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.uaword	.LASF24
	.byte	0x1
	.byte	0x4e
	.uaword	0x265
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xd
	.uaword	.LASF25
	.byte	0x1
	.byte	0x4e
	.uaword	0x265
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xe
	.uaword	.LASF20
	.byte	0x1
	.byte	0x50
	.uaword	0x7b
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xf
	.uaword	.LASF21
	.uaword	0x2e9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	__func__.2549
	.byte	0
	.uleb128 0x10
	.uaword	0x74
	.uaword	0x2e9
	.uleb128 0x11
	.uaword	0x6b
	.byte	0xd
	.byte	0
	.uleb128 0x12
	.uaword	0x2d9
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
.LASF23:
	.asciz	"getChannelJob"
.LASF5:
	.asciz	"short int"
.LASF15:
	.asciz	"status"
.LASF29:
	.asciz	"ThreadChannel__"
.LASF24:
	.asciz	"__fn"
.LASF17:
	.asciz	"ThreadChannel"
.LASF21:
	.asciz	"__func__"
.LASF13:
	.asciz	"fn_ptr"
.LASF20:
	.asciz	"ret_val"
.LASF1:
	.asciz	"unsigned char"
.LASF3:
	.asciz	"long unsigned int"
.LASF2:
	.asciz	"short unsigned int"
.LASF22:
	.asciz	"getChannelResponse"
.LASF11:
	.asciz	"request_id"
.LASF28:
	.asciz	"/Satvik/fft/cortos_build"
.LASF30:
	.asciz	"initChannel"
.LASF0:
	.asciz	"unsigned int"
.LASF7:
	.asciz	"long long unsigned int"
.LASF18:
	.asciz	"scheduleChannelJob"
.LASF19:
	.asciz	"setChannelResponse"
.LASF9:
	.asciz	"sizetype"
.LASF6:
	.asciz	"long long int"
.LASF10:
	.asciz	"char"
.LASF12:
	.asciz	"response_id"
.LASF26:
	.asciz	"GNU C 4.7.4"
.LASF25:
	.asciz	"__arg"
.LASF16:
	.asciz	"uint32_t"
.LASF8:
	.asciz	"long int"
.LASF4:
	.asciz	"signed char"
.LASF14:
	.asciz	"arg_ptr"
.LASF27:
	.asciz	"/home/ajit/ajit-toolchain/application_development/thread_channel/src/thread_channel.c"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
