	.file	"ajit_mt_sw_traps.c"
	.section	".text"
	.align 4
	.global ajit_initialize_sw_trap_handlers_to_null
	.type	ajit_initialize_sw_trap_handlers_to_null, #function
	.proc	020
ajit_initialize_sw_trap_handlers_to_null:
	sethi	%hi(ajit_global_sw_trap_handlers), %g2
	or	%g2, %lo(ajit_global_sw_trap_handlers), %g1
	st	%g0, [%g2+%lo(ajit_global_sw_trap_handlers)]
	st	%g0, [%g1+4]
	st	%g0, [%g1+8]
	st	%g0, [%g1+12]
	st	%g0, [%g1+16]
	st	%g0, [%g1+20]
	st	%g0, [%g1+24]
	st	%g0, [%g1+28]
	st	%g0, [%g1+32]
	st	%g0, [%g1+36]
	st	%g0, [%g1+40]
	st	%g0, [%g1+44]
	st	%g0, [%g1+48]
	st	%g0, [%g1+52]
	st	%g0, [%g1+56]
	st	%g0, [%g1+60]
	jmp	%o7+8
	 st	%g0, [%g1+64]
	.size	ajit_initialize_sw_trap_handlers_to_null, .-ajit_initialize_sw_trap_handlers_to_null
	.align 4
	.global ajit_set_sw_trap_handler
	.type	ajit_set_sw_trap_handler, #function
	.proc	020
ajit_set_sw_trap_handler:
	cmp	%o0, 16
	bgu	.L5
	 sll	%o0, 2, %o0
	sethi	%hi(ajit_global_sw_trap_handlers), %g1
	or	%g1, %lo(ajit_global_sw_trap_handlers), %g1
	st	%o1, [%g1+%o0]
.L5:
	jmp	%o7+8
	 nop
	.size	ajit_set_sw_trap_handler, .-ajit_set_sw_trap_handler
	.align 4
	.global ajit_generic_sw_trap_handler
	.type	ajit_generic_sw_trap_handler, #function
	.proc	020
ajit_generic_sw_trap_handler:
	save	%sp, -96, %sp
	srl	%i0, 4, %i0
	and	%i0, 255, %g1
	add	%g1, -128, %g1
	cmp	%g1, 16
	bgu	.L7
	 sll	%g1, 2, %g1
	sethi	%hi(ajit_global_sw_trap_handlers), %g2
	or	%g2, %lo(ajit_global_sw_trap_handlers), %g3
	ld	[%g3+%g1], %g1
	cmp	%g1, 0
	be	.L7
	 mov	%i1, %o0
	mov	%i2, %o1
	call	%g1, 0
	 mov	%i3, %o2
	jmp	%i7+8
	 restore
.L7:
#APP
! 45 "/home/ajit/ajit-toolchain/AjitPublicResources/tools/ajit_access_routines_mt/src/ajit_mt_sw_traps.c" 1
	ta 0;
! 0 "" 2
#NO_APP
	jmp	%i7+8
	 restore
	.size	ajit_generic_sw_trap_handler, .-ajit_generic_sw_trap_handler
	.common	ajit_global_sw_trap_handlers,68,4
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
