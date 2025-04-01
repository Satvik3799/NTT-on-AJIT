	.file	"utils.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global setXfftArgs
	.type	setXfftArgs, #function
	.proc	020
setXfftArgs:
.LFB3:
	.file 1 "../utils.c"
	.loc 1 12 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	.loc 1 13 0
	ld	[%fp+68], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1]
	.loc 1 14 0
	ld	[%fp+68], %g1
	ld	[%fp+76], %g2
	st	%g2, [%g1+4]
	.loc 1 15 0
	ld	[%fp+68], %g1
	ld	[%fp+80], %g2
	st	%g2, [%g1+8]
	.loc 1 16 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	setXfftArgs, .-setXfftArgs
	.align 4
	.global setXtwiddleArgs
	.type	setXtwiddleArgs, #function
	.proc	020
setXtwiddleArgs:
.LFB4:
	.loc 1 26 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	.loc 1 27 0
	ld	[%fp+68], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1]
	.loc 1 28 0
	ld	[%fp+68], %g1
	ld	[%fp+76], %g2
	st	%g2, [%g1+4]
	.loc 1 29 0
	ld	[%fp+68], %g1
	ld	[%fp+80], %g2
	st	%g2, [%g1+8]
	.loc 1 30 0
	ld	[%fp+68], %g1
	ld	[%fp+84], %g2
	st	%g2, [%g1+12]
	.loc 1 31 0
	ld	[%fp+68], %g1
	ld	[%fp+88], %g2
	st	%g2, [%g1+16]
	.loc 1 32 0
	ld	[%fp+68], %g1
	ld	[%fp+92], %g2
	st	%g2, [%g1+20]
	.loc 1 33 0
	ld	[%fp+68], %g1
	ld	[%fp+96], %g2
	st	%g2, [%g1+24]
	.loc 1 34 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	setXtwiddleArgs, .-setXtwiddleArgs
	.align 4
	.global twiddle_factors_thread
	.type	twiddle_factors_thread, #function
	.proc	020
twiddle_factors_thread:
.LFB5:
	.loc 1 37 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 38 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 39 0
	ld	[%fp-4], %g1
	ld	[%g1], %i4
	.loc 1 40 0
	ld	[%fp-4], %g1
	.loc 1 39 0
	ld	[%g1+8], %i5
	.loc 1 41 0
	ld	[%fp-4], %g1
	.loc 1 39 0
	ld	[%g1+12], %g4
	.loc 1 42 0
	ld	[%fp-4], %g1
	.loc 1 39 0
	ld	[%g1+16], %g3
	.loc 1 43 0
	ld	[%fp-4], %g1
	.loc 1 39 0
	ld	[%g1+20], %g2
	.loc 1 44 0
	ld	[%fp-4], %g1
	.loc 1 39 0
	ld	[%g1+24], %g1
	.loc 1 45 0
	ld	[%fp-4], %i3
	.loc 1 39 0
	ld	[%i3+4], %i3
	st	%i3, [%sp+92]
	mov	%i4, %o0
	mov	%i5, %o1
	mov	%g4, %o2
	mov	%g3, %o3
	mov	%g2, %o4
	mov	%g1, %o5
	call	twiddle_factors, 0
	 nop
	.loc 1 46 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	twiddle_factors_thread, .-twiddle_factors_thread
	.section	".rodata"
	.align 8
.LC0:
	.asciz	"%s (dim=%d):"
	.align 8
.LC1:
	.asciz	" %5.2f,%5.2f "
	.align 8
.LC2:
	.asciz	"\n"
	.section	".text"
	.align 4
	.global print_vector
	.type	print_vector, #function
	.proc	020
print_vector:
.LFB6:
	.loc 1 54 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	.loc 1 56 0
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %o0
	ld	[%fp+68], %o1
	ld	[%fp+76], %o2
	call	cortos_printf, 0
	 nop
	.loc 1 57 0
	st	%g0, [%fp-4]
	b	.L5
	 nop
.L6:
	.loc 1 58 0 discriminator 2
	ld	[%fp-4], %g1
	sll	%g1, 3, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f8
	fstod	%f8, %f10
	ld	[%fp-4], %g1
	sll	%g1, 3, %g1
	ld	[%fp+72], %g2
	add	%g2, %g1, %g1
	ld	[%g1+4], %f8
	fstod	%f8, %f8
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %o0
	std	%f10, [%fp-16]
	ldd	[%fp-16], %g2
	mov	%g2, %o1
	mov	%g3, %o2
	std	%f8, [%fp-16]
	ldd	[%fp-16], %g2
	mov	%g2, %o3
	mov	%g3, %o4
	call	cortos_printf, 0
	 nop
	.loc 1 57 0 discriminator 2
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L5:
	.loc 1 57 0 is_stmt 0 discriminator 1
	ld	[%fp-4], %g2
	ld	[%fp+76], %g1
	cmp	%g2, %g1
	bl	.L6
	 nop
	.loc 1 59 0 is_stmt 1
	sethi	%hi(.LC2), %g1
	or	%g1, %lo(.LC2), %o0
	call	cortos_printf, 0
	 nop
	.loc 1 60 0
	nop
	.loc 1 61 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	print_vector, .-print_vector
	.section	".rodata"
	.align 8
.LC3:
	.asciz	"DEBUG"
	.align 8
.LC4:
	.asciz	"../utils.c"
	.align 8
.LC5:
	.asciz	"calling fft(0x%x, %d, 0x%x.\n"
	.section	".text"
	.align 4
	.global fft_thread
	.type	fft_thread, #function
	.proc	020
fft_thread:
.LFB7:
	.loc 1 64 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 65 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
	.loc 1 66 0
	ld	[%fp+68], %g1
	ld	[%g1+4], %g1
	st	%g1, [%fp-8]
	.loc 1 67 0
	ld	[%fp+68], %g1
	ld	[%g1+8], %g1
	st	%g1, [%fp-12]
	.loc 1 69 0
	ld	[%fp-8], %g1
	ld	[%fp-12], %g2
	ld	[%fp-4], %g3
	st	%g3, [%sp+92]
	st	%g2, [%sp+96]
	sethi	%hi(.LC3), %g2
	or	%g2, %lo(.LC3), %o0
	sethi	%hi(.LC4), %g2
	or	%g2, %lo(.LC4), %o1
	sethi	%hi(__func__.2664), %g2
	or	%g2, %lo(__func__.2664), %o2
	mov	70, %o3
	sethi	%hi(.LC5), %g2
	or	%g2, %lo(.LC5), %o4
	mov	%g1, %o5
	call	__cortos_log_printf, 0
	 nop
	.loc 1 71 0
	ld	[%fp-8], %o0
	ld	[%fp-4], %o1
	ld	[%fp-12], %o2
	call	fft, 0
	 nop
	.loc 1 73 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	fft_thread, .-fft_thread
	.section	".rodata"
	.align 8
.LC6:
	.asciz	"calling ifft(0x%x, %d, 0x%x.\n"
	.section	".text"
	.align 4
	.global ifft_thread
	.type	ifft_thread, #function
	.proc	020
ifft_thread:
.LFB8:
	.loc 1 76 0
	.cfi_startproc
	save	%sp, -120, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 77 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-4]
	.loc 1 78 0
	ld	[%fp+68], %g1
	ld	[%g1+4], %g1
	st	%g1, [%fp-8]
	.loc 1 79 0
	ld	[%fp+68], %g1
	ld	[%g1+8], %g1
	st	%g1, [%fp-12]
	.loc 1 80 0
	ld	[%fp-8], %g1
	ld	[%fp-12], %g2
	ld	[%fp-4], %g3
	st	%g3, [%sp+92]
	st	%g2, [%sp+96]
	sethi	%hi(.LC3), %g2
	or	%g2, %lo(.LC3), %o0
	sethi	%hi(.LC4), %g2
	or	%g2, %lo(.LC4), %o1
	sethi	%hi(__func__.2671), %g2
	or	%g2, %lo(__func__.2671), %o2
	mov	81, %o3
	sethi	%hi(.LC6), %g2
	or	%g2, %lo(.LC6), %o4
	mov	%g1, %o5
	call	__cortos_log_printf, 0
	 nop
	.loc 1 82 0
	ld	[%fp-8], %o0
	ld	[%fp-4], %o1
	ld	[%fp-12], %o2
	call	ifft, 0
	 nop
	.loc 1 83 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE8:
	.size	ifft_thread, .-ifft_thread
	.section	".rodata"
	.align 8
	.type	__func__.2671, #object
	.size	__func__.2671, 12
__func__.2671:
	.asciz	"ifft_thread"
	.align 8
	.type	__func__.2664, #object
	.size	__func__.2664, 11
__func__.2664:
	.asciz	"fft_thread"
	.section	".text"
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 3 "../data_structs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x3eb
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF32
	.byte	0x1
	.uaword	.LASF33
	.uaword	.LASF34
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.uaword	.LASF0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.uaword	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF3
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
	.byte	0x1
	.byte	0x6
	.uaword	.LASF7
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF12
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.uaword	0x8f
	.uleb128 0x6
	.uaword	0x3a
	.uleb128 0x7
	.uaword	.LASF13
	.byte	0x2
	.byte	0x34
	.uaword	0x41
	.uleb128 0x7
	.uaword	.LASF14
	.byte	0x3
	.byte	0x7
	.uaword	0x25
	.uleb128 0x8
	.byte	0x8
	.byte	0x3
	.byte	0x8
	.uaword	0xcd
	.uleb128 0x9
	.asciz	"Re"
	.byte	0x3
	.byte	0x8
	.uaword	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.asciz	"Im"
	.byte	0x3
	.byte	0x8
	.uaword	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x7
	.uaword	.LASF15
	.byte	0x3
	.byte	0x8
	.uaword	0xaa
	.uleb128 0xa
	.uaword	.LASF17
	.byte	0xc
	.byte	0x3
	.byte	0x15
	.uaword	0x10b
	.uleb128 0x9
	.asciz	"n"
	.byte	0x3
	.byte	0x16
	.uaword	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.asciz	"v"
	.byte	0x3
	.byte	0x17
	.uaword	0x10b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.asciz	"tmp"
	.byte	0x3
	.byte	0x18
	.uaword	0x10b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.uaword	0xcd
	.uleb128 0x7
	.uaword	.LASF16
	.byte	0x3
	.byte	0x19
	.uaword	0xd8
	.uleb128 0xa
	.uaword	.LASF18
	.byte	0x1c
	.byte	0x3
	.byte	0x1c
	.uaword	0x185
	.uleb128 0xb
	.uaword	.LASF19
	.byte	0x3
	.byte	0x1d
	.uaword	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.asciz	"n"
	.byte	0x3
	.byte	0x1e
	.uaword	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.uaword	.LASF20
	.byte	0x3
	.byte	0x1f
	.uaword	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.uaword	.LASF21
	.byte	0x3
	.byte	0x20
	.uaword	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.asciz	"v"
	.byte	0x3
	.byte	0x21
	.uaword	0x10b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.asciz	"vo"
	.byte	0x3
	.byte	0x22
	.uaword	0x10b
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.asciz	"ve"
	.byte	0x3
	.byte	0x23
	.uaword	0x10b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0x7
	.uaword	.LASF18
	.byte	0x3
	.byte	0x24
	.uaword	0x11c
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x1e3
	.uleb128 0xd
	.uaword	.LASF22
	.byte	0x1
	.byte	0xb
	.uaword	0x1e3
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xe
	.asciz	"n"
	.byte	0x1
	.byte	0xb
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.asciz	"v"
	.byte	0x1
	.byte	0xb
	.uaword	0x10b
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xe
	.asciz	"tmp"
	.byte	0x1
	.byte	0xb
	.uaword	0x10b
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.uaword	0x111
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF24
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x276
	.uleb128 0xd
	.uaword	.LASF22
	.byte	0x1
	.byte	0x12
	.uaword	0x276
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.uaword	.LASF19
	.byte	0x1
	.byte	0x13
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.asciz	"n"
	.byte	0x1
	.byte	0x14
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xd
	.uaword	.LASF20
	.byte	0x1
	.byte	0x15
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0xd
	.uaword	.LASF21
	.byte	0x1
	.byte	0x16
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xe
	.asciz	"v"
	.byte	0x1
	.byte	0x17
	.uaword	0x10b
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0xe
	.asciz	"vo"
	.byte	0x1
	.byte	0x18
	.uaword	0x10b
	.byte	0x3
	.byte	0x91
	.sleb128 92
	.uleb128 0xe
	.asciz	"ve"
	.byte	0x1
	.byte	0x19
	.uaword	0x10b
	.byte	0x3
	.byte	0x91
	.sleb128 96
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.uaword	0x185
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF25
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x2b4
	.uleb128 0xd
	.uaword	.LASF26
	.byte	0x1
	.byte	0x24
	.uaword	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x10
	.uaword	.LASF22
	.byte	0x1
	.byte	0x26
	.uaword	0x276
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF27
	.byte	0x1
	.byte	0x32
	.byte	0x1
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x304
	.uleb128 0xd
	.uaword	.LASF28
	.byte	0x1
	.byte	0x33
	.uaword	0x89
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xe
	.asciz	"x"
	.byte	0x1
	.byte	0x34
	.uaword	0x10b
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xe
	.asciz	"n"
	.byte	0x1
	.byte	0x35
	.uaword	0x33
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x11
	.asciz	"i"
	.byte	0x1
	.byte	0x37
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF29
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x364
	.uleb128 0xd
	.uaword	.LASF26
	.byte	0x1
	.byte	0x3f
	.uaword	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x11
	.asciz	"n"
	.byte	0x1
	.byte	0x41
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x11
	.asciz	"v"
	.byte	0x1
	.byte	0x42
	.uaword	0x10b
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x11
	.asciz	"tmp"
	.byte	0x1
	.byte	0x43
	.uaword	0x10b
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.uaword	.LASF31
	.uaword	0x374
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	__func__.2664
	.byte	0
	.uleb128 0x13
	.uaword	0x3a
	.uaword	0x374
	.uleb128 0x14
	.uaword	0x80
	.byte	0xa
	.byte	0
	.uleb128 0x6
	.uaword	0x364
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF30
	.byte	0x1
	.byte	0x4b
	.byte	0x1
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x3d9
	.uleb128 0xd
	.uaword	.LASF26
	.byte	0x1
	.byte	0x4b
	.uaword	0x87
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x11
	.asciz	"n"
	.byte	0x1
	.byte	0x4d
	.uaword	0x33
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x11
	.asciz	"v"
	.byte	0x1
	.byte	0x4e
	.uaword	0x10b
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x11
	.asciz	"tmp"
	.byte	0x1
	.byte	0x4f
	.uaword	0x10b
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.uaword	.LASF31
	.uaword	0x3e9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.uaword	__func__.2671
	.byte	0
	.uleb128 0x13
	.uaword	0x3a
	.uaword	0x3e9
	.uleb128 0x14
	.uaword	0x80
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.uaword	0x3d9
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
.LLST5:
	.uaword	.LFB8-.Ltext0
	.uaword	.LCFI5-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI5-.Ltext0
	.uaword	.LFE8-.Ltext0
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
.LASF15:
	.asciz	"complex"
.LASF23:
	.asciz	"setXfftArgs"
.LASF17:
	.asciz	"xfftArgs__"
.LASF31:
	.asciz	"__func__"
.LASF0:
	.asciz	"float"
.LASF4:
	.asciz	"unsigned char"
.LASF28:
	.asciz	"title"
.LASF6:
	.asciz	"long unsigned int"
.LASF5:
	.asciz	"short unsigned int"
.LASF33:
	.asciz	"../utils.c"
.LASF29:
	.asciz	"fft_thread"
.LASF1:
	.asciz	"double"
.LASF34:
	.asciz	"/Satvik/fft/cortos_build"
.LASF24:
	.asciz	"setXtwiddleArgs"
.LASF3:
	.asciz	"unsigned int"
.LASF14:
	.asciz	"real"
.LASF10:
	.asciz	"long long unsigned int"
.LASF12:
	.asciz	"sizetype"
.LASF9:
	.asciz	"long long int"
.LASF2:
	.asciz	"char"
.LASF25:
	.asciz	"twiddle_factors_thread"
.LASF32:
	.asciz	"GNU C 4.7.4"
.LASF8:
	.asciz	"short int"
.LASF22:
	.asciz	"args"
.LASF18:
	.asciz	"xtwiddleFactorArgs"
.LASF27:
	.asciz	"print_vector"
.LASF11:
	.asciz	"long int"
.LASF19:
	.asciz	"inv_flag"
.LASF26:
	.asciz	"vargs"
.LASF7:
	.asciz	"signed char"
.LASF13:
	.asciz	"uint32_t"
.LASF21:
	.asciz	"stride"
.LASF30:
	.asciz	"ifft_thread"
.LASF20:
	.asciz	"start_index"
.LASF16:
	.asciz	"xfftArgs"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
