	.file	"ajit_spi_flash.c"
	.section	".text"
	.align 4
	.global ajit_spi_transfer_is_in_progress
	.type	ajit_spi_transfer_is_in_progress, #function
	.proc	016
ajit_spi_transfer_is_in_progress:
	sethi	%hi(-53248), %g1
	or	%g1, 776, %g1
	ld	[%g1], %o0
	jmp	%o7+8
	 and	%o0, 1, %o0
	.size	ajit_spi_transfer_is_in_progress, .-ajit_spi_transfer_is_in_progress
	.align 4
	.global ajit_spi_flash_send_byte
	.type	ajit_spi_flash_send_byte, #function
	.proc	020
ajit_spi_flash_send_byte:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %g1
	or	%g1, 776, %g2
	or	%g1, 768, %g1
	st	%i1, [%g1]
	and	%i0, 7, %i0
	and	%i2, 1, %i2
	sll	%i0, 3, %g3
	add	%i2, %i2, %o0
	or	%g3, 1, %g4
	mov	%g2, %i5
	or	%g4, %o0, %o1
	st	%o1, [%g2]
.L3:
	call	__ajit_sleep__, 0
	 mov	64, %o0
	ld	[%i5], %g1
	andcc	%g1, 1, %g0
	bne	.L3
	 nop
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_send_byte, .-ajit_spi_flash_send_byte
	.align 4
	.global ajit_spi_flash_receive_byte
	.type	ajit_spi_flash_receive_byte, #function
	.proc	014
ajit_spi_flash_receive_byte:
	save	%sp, -96, %sp
	sethi	%hi(-53248), %g1
	or	%g1, 776, %g2
	or	%g1, 768, %g1
	st	%g0, [%g1]
	and	%i0, 7, %i0
	and	%i1, 1, %i1
	sll	%i0, 3, %g3
	add	%i1, %i1, %o0
	or	%g3, 1, %g4
	mov	%g2, %i5
	or	%g4, %o0, %o1
	st	%o1, [%g2]
.L7:
	call	__ajit_sleep__, 0
	 mov	64, %o0
	ld	[%i5], %g1
	andcc	%g1, 1, %g0
	bne	.L7
	 sethi	%hi(-53248), %g1
	or	%g1, 768, %g1
	ldub	[%g1+3], %i0
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_receive_byte, .-ajit_spi_flash_receive_byte
	.align 4
	.global ajit_spi_flash_reset
	.type	ajit_spi_flash_reset, #function
	.proc	020
ajit_spi_flash_reset:
	mov	102, %o1
	mov	1, %o2
	or	%o7, %g0, %g1
	call	ajit_spi_flash_send_byte, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_reset, .-ajit_spi_flash_reset
	.align 4
	.global ajit_spi_flash_memory_reset
	.type	ajit_spi_flash_memory_reset, #function
	.proc	020
ajit_spi_flash_memory_reset:
	mov	153, %o1
	mov	1, %o2
	or	%o7, %g0, %g1
	call	ajit_spi_flash_send_byte, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_memory_reset, .-ajit_spi_flash_memory_reset
	.align 4
	.global ajit_spi_set_clock_frequency
	.type	ajit_spi_set_clock_frequency, #function
	.proc	020
ajit_spi_set_clock_frequency:
	and	%o0, 15, %o0
	sethi	%hi(-53248), %g1
	or	%o0, 16, %g2
	or	%g1, 780, %g1
	jmp	%o7+8
	 st	%g2, [%g1]
	.size	ajit_spi_set_clock_frequency, .-ajit_spi_set_clock_frequency
	.align 4
	.global ajit_spi_flash_is_busy
	.type	ajit_spi_flash_is_busy, #function
	.proc	016
ajit_spi_flash_is_busy:
	save	%sp, -96, %sp
	mov	0, %o2
	mov	%i0, %o0
	call	ajit_spi_flash_send_byte, 0
	 mov	5, %o1
	mov	%i0, %o0
	call	ajit_spi_flash_receive_byte, 0
	 mov	1, %o1
	and	%o0, 1, %i0
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_is_busy, .-ajit_spi_flash_is_busy
	.align 4
	.global ajit_spi_flash_generic_erase
	.type	ajit_spi_flash_generic_erase, #function
	.proc	020
ajit_spi_flash_generic_erase:
	save	%sp, -96, %sp
	mov	1, %o2
	mov	%i0, %o0
	call	ajit_spi_flash_send_byte, 0
	 mov	6, %o1
	mov	%i1, %o1
	mov	%i0, %o0
	call	ajit_spi_flash_send_byte, 0
	 mov	0, %o2
	mov	%i0, %o0
	mov	0, %o2
	srl	%i2, 16, %o1
	call	ajit_spi_flash_send_byte, 0
	 and	%o1, 0xff, %o1
	srl	%i2, 8, %g1
	mov	0, %o2
	and	%g1, 0xff, %o1
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	and	%i2, 0xff, %o1
	mov	%i0, %o0
	mov	1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	4, %i1
	call	ajit_spi_flash_send_byte, 0
	 restore %g0, 1, %o2
	.size	ajit_spi_flash_generic_erase, .-ajit_spi_flash_generic_erase
	.align 4
	.global ajit_spi_flash_subsector_erase
	.type	ajit_spi_flash_subsector_erase, #function
	.proc	020
ajit_spi_flash_subsector_erase:
	mov	%o1, %o2
	mov	32, %o1
	or	%o7, %g0, %g1
	call	ajit_spi_flash_generic_erase, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_subsector_erase, .-ajit_spi_flash_subsector_erase
	.align 4
	.global ajit_spi_flash_sector_erase
	.type	ajit_spi_flash_sector_erase, #function
	.proc	020
ajit_spi_flash_sector_erase:
	mov	%o1, %o2
	mov	216, %o1
	or	%o7, %g0, %g1
	call	ajit_spi_flash_generic_erase, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_sector_erase, .-ajit_spi_flash_sector_erase
	.align 4
	.global ajit_spi_flash_bulk_erase
	.type	ajit_spi_flash_bulk_erase, #function
	.proc	020
ajit_spi_flash_bulk_erase:
	mov	%o1, %o2
	mov	199, %o1
	or	%o7, %g0, %g1
	call	ajit_spi_flash_generic_erase, 0
	 or	%g1, %g0, %o7
	.size	ajit_spi_flash_bulk_erase, .-ajit_spi_flash_bulk_erase
	.align 4
	.global ajit_spi_flash_read
	.type	ajit_spi_flash_read, #function
	.proc	020
ajit_spi_flash_read:
	save	%sp, -96, %sp
	mov	3, %o1
	mov	%i0, %o0
	call	ajit_spi_flash_send_byte, 0
	 mov	0, %o2
	mov	%i0, %o0
	mov	0, %o2
	srl	%i1, 16, %o1
	call	ajit_spi_flash_send_byte, 0
	 and	%o1, 0xff, %o1
	srl	%i1, 8, %g1
	mov	0, %o2
	and	%g1, 0xff, %o1
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	mov	%i0, %o0
	and	%i1, 0xff, %o1
	call	ajit_spi_flash_send_byte, 0
	 mov	0, %o2
	cmp	%i3, 0
	be	.L44
	 add	%i3, -1, %i4
	subcc	%g0, %i4, %g0
	mov	%i0, %o0
	call	ajit_spi_flash_receive_byte, 0
	 subx	%g0, -1, %o1
	stb	%o0, [%i2]
	mov	1, %i5
	cmp	%i5, %i3
	be	.L44
	 and	%i4, 3, %g1
	cmp	%g1, 0
	be	.L21
	 cmp	%g1, 1
	be	.L35
	 cmp	%g1, 2
	be	.L42
	 xor	%i5, %i4, %g1
	xor	%i4, 1, %g1
	subcc	%g0, %g1, %g0
	mov	%i0, %o0
	subx	%g0, -1, %o1
	call	ajit_spi_flash_receive_byte, 0
	 mov	2, %i5
	stb	%o0, [%i2+1]
	xor	%i5, %i4, %g1
.L42:
	subcc	%g0, %g1, %g0
	add	%i2, %i5, %i1
	mov	%i0, %o0
	subx	%g0, -1, %o1
	call	ajit_spi_flash_receive_byte, 0
	 add	%i5, 1, %i5
	stb	%o0, [%i1]
.L35:
	xor	%i5, %i4, %g1
	subcc	%g0, %g1, %g0
	add	%i2, %i5, %l0
	subx	%g0, -1, %o1
	call	ajit_spi_flash_receive_byte, 0
	 mov	%i0, %o0
	add	%i5, 1, %i5
	cmp	%i5, %i3
	be	.L44
	 stb	%o0, [%l0]
.L21:
	xor	%i5, %i4, %g1
	subcc	%g0, %g1, %g0
	mov	%i0, %o0
	call	ajit_spi_flash_receive_byte, 0
	 subx	%g0, -1, %o1
	add	%i5, 1, %i1
	xor	%i1, %i4, %g1
	subcc	%g0, %g1, %g0
	stb	%o0, [%i2+%i5]
	subx	%g0, -1, %o1
	call	ajit_spi_flash_receive_byte, 0
	 mov	%i0, %o0
	add	%i5, 2, %l0
	xor	%l0, %i4, %g1
	subcc	%g0, %g1, %g0
	stb	%o0, [%i2+%i1]
	subx	%g0, -1, %o1
	call	ajit_spi_flash_receive_byte, 0
	 mov	%i0, %o0
	add	%i5, 3, %i1
	xor	%i1, %i4, %g1
	subcc	%g0, %g1, %g0
	stb	%o0, [%i2+%l0]
	subx	%g0, -1, %o1
	call	ajit_spi_flash_receive_byte, 0
	 mov	%i0, %o0
	add	%i5, 4, %i5
	cmp	%i5, %i3
	bne	.L21
	 stb	%o0, [%i2+%i1]
.L44:
	jmp	%i7+8
	 restore
	.size	ajit_spi_flash_read, .-ajit_spi_flash_read
	.align 4
	.global ajit_spi_flash_write
	.type	ajit_spi_flash_write, #function
	.proc	020
ajit_spi_flash_write:
	save	%sp, -96, %sp
	mov	6, %o1
	mov	1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	mov	%i0, %o0
	mov	2, %o1
	call	ajit_spi_flash_send_byte, 0
	 mov	0, %o2
	mov	%i0, %o0
	mov	0, %o2
	srl	%i1, 16, %o1
	call	ajit_spi_flash_send_byte, 0
	 and	%o1, 0xff, %o1
	srl	%i1, 8, %g1
	mov	0, %o2
	and	%g1, 0xff, %o1
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	mov	%i0, %o0
	and	%i1, 0xff, %o1
	call	ajit_spi_flash_send_byte, 0
	 mov	0, %o2
	cmp	%i3, 0
	be	.L48
	 add	%i3, -1, %i4
	subcc	%g0, %i4, %g0
	mov	%i0, %o0
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 ldub	[%i2], %o1
	mov	1, %i5
	cmp	%i5, %i3
	be	.L48
	 and	%i4, 3, %g1
	cmp	%g1, 0
	be	.L49
	 cmp	%g1, 1
	be	.L63
	 cmp	%g1, 2
	be	.L68
	 xor	%i5, %i4, %g1
	xor	%i4, 1, %g1
	subcc	%g0, %g1, %g0
	ldub	[%i2+%i5], %o1
	mov	%i0, %o0
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	2, %i5
	xor	%i5, %i4, %g1
.L68:
	subcc	%g0, %g1, %g0
	ldub	[%i2+%i5], %o1
	mov	%i0, %o0
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 add	%i5, 1, %i5
.L63:
	xor	%i5, %i4, %g1
	subcc	%g0, %g1, %g0
	ldub	[%i2+%i5], %o1
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	add	%i5, 1, %i5
	cmp	%i5, %i3
	be	.L69
	 mov	4, %i1
.L49:
	xor	%i5, %i4, %g1
.L70:
	subcc	%g0, %g1, %g0
	ldub	[%i2+%i5], %o1
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	add	%i5, 1, %g1
	xor	%g1, %i4, %g2
	subcc	%g0, %g2, %g0
	ldub	[%i2+%g1], %o1
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	add	%i5, 2, %g1
	xor	%g1, %i4, %g3
	subcc	%g0, %g3, %g0
	ldub	[%i2+%g1], %o1
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 mov	%i0, %o0
	add	%i5, 3, %g1
	xor	%g1, %i4, %g4
	subcc	%g0, %g4, %g0
	mov	%i0, %o0
	subx	%g0, -1, %o2
	call	ajit_spi_flash_send_byte, 0
	 ldub	[%i2+%g1], %o1
	add	%i5, 4, %i5
	cmp	%i5, %i3
	bne	.L70
	 xor	%i5, %i4, %g1
.L48:
	mov	4, %i1
.L69:
	call	ajit_spi_flash_send_byte, 0
	 restore %g0, 1, %o2
	.size	ajit_spi_flash_write, .-ajit_spi_flash_write
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
