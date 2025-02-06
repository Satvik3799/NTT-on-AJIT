	.file	"ajit_ipi.c"
	.section	".text"
	.align 4
	.global __ajit_get_ipi_message_pointer__
	.type	__ajit_get_ipi_message_pointer__, #function
	.proc	0110
__ajit_get_ipi_message_pointer__:
	add	%o1, %o1, %o1
	add	%o0, 8, %o0
	add	%o1, %o2, %o2
	sll	%o2, 3, %o1
	jmp	%o7+8
	 add	%o0, %o1, %o0
	.size	__ajit_get_ipi_message_pointer__, .-__ajit_get_ipi_message_pointer__
	.align 4
	.global __ajit_set_ipi_interrupt__
	.type	__ajit_set_ipi_interrupt__, #function
	.proc	04
__ajit_set_ipi_interrupt__:
	save	%sp, -96, %sp
	ld	[%i0+4], %o7
	ld	[%i0], %o5
	mov	%i0, %g2
	add	%i3, %i3, %g3
	add	%i0, 8, %i0
	add	%g3, %i4, %g3
	sll	%g3, 3, %g4
	add	%i0, %g4, %g1
	stb	%i1, [%i0+%g4]
	stb	%i2, [%g1+1]
	stb	%i3, [%g1+2]
	stb	%i4, [%g1+3]
	st	%i5, [%g1+4]
	and	%o7, %o5, %o5
	mov	1, %g1
	sll	%g1, %g3, %g1
	andcc	%o5, %g1, %g0
	bne	.L6
	 mov	1, %i0
	andn	%o7, %g1, %o7
	mov	0, %i0
	or	%o7, %g1, %g1
	st	%g1, [%g2+4]
.L6:
	jmp	%i7+8
	 restore
	.size	__ajit_set_ipi_interrupt__, .-__ajit_set_ipi_interrupt__
	.align 4
	.global __ajit_enable_ipi_interrupt__
	.type	__ajit_enable_ipi_interrupt__, #function
	.proc	04
__ajit_enable_ipi_interrupt__:
	ld	[%o0], %g2
	mov	%o0, %g1
	add	%o1, %o1, %o1
	mov	1, %g3
	add	%o1, %o2, %o2
	sll	%g3, %o2, %o2
	andcc	%o2, %g2, %g0
	bne	.L10
	 mov	1, %o0
	or	%o2, %g2, %g2
	mov	0, %o0
	st	%g2, [%g1]
.L10:
	jmp	%o7+8
	 nop
	.size	__ajit_enable_ipi_interrupt__, .-__ajit_enable_ipi_interrupt__
	.align 4
	.global __ajit_disable_ipi_interrupt__
	.type	__ajit_disable_ipi_interrupt__, #function
	.proc	04
__ajit_disable_ipi_interrupt__:
	ld	[%o0], %g2
	mov	%o0, %g1
	add	%o1, %o1, %o1
	mov	1, %g3
	add	%o1, %o2, %o2
	sll	%g3, %o2, %o2
	andcc	%o2, %g2, %g0
	be	.L15
	 mov	1, %o0
	andn	%g2, %o2, %g2
	mov	0, %o0
	st	%g2, [%g1]
.L15:
	jmp	%o7+8
	 nop
	.size	__ajit_disable_ipi_interrupt__, .-__ajit_disable_ipi_interrupt__
	.align 4
	.global __ajit_clear_ipi_interrupt__
	.type	__ajit_clear_ipi_interrupt__, #function
	.proc	04
__ajit_clear_ipi_interrupt__:
	ld	[%o0+4], %g2
	mov	%o0, %g1
	add	%o1, %o1, %o1
	mov	1, %g3
	add	%o1, %o2, %o2
	mov	0, %o0
	sll	%g3, %o2, %o2
	andn	%g2, %o2, %g2
	jmp	%o7+8
	 st	%g2, [%g1+4]
	.size	__ajit_clear_ipi_interrupt__, .-__ajit_clear_ipi_interrupt__
	.align 4
	.global __ajit_set_ipi_mask_register__
	.type	__ajit_set_ipi_mask_register__, #function
	.proc	020
__ajit_set_ipi_mask_register__:
	jmp	%o7+8
	 st	%o1, [%o0]
	.size	__ajit_set_ipi_mask_register__, .-__ajit_set_ipi_mask_register__
	.align 4
	.global __ajit_get_ipi_mask_register__
	.type	__ajit_get_ipi_mask_register__, #function
	.proc	016
__ajit_get_ipi_mask_register__:
	jmp	%o7+8
	 ld	[%o0], %o0
	.size	__ajit_get_ipi_mask_register__, .-__ajit_get_ipi_mask_register__
	.align 4
	.global __ajit_set_ipi_value_register__
	.type	__ajit_set_ipi_value_register__, #function
	.proc	020
__ajit_set_ipi_value_register__:
	jmp	%o7+8
	 st	%o1, [%o0+4]
	.size	__ajit_set_ipi_value_register__, .-__ajit_set_ipi_value_register__
	.align 4
	.global __ajit_get_ipi_value_register__
	.type	__ajit_get_ipi_value_register__, #function
	.proc	016
__ajit_get_ipi_value_register__:
	jmp	%o7+8
	 ld	[%g0+4], %o0
	.size	__ajit_get_ipi_value_register__, .-__ajit_get_ipi_value_register__
	.align 4
	.global __ajit_read_ipi_info__
	.type	__ajit_read_ipi_info__, #function
	.proc	020
__ajit_read_ipi_info__:
	add	%o1, %o1, %o1
	cmp	%o5, 0
	be	.L22
	 add	%o1, %o2, %o2
	add	%o0, 8, %g2
	sll	%o2, 3, %g1
	add	%g2, %g1, %g1
	st	%g1, [%o5]
.L22:
	cmp	%o3, 0
	be	.L34
	 cmp	%o4, 0
	ld	[%o0], %g1
	srl	%g1, %o2, %g1
	and	%g1, 1, %g1
	st	%g1, [%o3]
.L34:
	be	.L35
	 nop
	ld	[%o0+4], %g1
	srl	%g1, %o2, %o2
	and	%o2, 1, %o2
	st	%o2, [%o4]
.L35:
	jmp	%o7+8
	 nop
	.size	__ajit_read_ipi_info__, .-__ajit_read_ipi_info__
	.align 4
	.global __ajit_acquire_ipi_lock__
	.type	__ajit_acquire_ipi_lock__, #function
	.proc	020
__ajit_acquire_ipi_lock__:
	add	%o0, 72, %o0
	or	%o7, %g0, %g1
	call	acquire_mutex_using_swap, 0
	 or	%g1, %g0, %o7
	.size	__ajit_acquire_ipi_lock__, .-__ajit_acquire_ipi_lock__
	.align 4
	.global __ajit_release_ipi_lock__
	.type	__ajit_release_ipi_lock__, #function
	.proc	020
__ajit_release_ipi_lock__:
	jmp	%o7+8
	 st	%g0, [%o0+72]
	.size	__ajit_release_ipi_lock__, .-__ajit_release_ipi_lock__
	.align 4
	.global __ajit_ipi_init__
	.type	__ajit_ipi_init__, #function
	.proc	020
__ajit_ipi_init__:
	st	%g0, [%o0]
	st	%g0, [%o0+4]
	jmp	%o7+8
	 st	%g0, [%o0+72]
	.size	__ajit_ipi_init__, .-__ajit_ipi_init__
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
