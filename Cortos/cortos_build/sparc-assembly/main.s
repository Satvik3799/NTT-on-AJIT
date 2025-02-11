	.file	"main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.asciz	"[INFO] : NTT_THREAD entered\n"
	.align 8
.LC3:
	.asciz	"[INFO] : NTT_THREAD exited\n"
	.section	".text"
	.align 4
	.global ntt_thread
	.type	ntt_thread, #function
	.proc	020
ntt_thread:
	save	%sp, -96, %sp
	sethi	%hi(.LC2), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC2), %o0
	ld	[%i0], %o0
	ld	[%i0+4], %o1
	call	ct_ntt, 0
	 sethi	%hi(.LC3), %i0
	call	cortos_printf, 0
	 restore %i0, %lo(.LC3), %o0
	.size	ntt_thread, .-ntt_thread
	.align 4
	.global set_NTT_Args
	.type	set_NTT_Args, #function
	.proc	020
set_NTT_Args:
	st	%o1, [%o0]
	jmp	%o7+8
	 st	%o2, [%o0+4]
	.size	set_NTT_Args, .-set_NTT_Args
	.section	.rodata.str1.8
	.align 8
.LC4:
	.asciz	"[INFO] : NTT_TOP Entered\n"
	.align 8
.LC5:
	.asciz	"[INFO] : NTT_TOP waiting for response\n"
	.align 8
.LC6:
	.asciz	"[INFO] : NTT_TOP Exiting\n"
	.section	".text"
	.align 4
	.global ntt_top
	.type	ntt_top, #function
	.proc	020
ntt_top:
	save	%sp, -1136, %sp
	sethi	%hi(tc), %g1
	or	%g1, %lo(tc), %g1
	sethi	%hi(.LC4), %o0
	st	%g1, [%fp-1040]
	call	cortos_printf, 0
	 or	%o0, %lo(.LC4), %o0
	add	%fp, -512, %i5
	mov	0, %g1
	add	%fp, -1024, %g4
.L4:
	ld	[%i0], %g3
	ld	[%i0+4], %g2
	st	%g3, [%g4+%g1]
	st	%g2, [%i5+%g1]
	add	%g1, 4, %g1
	cmp	%g1, 512
	bne	.L4
	 add	%i0, 8, %i0
	st	%g4, [%fp-1032]
	sethi	%hi(ntt_thread), %i4
	st	%i1, [%fp-1028]
	or	%i4, %lo(ntt_thread), %i4
.L5:
	ld	[%fp-1040], %o0
	mov	%i4, %o1
	call	scheduleChannelJob, 0
	 add	%fp, -1032, %o2
	cmp	%o0, 0
	bne	.L5
	 mov	%i5, %o0
	mov	%i1, %o1
	call	ct_ntt, 0
	 sethi	%hi(.LC5), %i5
	or	%i5, %lo(.LC5), %i5
	b	.L6
	 st	%g0, [%fp-1036]
.L7:
	call	cortos_printf, 0
	 mov	%i5, %o0
.L6:
	add	%fp, -1036, %o1
	ld	[%fp-1040], %o0
	call	getChannelResponse, 0
	 nop
	cmp	%o0, 0
	bne	.L7
	 sethi	%hi(.LC6), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC6), %o0
	jmp	%i7+8
	 restore
	.size	ntt_top, .-ntt_top
	.section	.rodata.str1.8
	.align 8
.LC7:
	.asciz	"[INFO] : Init channel.\n"
	.align 8
.LC8:
	.asciz	"[INFO] : initChannel %d: status=%d.\n"
	.section	".text"
	.align 4
	.global setup
	.type	setup, #function
	.proc	020
setup:
	save	%sp, -96, %sp
	mov	0, %o2
	mov	1, %o0
	call	__ajit_serial_configure_via_vmap__, 0
	 mov	0, %o1
	sethi	%hi(80000000), %o1
	sethi	%hi(114688), %o0
	call	__ajit_serial_set_baudrate_via_vmap__, 0
	 or	%o0, 512, %o0
	call	__ajit_serial_set_uart_reset_via_vmap__, 0
	 mov	0, %o0
	sethi	%hi(.LC7), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC7), %o0
	sethi	%hi(tc), %i5
	mov	1, %o1
	or	%i5, %lo(tc), %o0
	call	initChannel, 0
	 sethi	%hi(.LC8), %i0
	or	%i0, %lo(.LC8), %i0
	ld	[%i5+%lo(tc)], %i1
	or	%i5, %lo(tc), %i5
	ld	[%i5+20], %i2
	call	cortos_printf, 0
	 restore
	.size	setup, .-setup
	.section	.rodata.str1.8
	.align 8
.LC9:
	.asciz	"[INFO] : --------------------------------------------------------------------------------\n"
	.align 8
.LC10:
	.asciz	"[INFO] : ---------------------------Logs Start Here--------------------------------------\n"
	.align 8
.LC11:
	.asciz	"[INFO] : Hello world from core:thread %d:%d!\n\n"
	.align 8
.LC12:
	.asciz	"[-- RESULT --] : Single thread Times: %f\n"
	.global __floatundidf
	.align 8
.LC13:
	.asciz	"[-- RESULT --] : Dual thread Times: %f\n"
	.section	".rodata"
	.align 4
.LC0:
	.long	1
	.long	1729
	.long	2580
	.long	3289
	.long	2642
	.long	630
	.long	1897
	.long	848
	.long	1062
	.long	1919
	.long	193
	.long	797
	.long	2786
	.long	3260
	.long	569
	.long	1746
	.long	296
	.long	2447
	.long	1339
	.long	1476
	.long	3046
	.long	56
	.long	2240
	.long	1333
	.long	1426
	.long	2094
	.long	535
	.long	2882
	.long	2393
	.long	2879
	.long	1974
	.long	821
	.long	289
	.long	331
	.long	3253
	.long	1756
	.long	1197
	.long	2304
	.long	2277
	.long	2055
	.long	650
	.long	1977
	.long	2513
	.long	632
	.long	2865
	.long	33
	.long	1320
	.long	1915
	.long	2319
	.long	1435
	.long	807
	.long	452
	.long	1438
	.long	2868
	.long	1534
	.long	2402
	.long	2647
	.long	2617
	.long	1481
	.long	648
	.long	2474
	.long	3110
	.long	1227
	.long	910
	.long	17
	.long	2761
	.long	583
	.long	2649
	.long	1637
	.long	723
	.long	2288
	.long	1100
	.long	1409
	.long	2662
	.long	3281
	.long	233
	.long	756
	.long	2156
	.long	3015
	.long	3050
	.long	1703
	.long	1651
	.long	2789
	.long	1789
	.long	1847
	.long	952
	.long	1461
	.long	2687
	.long	939
	.long	2308
	.long	2437
	.long	2388
	.long	733
	.long	2337
	.long	268
	.long	641
	.long	1584
	.long	2298
	.long	2037
	.long	3220
	.long	375
	.long	2549
	.long	2090
	.long	1645
	.long	1063
	.long	319
	.long	2773
	.long	757
	.long	2099
	.long	561
	.long	2466
	.long	2594
	.long	2804
	.long	1092
	.long	403
	.long	1026
	.long	1143
	.long	2150
	.long	2775
	.long	886
	.long	1722
	.long	1212
	.long	1874
	.long	1029
	.long	2110
	.long	2935
	.long	885
	.long	2154
	.align 4
.LC1:
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	3327
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	2
	.long	1
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	3326
	.long	3328
	.long	1
	.long	3327
	.long	2
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	2
	.long	2
	.long	3327
	.long	1
	.long	2
	.long	0
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	0
	.long	1
	.long	3328
	.long	0
	.long	0
	.long	2
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	3327
	.long	3327
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	3327
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	0
	.long	2
	.long	0
	.long	3327
	.long	1
	.long	0
	.long	1
	.long	1
	.long	0
	.long	0
	.long	3327
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	3328
	.long	3327
	.long	1
	.long	1
	.long	3328
	.long	0
	.long	1
	.long	1
	.long	3328
	.long	0
	.long	3328
	.long	3326
	.long	0
	.long	0
	.long	3328
	.long	0
	.long	2
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	2
	.long	3328
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	0
	.long	0
	.long	1
	.long	2
	.long	3328
	.long	3327
	.long	1
	.long	0
	.long	2
	.long	2
	.long	2
	.long	3327
	.long	2
	.long	0
	.long	0
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	1
	.long	0
	.long	0
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	3
	.long	3328
	.long	1
	.long	3328
	.long	2
	.long	0
	.long	0
	.long	0
	.long	2
	.long	0
	.long	1
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	0
	.long	3328
	.long	3328
	.long	1
	.long	3328
	.long	3327
	.long	1
	.long	0
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	1
	.long	3328
	.long	1
	.long	0
	.long	3327
	.long	3328
	.long	1
	.long	3
	.long	3327
	.long	0
	.long	1
	.long	3327
	.long	3
	.long	0
	.long	1
	.long	1
	.long	1
	.long	1
	.long	3327
	.long	3328
	.long	3328
	.long	3328
	.long	1
	.long	3326
	.long	0
	.long	1
	.long	1
	.long	1
	.long	0
	.long	0
	.long	1
	.long	0
	.long	0
	.long	2
	.long	0
	.long	3328
	.long	3328
	.long	3328
	.long	1
	.long	3
	.long	3328
	.long	0
	.long	3328
	.long	2
	.long	1
	.long	3327
	.long	0
	.long	1
	.long	1
	.long	0
	.long	3327
	.long	3328
	.long	1
	.long	1
	.long	0
	.long	3328
	.long	3328
	.long	3328
	.long	0
	.long	3328
	.long	0
	.long	0
	.long	3328
	.long	0
	.section	".text"
	.align 4
	.global main_00
	.type	main_00, #function
	.proc	04
main_00:
	save	%sp, -1648, %sp
	sethi	%hi(.LC9), %i5
	call	cortos_printf, 0
	 or	%i5, %lo(.LC9), %o0
	sethi	%hi(.LC10), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC10), %o0
	call	cortos_printf, 0
	 or	%i5, %lo(.LC9), %o0
	add	%fp, -1538, %o0
	call	ajit_get_core_and_thread_id, 0
	 add	%fp, -1537, %o1
	mov	1, %o0
	mov	0, %o1
	call	__ajit_serial_configure_via_vmap__, 0
	 mov	0, %o2
	mov	512, %o2
	add	%fp, -1536, %o0
	sethi	%hi(.LC0), %o1
	call	memcpy, 0
	 or	%o1, %lo(.LC0), %o1
	mov	1024, %o2
	add	%fp, -1024, %o0
	sethi	%hi(.LC1), %o1
	call	memcpy, 0
	 or	%o1, %lo(.LC1), %o1
	ldub	[%fp-1537], %o2
	ldub	[%fp-1538], %o1
	sethi	%hi(.LC11), %o0
	call	cortos_printf, 0
	 or	%o0, %lo(.LC11), %o0
	call	__ajit_get_clock_time, 0
	 mov	1, %i0
	mov	%o0, %i4
	mov	%o1, %i5
	add	%fp, -1024, %o0
	call	ct_ntt, 0
	 add	%fp, -1536, %o1
	call	__ajit_get_clock_time, 0
	 nop
	subcc	%o1, %i5, %o1
	call	__floatundidf, 0
	 subx	%o0, %i4, %o0
	std	%f0, [%fp-1552]
	ldd	[%fp-1552], %g2
	sethi	%hi(.LC12), %o0
	mov	%g3, %o2
	mov	%g2, %o1
	call	cortos_printf, 0
	 or	%o0, %lo(.LC12), %o0
	call	__ajit_get_clock_time, 0
	 nop
	mov	%o0, %i4
	mov	%o1, %i5
	add	%fp, -1024, %o0
	call	ntt_top, 0
	 add	%fp, -1536, %o1
	call	__ajit_get_clock_time, 0
	 nop
	subcc	%o1, %i5, %o1
	call	__floatundidf, 0
	 subx	%o0, %i4, %o0
	std	%f0, [%fp-1552]
	ldd	[%fp-1552], %g2
	sethi	%hi(.LC13), %o0
	mov	%g2, %o1
	mov	%g3, %o2
	call	cortos_printf, 0
	 or	%o0, %lo(.LC13), %o0
	mov	0, %o1
	mov	0, %o2
	sethi	%hi(tc), %o0
	call	scheduleChannelJob, 0
	 or	%o0, %lo(tc), %o0
	jmp	%i7+8
	 restore
	.size	main_00, .-main_00
	.section	.rodata.str1.8
	.align 8
.LC14:
	.asciz	"[INFO] : Entered main_01\n"
	.section	".text"
	.align 4
	.global main_01
	.type	main_01, #function
	.proc	04
main_01:
	save	%sp, -104, %sp
	sethi	%hi(.LC14), %o0
	sethi	%hi(tc), %i5
	or	%o0, %lo(.LC14), %o0
	call	cortos_printf, 0
	 or	%i5, %lo(tc), %i5
	mov	%i5, %i4
	add	%fp, -8, %o1
.L20:
	add	%fp, -4, %o2
	call	getChannelJob, 0
	 mov	%i5, %o0
	cmp	%o0, 0
	bne	.L20
	 add	%fp, -8, %o1
	ld	[%fp-8], %g1
	cmp	%g1, 0
	be	.L15
	 nop
	call	%g1, 0
	 ld	[%fp-4], %o0
	mov	%i4, %o0
	call	setChannelResponse, 0
	 ld	[%fp-4], %o1
	b	.L20
	 add	%fp, -8, %o1
.L15:
	jmp	%i7+8
	 restore %g0, 1, %o0
	.size	main_01, .-main_01
	.common	scratchg,512,4
	.common	v1g,512,4
	.common	vg,512,4
	.common	tc,24,4
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
