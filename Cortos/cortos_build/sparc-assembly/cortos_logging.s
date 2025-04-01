	.file	"cortos_logging.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.global loggingLockAddr
	.section	".bss"
	.align 4
	.type	loggingLockAddr, #object
	.size	loggingLockAddr, 4
loggingLockAddr:
	.skip	4
	.section	".text"
	.align 4
	.global cortos_init_logging
	.type	cortos_init_logging, #function
	.proc	020
cortos_init_logging:
.LFB0:
	.file 1 "cortos_src/cortos_logging.c"
	.loc 1 11 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 13 0
	sethi	%hi(1073840128), %g1
	st	%g1, [%fp-4]
	.loc 1 14 0
	sethi	%hi(allocatedLocksNc), %g1
	or	%g1, %lo(allocatedLocksNc), %g1
	mov	1, %g2
	stb	%g2, [%g1+4]
	.loc 1 15 0
	ld	[%fp-4], %g1
	add	%g1, 4, %g2
	sethi	%hi(loggingLockAddr), %g1
	or	%g1, %lo(loggingLockAddr), %g1
	st	%g2, [%g1]
	.loc 1 16 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	cortos_init_logging, .-cortos_init_logging
	.section	".rodata"
	.align 8
.LC0:
	.asciz	"CoRTOS:LOG: %s: (%d,%d): %s:%d, %s() [%llu]. "
	.align 8
.LC1:
	.asciz	"\n"
	.section	".text"
	.align 4
	.global __cortos_log_printf
	.type	__cortos_log_printf, #function
	.proc	04
__cortos_log_printf:
.LFB1:
	.loc 1 28 0
	.cfi_startproc
	save	%sp, -1168, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 55 0
	st	%i5, [%fp+88]
	.loc 1 28 0
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	.loc 1 31 0
	st	%g0, [%fp-8]
	.loc 1 36 0
#APP
! 36 "cortos_src/cortos_logging.c" 1
	  rd %asr29, %l1
  mov %l1, %i5

! 0 "" 2
#NO_APP
	st	%i5, [%fp-12]
	.loc 1 44 0
	sethi	%hi(loggingLockAddr), %g1
	or	%g1, %lo(loggingLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 47 0
	call	cortos_get_clock_time, 0
	 nop
	std	%o0, [%fp-24]
	.loc 1 52 0
	ld	[%fp-12], %g2
	sethi	%hi(64512), %g1
	or	%g1, 768, %g1
	and	%g2, %g1, %g1
	.loc 1 50 0
	srl	%g1, 8, %g2
	ld	[%fp-12], %g1
	and	%g1, 255, %g1
	ld	[%fp+76], %g3
	st	%g3, [%sp+92]
	ld	[%fp-24], %g3
	st	%g3, [%sp+96]
	ld	[%fp-20], %g3
	st	%g3, [%sp+100]
	sethi	%hi(.LC0), %g3
	or	%g3, %lo(.LC0), %o0
	ld	[%fp+68], %o1
	mov	%g2, %o2
	mov	%g1, %o3
	ld	[%fp+72], %o4
	ld	[%fp+80], %o5
	call	printf_, 0
	 nop
	mov	%o0, %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 55 0
	add	%fp, 88, %g1
	st	%g1, [%fp-1052]
	.loc 1 56 0
	ld	[%fp-1052], %g1
	add	%fp, -1048, %g2
	mov	%g2, %o0
	ld	[%fp+84], %o1
	mov	%g1, %o2
	call	vsprintf_, 0
	 nop
	.loc 1 58 0
	add	%fp, -1048, %g1
	st	%g1, [%fp-4]
	.loc 1 59 0
	b	.L3
	 nop
.L4:
	.loc 1 60 0
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	uart_send_char, 0
	 nop
	.loc 1 61 0
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
	.loc 1 62 0
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L3:
	.loc 1 59 0 discriminator 1
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	bne	.L4
	 nop
	.loc 1 65 0
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %o0
	call	printf_, 0
	 nop
	mov	%o0, %g1
	ld	[%fp-8], %g2
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 67 0
	sethi	%hi(loggingLockAddr), %g1
	or	%g1, %lo(loggingLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 69 0
	ld	[%fp-8], %g1
	.loc 1 70 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	__cortos_log_printf, .-__cortos_log_printf
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdarg.h"
	.file 3 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 4 "cortos_src/cortos_locks.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x1ec
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
	.uaword	.LASF0
	.byte	0x2
	.byte	0x28
	.uaword	0x30
	.uleb128 0x3
	.byte	0x4
	.uaword	.LASF26
	.uleb128 0x2
	.uaword	.LASF1
	.byte	0x2
	.byte	0x66
	.uaword	0x25
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.uaword	.LASF2
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.uaword	.LASF3
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.uaword	.LASF4
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.uaword	.LASF5
	.uleb128 0x2
	.uaword	.LASF6
	.byte	0x3
	.byte	0x2e
	.uaword	0x6f
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.uaword	.LASF7
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uaword	.LASF8
	.uleb128 0x2
	.uaword	.LASF9
	.byte	0x3
	.byte	0x37
	.uaword	0x88
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.uaword	.LASF10
	.uleb128 0x6
	.byte	0x1
	.uaword	.LASF27
	.byte	0x1
	.byte	0xb
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xb7
	.uleb128 0x7
	.uaword	.LASF15
	.byte	0x1
	.byte	0xd
	.uaword	0xb7
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x64
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF28
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.uaword	0x41
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x185
	.uleb128 0xa
	.uaword	.LASF11
	.byte	0x1
	.byte	0x16
	.uaword	0x185
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.uaword	.LASF12
	.byte	0x1
	.byte	0x17
	.uaword	0x185
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xa
	.uaword	.LASF13
	.byte	0x1
	.byte	0x18
	.uaword	0x185
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xa
	.uaword	.LASF14
	.byte	0x1
	.byte	0x19
	.uaword	0x41
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0xb
	.asciz	"fmt"
	.byte	0x1
	.byte	0x1a
	.uaword	0x185
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xc
	.uleb128 0xd
	.asciz	"buf"
	.byte	0x1
	.byte	0x1d
	.uaword	0x197
	.byte	0x3
	.byte	0x91
	.sleb128 -1048
	.uleb128 0xd
	.asciz	"p"
	.byte	0x1
	.byte	0x1d
	.uaword	0x1af
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x7
	.uaword	.LASF16
	.byte	0x1
	.byte	0x1e
	.uaword	0x36
	.byte	0x3
	.byte	0x91
	.sleb128 -1052
	.uleb128 0xd
	.asciz	"n"
	.byte	0x1
	.byte	0x1f
	.uaword	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x7
	.uaword	.LASF17
	.byte	0x1
	.byte	0x20
	.uaword	0x48
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x7
	.uaword	.LASF18
	.byte	0x1
	.byte	0x21
	.uaword	0x7d
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.uaword	.LASF29
	.byte	0x1
	.byte	0x22
	.uaword	0x1b5
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x18b
	.uleb128 0xf
	.uaword	0x190
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.uaword	.LASF19
	.uleb128 0x10
	.uaword	0x190
	.uaword	0x1a8
	.uleb128 0x11
	.uaword	0x1a8
	.uahalf	0x3ff
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.uaword	.LASF20
	.uleb128 0x8
	.byte	0x4
	.uaword	0x190
	.uleb128 0x8
	.byte	0x4
	.uaword	0x48
	.uleb128 0x10
	.uaword	0x64
	.uaword	0x1cb
	.uleb128 0x12
	.uaword	0x1a8
	.byte	0xff
	.byte	0
	.uleb128 0x13
	.uaword	.LASF21
	.byte	0x4
	.byte	0xe
	.uaword	0x1d8
	.byte	0x1
	.byte	0x1
	.uleb128 0x14
	.uaword	0x1bb
	.uleb128 0x15
	.uaword	.LASF22
	.byte	0x1
	.byte	0x9
	.uaword	0xb7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	loggingLockAddr
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0xc
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
.LASF26:
	.asciz	"__builtin_va_list"
.LASF22:
	.asciz	"loggingLockAddr"
.LASF15:
	.asciz	"lockStartAddrNc"
.LASF9:
	.asciz	"uint64_t"
.LASF0:
	.asciz	"__gnuc_va_list"
.LASF27:
	.asciz	"cortos_init_logging"
.LASF7:
	.asciz	"unsigned char"
.LASF8:
	.asciz	"short unsigned int"
.LASF1:
	.asciz	"va_list"
.LASF25:
	.asciz	"/Satvik/fft/cortos_build"
.LASF2:
	.asciz	"unsigned int"
.LASF18:
	.asciz	"clock_time"
.LASF11:
	.asciz	"levelName"
.LASF24:
	.asciz	"cortos_src/cortos_logging.c"
.LASF6:
	.asciz	"uint8_t"
.LASF29:
	.asciz	"time"
.LASF20:
	.asciz	"sizetype"
.LASF5:
	.asciz	"long long int"
.LASF14:
	.asciz	"lineNum"
.LASF12:
	.asciz	"fileName"
.LASF23:
	.asciz	"GNU C 4.7.4"
.LASF4:
	.asciz	"short int"
.LASF16:
	.asciz	"args"
.LASF28:
	.asciz	"__cortos_log_printf"
.LASF17:
	.asciz	"asrValue"
.LASF19:
	.asciz	"char"
.LASF21:
	.asciz	"allocatedLocksNc"
.LASF3:
	.asciz	"signed char"
.LASF10:
	.asciz	"long long unsigned int"
.LASF13:
	.asciz	"funcName"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
