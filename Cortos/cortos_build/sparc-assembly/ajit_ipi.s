	.file	"ajit_ipi.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global __ajit_get_ipi_message_pointer__
	.type	__ajit_get_ipi_message_pointer__, #function
	.proc	0110
__ajit_get_ipi_message_pointer__:
.LFB3:
	.file 1 "/home/ajit/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_ipi.c"
	.loc 1 13 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g2
	mov	%i2, %g1
	stb	%g2, [%fp+72]
	stb	%g1, [%fp+76]
	.loc 1 14 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 15 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 17 0
	ld	[%fp-8], %g1
	sll	%g1, 3, %g2
	ld	[%fp-4], %g1
	add	%g2, %g1, %g1
	add	%g1, 8, %g1
	st	%g1, [%fp-12]
	.loc 1 18 0
	ld	[%fp-12], %g1
	.loc 1 19 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE3:
	.size	__ajit_get_ipi_message_pointer__, .-__ajit_get_ipi_message_pointer__
	.align 4
	.global __ajit_set_ipi_interrupt__
	.type	__ajit_set_ipi_interrupt__, #function
	.proc	04
__ajit_set_ipi_interrupt__:
.LFB4:
	.loc 1 32 0
	.cfi_startproc
	save	%sp, -128, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g4
	mov	%i2, %g3
	mov	%i3, %g2
	mov	%i4, %g1
	st	%i5, [%fp+88]
	stb	%g4, [%fp+72]
	stb	%g3, [%fp+76]
	stb	%g2, [%fp+80]
	stb	%g1, [%fp+84]
	.loc 1 33 0
	st	%g0, [%fp-4]
	.loc 1 41 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-8]
	.loc 1 42 0
	ldub	[%fp+80], %g1
	and	%g1, 0xff, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-12]
	.loc 1 44 0
	ldub	[%fp+80], %g1
	and	%g1, 0xff, %g2
	ldub	[%fp+84], %g1
	and	%g1, 0xff, %g1
	ld	[%fp+68], %o0
	mov	%g2, %o1
	mov	%g1, %o2
	call	__ajit_get_ipi_message_pointer__, 0
	 nop
	st	%o0, [%fp-16]
	.loc 1 47 0
	ld	[%fp-12], %g1
	mov	1, %g2
	sll	%g2, %g1, %g1
	st	%g1, [%fp-20]
	.loc 1 50 0
	ld	[%fp-8], %g1
	add	%g1, 4, %g1
	ld	[%g1], %g1
	st	%g1, [%fp-24]
	.loc 1 51 0
	ld	[%fp-8], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-28]
	.loc 1 54 0
	ld	[%fp-16], %g1
	ldub	[%fp+72], %g2
	stb	%g2, [%g1]
	.loc 1 55 0
	ld	[%fp-16], %g1
	ldub	[%fp+76], %g2
	stb	%g2, [%g1+1]
	.loc 1 56 0
	ld	[%fp-16], %g1
	ldub	[%fp+80], %g2
	stb	%g2, [%g1+2]
	.loc 1 57 0
	ld	[%fp-16], %g1
	ldub	[%fp+84], %g2
	stb	%g2, [%g1+3]
	.loc 1 58 0
	ld	[%fp-16], %g1
	ld	[%fp+88], %g2
	st	%g2, [%g1+4]
	.loc 1 62 0
	ld	[%fp-24], %g2
	ld	[%fp-20], %g1
	and	%g2, %g1, %g2
	ld	[%fp-28], %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L4
	 nop
	.loc 1 67 0
	mov	1, %g1
	st	%g1, [%fp-4]
	b	.L5
	 nop
.L4:
	.loc 1 71 0
	ld	[%fp-20], %g1
	xnor	%g0, %g1, %g2
	ld	[%fp-24], %g1
	and	%g2, %g1, %g2
	ld	[%fp-20], %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-24]
	.loc 1 72 0
	ld	[%fp-8], %g1
	add	%g1, 4, %g1
	ld	[%fp-24], %g2
	st	%g2, [%g1]
.L5:
	.loc 1 82 0
	ld	[%fp-4], %g1
	.loc 1 83 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE4:
	.size	__ajit_set_ipi_interrupt__, .-__ajit_set_ipi_interrupt__
	.align 4
	.global __ajit_enable_ipi_interrupt__
	.type	__ajit_enable_ipi_interrupt__, #function
	.proc	04
__ajit_enable_ipi_interrupt__:
.LFB5:
	.loc 1 88 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI2:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g2
	mov	%i2, %g1
	stb	%g2, [%fp+72]
	stb	%g1, [%fp+76]
	.loc 1 89 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 90 0
	mov	1, %g2
	ld	[%fp-4], %g1
	sll	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 92 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-12]
	.loc 1 93 0
	ld	[%fp-12], %g2
	ld	[%fp-8], %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	be	.L8
	 nop
	.loc 1 94 0
	mov	1, %g1
	b	.L9
	 nop
.L8:
	.loc 1 96 0
	ld	[%fp-12], %g2
	ld	[%fp-8], %g1
	or	%g2, %g1, %g1
	st	%g1, [%fp-12]
	.loc 1 97 0
	ld	[%fp+68], %g1
	ld	[%fp-12], %g2
	st	%g2, [%g1]
	.loc 1 99 0
	mov	0, %g1
.L9:
	.loc 1 100 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE5:
	.size	__ajit_enable_ipi_interrupt__, .-__ajit_enable_ipi_interrupt__
	.align 4
	.global __ajit_disable_ipi_interrupt__
	.type	__ajit_disable_ipi_interrupt__, #function
	.proc	04
__ajit_disable_ipi_interrupt__:
.LFB6:
	.loc 1 105 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI3:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g2
	mov	%i2, %g1
	stb	%g2, [%fp+72]
	stb	%g1, [%fp+76]
	.loc 1 106 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
	.loc 1 107 0
	mov	1, %g2
	ld	[%fp-4], %g1
	sll	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 109 0
	ld	[%fp+68], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-12]
	.loc 1 110 0
	ld	[%fp-12], %g2
	ld	[%fp-8], %g1
	and	%g2, %g1, %g1
	cmp	%g1, 0
	bne	.L11
	 nop
	.loc 1 111 0
	mov	1, %g1
	b	.L12
	 nop
.L11:
	.loc 1 113 0
	ld	[%fp-8], %g1
	xnor	%g0, %g1, %g1
	ld	[%fp-12], %g2
	and	%g2, %g1, %g1
	st	%g1, [%fp-12]
	.loc 1 114 0
	ld	[%fp+68], %g1
	ld	[%fp-12], %g2
	st	%g2, [%g1]
	.loc 1 116 0
	mov	0, %g1
.L12:
	.loc 1 117 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE6:
	.size	__ajit_disable_ipi_interrupt__, .-__ajit_disable_ipi_interrupt__
	.align 4
	.global __ajit_clear_ipi_interrupt__
	.type	__ajit_clear_ipi_interrupt__, #function
	.proc	04
__ajit_clear_ipi_interrupt__:
.LFB7:
	.loc 1 122 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI4:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g2
	mov	%i2, %g1
	stb	%g2, [%fp+72]
	stb	%g1, [%fp+76]
	.loc 1 123 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 124 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 126 0
	ld	[%fp-8], %g1
	mov	1, %g2
	sll	%g2, %g1, %g1
	st	%g1, [%fp-12]
	.loc 1 129 0
	ld	[%fp-4], %g1
	add	%g1, 4, %g1
	ld	[%g1], %g1
	st	%g1, [%fp-16]
	.loc 1 130 0
	ld	[%fp-12], %g1
	xnor	%g0, %g1, %g1
	ld	[%fp-16], %g2
	and	%g2, %g1, %g1
	st	%g1, [%fp-16]
	.loc 1 131 0
	ld	[%fp-4], %g1
	add	%g1, 4, %g1
	ld	[%fp-16], %g2
	st	%g2, [%g1]
	.loc 1 134 0
	mov	0, %g1
	.loc 1 135 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE7:
	.size	__ajit_clear_ipi_interrupt__, .-__ajit_clear_ipi_interrupt__
	.align 4
	.global __ajit_set_ipi_mask_register__
	.type	__ajit_set_ipi_mask_register__, #function
	.proc	020
__ajit_set_ipi_mask_register__:
.LFB8:
	.loc 1 138 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI5:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 139 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 140 0
	ld	[%fp-4], %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1]
	.loc 1 141 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE8:
	.size	__ajit_set_ipi_mask_register__, .-__ajit_set_ipi_mask_register__
	.align 4
	.global __ajit_get_ipi_mask_register__
	.type	__ajit_get_ipi_mask_register__, #function
	.proc	016
__ajit_get_ipi_mask_register__:
.LFB9:
	.loc 1 144 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI6:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 145 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 146 0
	ld	[%fp-4], %g1
	ld	[%g1], %g1
	.loc 1 147 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE9:
	.size	__ajit_get_ipi_mask_register__, .-__ajit_get_ipi_mask_register__
	.align 4
	.global __ajit_set_ipi_value_register__
	.type	__ajit_set_ipi_value_register__, #function
	.proc	020
__ajit_set_ipi_value_register__:
.LFB10:
	.loc 1 150 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI7:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	.loc 1 151 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 152 0
	ld	[%fp-4], %g1
	add	%g1, 4, %g1
	ld	[%fp+72], %g2
	st	%g2, [%g1]
	.loc 1 153 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE10:
	.size	__ajit_set_ipi_value_register__, .-__ajit_set_ipi_value_register__
	.align 4
	.global __ajit_get_ipi_value_register__
	.type	__ajit_get_ipi_value_register__, #function
	.proc	016
__ajit_get_ipi_value_register__:
.LFB11:
	.loc 1 156 0
	.cfi_startproc
	save	%sp, -104, %sp
.LCFI8:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 158 0
	ld	[%fp-4], %g1
	add	%g1, 4, %g1
	ld	[%g1], %g1
	.loc 1 159 0
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE11:
	.size	__ajit_get_ipi_value_register__, .-__ajit_get_ipi_value_register__
	.align 4
	.global __ajit_read_ipi_info__
	.type	__ajit_read_ipi_info__, #function
	.proc	020
__ajit_read_ipi_info__:
.LFB12:
	.loc 1 165 0
	.cfi_startproc
	save	%sp, -112, %sp
.LCFI9:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	mov	%i1, %g2
	mov	%i2, %g1
	st	%i3, [%fp+80]
	st	%i4, [%fp+84]
	st	%i5, [%fp+88]
	stb	%g2, [%fp+72]
	stb	%g1, [%fp+76]
	.loc 1 166 0
	ld	[%fp+68], %g1
	st	%g1, [%fp-4]
	.loc 1 167 0
	ldub	[%fp+72], %g1
	and	%g1, 0xff, %g1
	add	%g1, %g1, %g1
	mov	%g1, %g2
	ldub	[%fp+76], %g1
	and	%g1, 0xff, %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	.loc 1 169 0
	ld	[%fp+88], %g1
	cmp	%g1, 0
	be	.L22
	 nop
	.loc 1 171 0
	ld	[%fp-8], %g1
	sll	%g1, 3, %g2
	ld	[%fp-4], %g1
	add	%g2, %g1, %g1
	add	%g1, 8, %g1
	mov	%g1, %g2
	ld	[%fp+88], %g1
	st	%g2, [%g1]
.L22:
	.loc 1 175 0
	ld	[%fp+80], %g1
	cmp	%g1, 0
	be	.L23
	 nop
.LBB2:
	.loc 1 177 0
	ld	[%fp-4], %g1
	ld	[%g1], %g1
	st	%g1, [%fp-12]
	.loc 1 178 0
	ld	[%fp-8], %g1
	ld	[%fp-12], %g2
	srl	%g2, %g1, %g1
	and	%g1, 1, %g2
	ld	[%fp+80], %g1
	st	%g2, [%g1]
.L23:
.LBE2:
	.loc 1 180 0
	ld	[%fp+84], %g1
	cmp	%g1, 0
	be	.L21
	 nop
.LBB3:
	.loc 1 182 0
	ld	[%fp-4], %g1
	add	%g1, 4, %g1
	ld	[%g1], %g1
	st	%g1, [%fp-16]
	.loc 1 183 0
	ld	[%fp-8], %g1
	ld	[%fp-16], %g2
	srl	%g2, %g1, %g1
	and	%g1, 1, %g2
	ld	[%fp+84], %g1
	st	%g2, [%g1]
.L21:
.LBE3:
	.loc 1 185 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE12:
	.size	__ajit_read_ipi_info__, .-__ajit_read_ipi_info__
	.align 4
	.global __ajit_acquire_ipi_lock__
	.type	__ajit_acquire_ipi_lock__, #function
	.proc	020
__ajit_acquire_ipi_lock__:
.LFB13:
	.loc 1 188 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI10:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 192 0
	ld	[%fp+68], %g1
	add	%g1, 72, %g1
	mov	%g1, %o0
	call	acquire_mutex_using_swap, 0
	 nop
	.loc 1 196 0
	nop
	.loc 1 197 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE13:
	.size	__ajit_acquire_ipi_lock__, .-__ajit_acquire_ipi_lock__
	.align 4
	.global __ajit_release_ipi_lock__
	.type	__ajit_release_ipi_lock__, #function
	.proc	020
__ajit_release_ipi_lock__:
.LFB14:
	.loc 1 201 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI11:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 205 0
	ld	[%fp+68], %g1
	add	%g1, 72, %g1
	st	%g0, [%g1]
	.loc 1 209 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE14:
	.size	__ajit_release_ipi_lock__, .-__ajit_release_ipi_lock__
	.align 4
	.global __ajit_ipi_init__
	.type	__ajit_ipi_init__, #function
	.proc	020
__ajit_ipi_init__:
.LFB15:
	.loc 1 213 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI12:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	st	%i0, [%fp+68]
	.loc 1 216 0
	ld	[%fp+68], %g1
	st	%g0, [%g1]
	.loc 1 217 0
	ld	[%fp+68], %g1
	add	%g1, 4, %g1
	st	%g0, [%g1]
	.loc 1 218 0
	ld	[%fp+68], %g1
	add	%g1, 72, %g1
	st	%g0, [%g1]
	.loc 1 219 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE15:
	.size	__ajit_ipi_init__, .-__ajit_ipi_init__
.Letext0:
	.file 2 "/home/ajit/ajit-toolchain/build/buildroot-2014.08/output/host/usr/lib/gcc/sparc-buildroot-linux-uclibc/4.7.4/include/stdint-gcc.h"
	.file 3 "/home/ajit/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/include/ajit_ipi.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x612
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF45
	.byte	0x1
	.uaword	.LASF46
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.uaword	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LASF5
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
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
	.uaword	.LASF11
	.byte	0x2
	.byte	0x2e
	.uaword	0x3d
	.uleb128 0x5
	.uaword	.LASF12
	.byte	0x2
	.byte	0x34
	.uaword	0x21
	.uleb128 0x6
	.uaword	.LASF47
	.byte	0x8
	.byte	0x3
	.byte	0x11
	.uaword	0xe0
	.uleb128 0x7
	.uaword	.LASF13
	.byte	0x3
	.byte	0x12
	.uaword	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.uaword	.LASF14
	.byte	0x3
	.byte	0x13
	.uaword	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x7
	.uaword	.LASF15
	.byte	0x3
	.byte	0x14
	.uaword	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.uaword	.LASF16
	.byte	0x3
	.byte	0x15
	.uaword	0x77
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x7
	.uaword	.LASF17
	.byte	0x3
	.byte	0x16
	.uaword	0x6e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x5
	.uaword	.LASF18
	.byte	0x3
	.byte	0x17
	.uaword	0x8d
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF23
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.uaword	0x161
	.uaword	.LFB3
	.uaword	.LFE3
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x161
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0xb
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0xc
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0xc
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0xe
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.uaword	.LASF21
	.byte	0x1
	.byte	0xf
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.uaword	.LASF22
	.byte	0x1
	.byte	0x11
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.uaword	0xe0
	.uleb128 0xc
	.byte	0x1
	.uaword	.LASF24
	.byte	0x1
	.byte	0x1b
	.byte	0x1
	.uaword	0x28
	.uaword	.LFB4
	.uaword	.LFE4
	.uaword	.LLST1
	.byte	0x1
	.uaword	0x242
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x1b
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF13
	.byte	0x1
	.byte	0x1c
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF14
	.byte	0x1
	.byte	0x1c
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0x1d
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0x1d
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0xd
	.asciz	"ptr"
	.byte	0x1
	.byte	0x1e
	.uaword	0x6e
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0xa
	.uaword	.LASF25
	.byte	0x1
	.byte	0x21
	.uaword	0x28
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0x29
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.uaword	.LASF21
	.byte	0x1
	.byte	0x2a
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.uaword	.LASF26
	.byte	0x1
	.byte	0x2c
	.uaword	0x161
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.uaword	.LASF27
	.byte	0x1
	.byte	0x2f
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.uaword	.LASF28
	.byte	0x1
	.byte	0x32
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.uaword	.LASF29
	.byte	0x1
	.byte	0x33
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF30
	.byte	0x1
	.byte	0x57
	.byte	0x1
	.uaword	0x28
	.uaword	.LFB5
	.uaword	.LFE5
	.uaword	.LLST2
	.byte	0x1
	.uaword	0x2b6
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x57
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0x57
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0x57
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xa
	.uaword	.LASF31
	.byte	0x1
	.byte	0x59
	.uaword	0x28
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.asciz	"m"
	.byte	0x1
	.byte	0x5a
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.uaword	.LASF32
	.byte	0x1
	.byte	0x5c
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF33
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.uaword	0x28
	.uaword	.LFB6
	.uaword	.LFE6
	.uaword	.LLST3
	.byte	0x1
	.uaword	0x32a
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x68
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0x68
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0x68
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xa
	.uaword	.LASF31
	.byte	0x1
	.byte	0x6a
	.uaword	0x28
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xe
	.asciz	"m"
	.byte	0x1
	.byte	0x6b
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.uaword	.LASF32
	.byte	0x1
	.byte	0x6d
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF34
	.byte	0x1
	.byte	0x79
	.byte	0x1
	.uaword	0x28
	.uaword	.LFB7
	.uaword	.LFE7
	.uaword	.LLST4
	.byte	0x1
	.uaword	0x3ae
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x79
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0x79
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0x79
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0x7b
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.uaword	.LASF21
	.byte	0x1
	.byte	0x7c
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xa
	.uaword	.LASF35
	.byte	0x1
	.byte	0x7e
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.uaword	.LASF28
	.byte	0x1
	.byte	0x81
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF37
	.byte	0x1
	.byte	0x89
	.byte	0x1
	.uaword	.LFB8
	.uaword	.LFE8
	.uaword	.LLST5
	.byte	0x1
	.uaword	0x3f3
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x89
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.asciz	"m"
	.byte	0x1
	.byte	0x89
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0x8b
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF36
	.byte	0x1
	.byte	0x8f
	.byte	0x1
	.uaword	0x82
	.uaword	.LFB9
	.uaword	.LFE9
	.uaword	.LLST6
	.byte	0x1
	.uaword	0x42f
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x8f
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0x91
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF38
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.uaword	.LFB10
	.uaword	.LFE10
	.uaword	.LLST7
	.byte	0x1
	.uaword	0x474
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x95
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xd
	.asciz	"m"
	.byte	0x1
	.byte	0x95
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0x97
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.uaword	.LASF39
	.byte	0x1
	.byte	0x9b
	.byte	0x1
	.uaword	0x82
	.uaword	.LFB11
	.uaword	.LFE11
	.uaword	.LLST8
	.byte	0x1
	.uaword	0x4b0
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0x9b
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0x9d
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF40
	.byte	0x1
	.byte	0xa2
	.byte	0x1
	.uaword	.LFB12
	.uaword	.LFE12
	.uaword	.LLST9
	.byte	0x1
	.uaword	0x575
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0xa2
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x9
	.uaword	.LASF15
	.byte	0x1
	.byte	0xa3
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x9
	.uaword	.LASF16
	.byte	0x1
	.byte	0xa3
	.uaword	0x77
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x9
	.uaword	.LASF41
	.byte	0x1
	.byte	0xa3
	.uaword	0x575
	.byte	0x3
	.byte	0x91
	.sleb128 80
	.uleb128 0xd
	.asciz	"val"
	.byte	0x1
	.byte	0xa3
	.uaword	0x575
	.byte	0x3
	.byte	0x91
	.sleb128 84
	.uleb128 0x9
	.uaword	.LASF42
	.byte	0x1
	.byte	0xa4
	.uaword	0x57b
	.byte	0x3
	.byte	0x91
	.sleb128 88
	.uleb128 0xa
	.uaword	.LASF20
	.byte	0x1
	.byte	0xa6
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0xa
	.uaword	.LASF21
	.byte	0x1
	.byte	0xa7
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x10
	.uaword	.LBB2
	.uaword	.LBE2
	.uaword	0x55c
	.uleb128 0xa
	.uaword	.LASF35
	.byte	0x1
	.byte	0xb1
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.uaword	.LBB3
	.uaword	.LBE3
	.uleb128 0xa
	.uaword	.LASF28
	.byte	0x1
	.byte	0xb6
	.uaword	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.uaword	0x82
	.uleb128 0xb
	.byte	0x4
	.uaword	0x161
	.uleb128 0x12
	.byte	0x1
	.uaword	.LASF43
	.byte	0x1
	.byte	0xbb
	.byte	0x1
	.uaword	.LFB13
	.uaword	.LFE13
	.uaword	.LLST10
	.byte	0x1
	.uaword	0x5ba
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0xbb
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x13
	.byte	0x1
	.uaword	.LASF48
	.byte	0x1
	.byte	0xc0
	.uaword	0x28
	.byte	0x1
	.uleb128 0x14
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.uaword	.LASF44
	.byte	0x1
	.byte	0xc8
	.byte	0x1
	.uaword	.LFB14
	.uaword	.LFE14
	.uaword	.LLST11
	.byte	0x1
	.uaword	0x5e4
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0xc8
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.uaword	.LASF49
	.byte	0x1
	.byte	0xd4
	.byte	0x1
	.uaword	.LFB15
	.uaword	.LFE15
	.uaword	.LLST12
	.byte	0x1
	.uleb128 0x9
	.uaword	.LASF19
	.byte	0x1
	.byte	0xd4
	.uaword	0x82
	.byte	0x3
	.byte	0x91
	.sleb128 68
	.uleb128 0x16
	.uaword	.LASF50
	.byte	0x1
	.byte	0xd7
	.uaword	0x82
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
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.byte	0
	.byte	0
	.uleb128 0x16
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
.LLST6:
	.uaword	.LFB9-.Ltext0
	.uaword	.LCFI6-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI6-.Ltext0
	.uaword	.LFE9-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST7:
	.uaword	.LFB10-.Ltext0
	.uaword	.LCFI7-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI7-.Ltext0
	.uaword	.LFE10-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST8:
	.uaword	.LFB11-.Ltext0
	.uaword	.LCFI8-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI8-.Ltext0
	.uaword	.LFE11-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST9:
	.uaword	.LFB12-.Ltext0
	.uaword	.LCFI9-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI9-.Ltext0
	.uaword	.LFE12-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST10:
	.uaword	.LFB13-.Ltext0
	.uaword	.LCFI10-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI10-.Ltext0
	.uaword	.LFE13-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST11:
	.uaword	.LFB14-.Ltext0
	.uaword	.LCFI11-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI11-.Ltext0
	.uaword	.LFE14-.Ltext0
	.uahalf	0x2
	.byte	0x8e
	.sleb128 0
	.uaword	0
	.uaword	0
.LLST12:
	.uaword	.LFB15-.Ltext0
	.uaword	.LCFI12-.Ltext0
	.uahalf	0x2
	.byte	0x7e
	.sleb128 0
	.uaword	.LCFI12-.Ltext0
	.uaword	.LFE15-.Ltext0
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
.LASF36:
	.asciz	"__ajit_get_ipi_mask_register__"
.LASF31:
	.asciz	"bit_index"
.LASF48:
	.asciz	"acquire_mutex_using_swap"
.LASF35:
	.asciz	"ipi_mask"
.LASF26:
	.asciz	"imesg"
.LASF30:
	.asciz	"__ajit_enable_ipi_interrupt__"
.LASF37:
	.asciz	"__ajit_set_ipi_mask_register__"
.LASF43:
	.asciz	"__ajit_acquire_ipi_lock__"
.LASF34:
	.asciz	"__ajit_clear_ipi_interrupt__"
.LASF38:
	.asciz	"__ajit_set_ipi_value_register__"
.LASF14:
	.asciz	"source_thread_id"
.LASF13:
	.asciz	"source_core_id"
.LASF20:
	.asciz	"base_addr"
.LASF3:
	.asciz	"unsigned char"
.LASF27:
	.asciz	"active_ipi_mask"
.LASF29:
	.asciz	"current_ipi_mask"
.LASF15:
	.asciz	"dest_core_id"
.LASF5:
	.asciz	"long unsigned int"
.LASF50:
	.asciz	"addr"
.LASF47:
	.asciz	"__IpiMessage"
.LASF46:
	.asciz	"/home/ajit/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_ipi.c"
.LASF17:
	.asciz	"pointer"
.LASF28:
	.asciz	"ipi_vals"
.LASF22:
	.asciz	"ret_ptr"
.LASF25:
	.asciz	"ret_val"
.LASF40:
	.asciz	"__ajit_read_ipi_info__"
.LASF0:
	.asciz	"unsigned int"
.LASF32:
	.asciz	"curr_mask"
.LASF8:
	.asciz	"long long unsigned int"
.LASF11:
	.asciz	"uint8_t"
.LASF49:
	.asciz	"__ajit_ipi_init__"
.LASF9:
	.asciz	"sizetype"
.LASF21:
	.asciz	"dest_tid"
.LASF2:
	.asciz	"long long int"
.LASF41:
	.asciz	"mask"
.LASF33:
	.asciz	"__ajit_disable_ipi_interrupt__"
.LASF24:
	.asciz	"__ajit_set_ipi_interrupt__"
.LASF42:
	.asciz	"mesg_ptr"
.LASF45:
	.asciz	"GNU C 4.7.4"
.LASF7:
	.asciz	"short int"
.LASF44:
	.asciz	"__ajit_release_ipi_lock__"
.LASF18:
	.asciz	"IpiMessage"
.LASF12:
	.asciz	"uint32_t"
.LASF1:
	.asciz	"long int"
.LASF10:
	.asciz	"char"
.LASF39:
	.asciz	"__ajit_get_ipi_value_register__"
.LASF16:
	.asciz	"dest_thread_id"
.LASF6:
	.asciz	"signed char"
.LASF19:
	.asciz	"ipi_base_address"
.LASF4:
	.asciz	"short unsigned int"
.LASF23:
	.asciz	"__ajit_get_ipi_message_pointer__"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
