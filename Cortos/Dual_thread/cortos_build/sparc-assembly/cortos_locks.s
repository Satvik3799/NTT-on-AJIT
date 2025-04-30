	.file	"cortos_locks.c"
	.section	".text"
	.align 4
	.global cortos_init_locks
	.type	cortos_init_locks, #function
	.proc	020
cortos_init_locks:
	sethi	%hi(allocatedLocksNc), %g1
	mov	1, %g2
	sethi	%hi(1073831936), %g3
	stb	%g2, [%g1+%lo(allocatedLocksNc)]
	sethi	%hi(cortos_reservedLockAddr), %g1
	jmp	%o7+8
	 st	%g3, [%g1+%lo(cortos_reservedLockAddr)]
	.size	cortos_init_locks, .-cortos_init_locks
	.align 4
	.global cortos_reserveLock
	.type	cortos_reserveLock, #function
	.proc	0114
cortos_reserveLock:
	save	%sp, -96, %sp
	cmp	%i0, 0
	be	.L29
	 sethi	%hi(lockStartAddr), %g1
	sethi	%hi(lockStartAddrNc), %g1
	sethi	%hi(allocatedLocksNc), %g2
	ld	[%g1+%lo(lockStartAddrNc)], %i0
	or	%g2, %lo(allocatedLocksNc), %i5
.L8:
	sethi	%hi(cortos_reservedLockAddr), %i4
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i4+%lo(cortos_reservedLockAddr)], %o0
	mov	%i5, %g1
	mov	0, %i5
.L7:
	ldsb	[%g1], %g3
	cmp	%g3, 0
	be	.L25
	 add	%i5, 1, %o0
	add	%g1, 1, %g1
	ldsb	[%g1], %g4
	mov	%o0, %i5
	cmp	%g4, 0
	be	.L25
	 mov	%g1, %o1
	add	%g1, 1, %g1
	ldsb	[%g1], %o2
	cmp	%o2, 0
	be	.L25
	 add	%o0, 1, %i5
	ldsb	[%o1+2], %o3
	add	%o1, 2, %g1
	cmp	%o3, 0
	be	.L25
	 add	%o0, 2, %i5
	ldsb	[%o1+3], %o4
	add	%o1, 3, %g1
	cmp	%o4, 0
	be	.L25
	 add	%o0, 3, %i5
	ldsb	[%o1+4], %o5
	add	%o1, 4, %g1
	cmp	%o5, 0
	be	.L25
	 add	%o0, 4, %i5
	ldsb	[%o1+5], %o7
	add	%o1, 5, %g1
	cmp	%o7, 0
	be	.L25
	 add	%o0, 5, %i5
	ldsb	[%o1+6], %g2
	add	%o1, 6, %g1
	cmp	%g2, 0
	be	.L25
	 add	%o0, 6, %i5
	add	%o0, 7, %i5
	cmp	%i5, 256
	bne	.L7
	 add	%o1, 7, %g1
	mov	256, %i5
	ld	[%i4+%lo(cortos_reservedLockAddr)], %o0
	call	cortos_lock_release, 0
	 add	%i0, %i5, %i0
	jmp	%i7+8
	 restore
.L25:
	mov	1, %g3
	ld	[%i4+%lo(cortos_reservedLockAddr)], %o0
	stb	%g3, [%g1]
	call	cortos_lock_release, 0
	 add	%i0, %i5, %i0
	jmp	%i7+8
	 restore
.L29:
	sethi	%hi(allocatedLocks), %i5
	ld	[%g1+%lo(lockStartAddr)], %i0
	b	.L8
	 or	%i5, %lo(allocatedLocks), %i5
	.size	cortos_reserveLock, .-cortos_reserveLock
	.align 4
	.global cortos_freeLock
	.type	cortos_freeLock, #function
	.proc	020
cortos_freeLock:
	save	%sp, -96, %sp
	sethi	%hi(lockStartAddr), %i5
	ld	[%i5+%lo(lockStartAddr)], %g1
	cmp	%g1, %i0
	bgu	.L31
	 add	%g1, 256, %g1
	cmp	%i0, %g1
	blu	.L32
	 sethi	%hi(cortos_reservedLockAddr), %i4
.L31:
	sethi	%hi(cortos_reservedLockAddr), %i4
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i4+%lo(cortos_reservedLockAddr)], %o0
	sethi	%hi(lockStartAddrNc), %g1
	sethi	%hi(allocatedLocksNc), %g2
	ld	[%g1+%lo(lockStartAddrNc)], %g1
	or	%g2, %lo(allocatedLocksNc), %g3
	sub	%i0, %g1, %g1
	ld	[%i4+%lo(cortos_reservedLockAddr)], %i0
	stb	%g0, [%g3+%g1]
	call	cortos_lock_release, 0
	 restore
.L32:
	call	cortos_lock_acquire_buzy, 0
	 ld	[%i4+%lo(cortos_reservedLockAddr)], %o0
	ld	[%i5+%lo(lockStartAddr)], %g1
	sethi	%hi(allocatedLocks), %g4
	sub	%i0, %g1, %g1
	or	%g4, %lo(allocatedLocks), %o0
	ld	[%i4+%lo(cortos_reservedLockAddr)], %i0
	stb	%g0, [%o0+%g1]
	call	cortos_lock_release, 0
	 restore
	.size	cortos_freeLock, .-cortos_freeLock
	.common	cortos_reservedLockAddr,4,4
	.common	allocatedLocksNc,256,8
	.common	allocatedLocks,256,8
	.global lockStartAddrNc
	.section	".data"
	.align 4
	.type	lockStartAddrNc, #object
	.size	lockStartAddrNc, 4
lockStartAddrNc:
	.long	1073831936
	.global lockStartAddr
	.align 4
	.type	lockStartAddr, #object
	.size	lockStartAddr, 4
lockStartAddr:
	.long	1073827840
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
