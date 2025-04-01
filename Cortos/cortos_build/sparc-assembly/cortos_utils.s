	.file	"cortos_utils.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.global printingLockAddr
	.section	".bss"
	.align 4
	.type	printingLockAddr, #object
	.size	printingLockAddr, 4
printingLockAddr:
	.skip	4
	.section	".text"
	.align 4
	.global cortos_init_printing
	.type	cortos_init_printing, #function
	.proc	020
cortos_init_printing:
.LFB0:
	.file 1 "cortos_src/cortos_utils.c"
	.loc 1 14 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 16 0
	sethi	%hi(1073840128), %g1
	st	%g1, [%fp-4]
	.loc 1 17 0
	sethi	%hi(allocatedLocksNc), %g1
	or	%g1, %lo(allocatedLocksNc), %g1
	mov	1, %g2
	stb	%g2, [%g1+5]
	.loc 1 18 0
	ld	[%fp-4], %g1
	add	%g1, 5, %g2
	sethi	%hi(printingLockAddr), %g1
	or	%g1, %lo(printingLockAddr), %g1
	st	%g2, [%g1]
	.loc 1 19 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	cortos_init_printing, .-cortos_init_printing
	.align 4
	.global cortos_get_clock_time
	.type	cortos_get_clock_time, #function
	.proc	017
cortos_get_clock_time:
.LFB1:
	.loc 1 21 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 22 0
	call	__ajit_get_clock_time, 0
	 nop
	mov	%o0, %g2
	mov	%o1, %g3
	.loc 1 23 0
	mov	%g2, %i0
	mov	%g3, %i1
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	cortos_get_clock_time, .-cortos_get_clock_time
	.align 4
	.global cortos_sleep
	.type	cortos_sleep, #function
	.proc	020
cortos_sleep:
.LFB2:
	.loc 1 25 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 26 0
	ld	[%fp+68], %o0
	call	__ajit_sleep__, 0
	 nop
	.loc 1 27 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE2:
	.size	cortos_sleep, .-cortos_sleep
	.align 4
	.global cortos_get_thread_id
	.type	cortos_get_thread_id, #function
	.proc	02
cortos_get_thread_id:
.LFB3:
	.loc 1 35 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 38 0
#APP
! 38 "cortos_src/cortos_utils.c" 1
	  rd %asr29, %l1
  mov %l1, %i5

! 0 "" 2
#NO_APP
	st	%i5, [%fp-4]
	.loc 1 46 0
	ld	[%fp-4], %g2
	sethi	%hi(64512), %g1
	or	%g1, 768, %g1
	and	%g2, %g1, %g1
	srl	%g1, 8, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ld	[%fp-4], %g1
	add	%g2, %g1, %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	.loc 1 47 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	cortos_get_thread_id, .-cortos_get_thread_id
	.align 4
	.global cortos_IsNcRamAddr
	.type	cortos_IsNcRamAddr, #function
	.proc	014
cortos_IsNcRamAddr:
.LFB4:
	.loc 1 49 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 50 0
	stb	%g0, [%fp-1]
	.loc 1 51 0
	mov	0, %g1
	and	%g1, 0xff, %g1
	.loc 1 52 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	cortos_IsNcRamAddr, .-cortos_IsNcRamAddr
	.align 4
	.global cortos_printf
	.type	cortos_printf, #function
	.proc	04
cortos_printf:
.LFB5:
	.loc 1 60 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 65 0
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 60 0
	st	%i0, [%fp+68]
	.loc 1 62 0
	st	%g0, [%fp-4]
	.loc 1 65 0
	add	%fp, 72, %g1
	st	%g1, [%fp-8]
	.loc 1 66 0
	ld	[%fp-8], %g1
	ld	[%fp+68], %o0
	mov	%g1, %o1
	call	cortos_vprintf, 0
	 nop
	st	%o0, [%fp-4]
	.loc 1 70 0
	ld	[%fp-4], %g1
	.loc 1 71 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	cortos_printf, .-cortos_printf
	.align 4
	.global cortos_vprintf
	.type	cortos_vprintf, #function
	.proc	04
cortos_vprintf:
.LFB6:
	.loc 1 75 0
	.cfi_startproc
	save	%sp, -1128, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 79 0
	add	%fp, -1032, %g1
	mov	%g1, %o0
	ld	[%fp+68], %o1
	ld	[%fp+72], %o2
	call	vsprintf_, 0
	 nop
	.loc 1 81 0
	add	%fp, -1032, %g1
	st	%g1, [%fp-4]
	.loc 1 82 0
	st	%g0, [%fp-8]
	.loc 1 84 0
	sethi	%hi(printingLockAddr), %g1
	or	%g1, %lo(printingLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_acquire_buzy, 0
	 nop
	.loc 1 86 0
	b	.L12
	 nop
.L13:
	.loc 1 87 0
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	mov	%g1, %o0
	call	uart_send_char, 0
	 nop
	.loc 1 88 0
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
	.loc 1 89 0
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L12:
	.loc 1 86 0 discriminator 1
	ld	[%fp-4], %g1
	ldub	[%g1], %g1
	sll	%g1, 24, %g1
	sra	%g1, 24, %g1
	cmp	%g1, 0
	bne	.L13
	 nop
	.loc 1 92 0
	sethi	%hi(printingLockAddr), %g1
	or	%g1, %lo(printingLockAddr), %g1
	ld	[%g1], %g1
	mov	%g1, %o0
	call	cortos_lock_release, 0
	 nop
	.loc 1 94 0
	ld	[%fp-8], %g1
	.loc 1 95 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	cortos_vprintf, .-cortos_vprintf
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 3 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdarg.h"
	.file 4 "cortos_src/cortos_locks.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x283
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF27
	.byte	0x1
	.uaword	.LASF28
	.uaword	.LASF29
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
	.uleb128 0x4
	.uaword	.LASF8
	.byte	0x2
	.byte	0x37
	.uaword	0x77
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF9
	.uleb128 0x4
	.uaword	.LASF10
	.byte	0x3
	.byte	0x28
	.uaword	0x89
	.uleb128 0x5
	.byte	0x4
	.uaword	.LASF30
	.uleb128 0x4
	.uaword	.LASF11
	.byte	0x3
	.byte	0x66
	.uaword	0x7e
	.uleb128 0x6
	.byte	0x1
	.uaword	.LASF31
	.byte	0x1
	.byte	0xe
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0xc2
	.uleb128 0x7
	.uaword	.LASF14
	.byte	0x1
	.byte	0x10
	.uaword	0xc2
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x41
	.uleb128 0x9
	.byte	0x1
	.uaword	.LASF32
	.byte	0x1
	.byte	0x15
	.uaword	0x6c
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.uaword	.LASF12
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.uaword	.LFB2
	.uaword	.LFE2
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x10b
	.uleb128 0xb
	.uaword	.LASF17
	.byte	0x1
	.byte	0x19
	.uaword	0x5a
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF13
	.byte	0x1
	.byte	0x23
	.uaword	0x137
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x137
	.uleb128 0x7
	.uaword	.LASF15
	.byte	0x1
	.byte	0x24
	.uaword	0x65
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF16
	.uleb128 0xd
	.byte	0x1
	.uaword	.LASF20
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.uaword	0x41
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x17a
	.uleb128 0xb
	.uaword	.LASF18
	.byte	0x1
	.byte	0x31
	.uaword	0x17a
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x7
	.uaword	.LASF19
	.byte	0x1
	.byte	0x32
	.uaword	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -1
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF21
	.byte	0x1
	.byte	0x3c
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x1c5
	.uleb128 0x10
	.asciz	"fmt"
	.byte	0x1
	.byte	0x3c
	.uaword	0x1c5
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x11
	.uleb128 0x7
	.uaword	.LASF22
	.byte	0x1
	.byte	0x3d
	.uaword	0x8f
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x12
	.asciz	"n"
	.byte	0x1
	.byte	0x3e
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x1cb
	.uleb128 0x13
	.uaword	0x137
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.uaword	0x33
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x234
	.uleb128 0x10
	.asciz	"fmt"
	.byte	0x1
	.byte	0x4a
	.uaword	0x1c5
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xb
	.uaword	.LASF22
	.byte	0x1
	.byte	0x4a
	.uaword	0x8f
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x12
	.asciz	"buf"
	.byte	0x1
	.byte	0x4c
	.uaword	0x234
	.byte	0x3
	.byte	0x91
	.sleb128 -1032
	.uleb128 0x12
	.asciz	"p"
	.byte	0x1
	.byte	0x4c
	.uaword	0x24c
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x12
	.asciz	"n"
	.byte	0x1
	.byte	0x52
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x14
	.uaword	0x137
	.uaword	0x245
	.uleb128 0x15
	.uaword	0x245
	.uahalf	0x3ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF24
	.uleb128 0x8
	.byte	0x4
	.uaword	0x137
	.uleb128 0x14
	.uaword	0x41
	.uaword	0x262
	.uleb128 0x16
	.uaword	0x245
	.byte	0xff
	.byte	0
	.uleb128 0x17
	.uaword	.LASF25
	.byte	0x4
	.byte	0xe
	.uaword	0x26f
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.uaword	0x252
	.uleb128 0x19
	.uaword	.LASF26
	.byte	0x1
	.byte	0xc
	.uaword	0xc2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	printingLockAddr
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.byte	0
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
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
.LLST6:
	.uaword	.LFB6-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE6-.Ltext0
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
.LASF19:
	.asciz	"present"
.LASF28:
	.asciz	"cortos_src/cortos_utils.c"
.LASF32:
	.asciz	"cortos_get_clock_time"
.LASF30:
	.asciz	"__builtin_va_list"
.LASF31:
	.asciz	"cortos_init_printing"
.LASF20:
	.asciz	"cortos_IsNcRamAddr"
.LASF14:
	.asciz	"lockStartAddrNc"
.LASF8:
	.asciz	"uint64_t"
.LASF18:
	.asciz	"addr"
.LASF10:
	.asciz	"__gnuc_va_list"
.LASF12:
	.asciz	"cortos_sleep"
.LASF3:
	.asciz	"unsigned char"
.LASF17:
	.asciz	"clock_cycles"
.LASF4:
	.asciz	"short unsigned int"
.LASF11:
	.asciz	"va_list"
.LASF29:
	.asciz	"/Satvik/fft/cortos_build"
.LASF26:
	.asciz	"printingLockAddr"
.LASF23:
	.asciz	"cortos_vprintf"
.LASF7:
	.asciz	"unsigned int"
.LASF9:
	.asciz	"long long unsigned int"
.LASF5:
	.asciz	"uint8_t"
.LASF24:
	.asciz	"sizetype"
.LASF2:
	.asciz	"long long int"
.LASF16:
	.asciz	"char"
.LASF27:
	.asciz	"GNU C 4.7.4"
.LASF1:
	.asciz	"short int"
.LASF22:
	.asciz	"args"
.LASF15:
	.asciz	"asrValue"
.LASF6:
	.asciz	"uint32_t"
.LASF21:
	.asciz	"cortos_printf"
.LASF25:
	.asciz	"allocatedLocksNc"
.LASF0:
	.asciz	"signed char"
.LASF13:
	.asciz	"cortos_get_thread_id"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
