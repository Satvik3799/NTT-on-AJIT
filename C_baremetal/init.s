.section .text.ajitstart
.global _start;
_start:
	! Enable traps and set the current window to 0.
	set 0x10E7, %l0
	wr %l0, %psr

	! Read core and thread IDs into %l1 (using ASR29).
	rd %asr29, %l1

	! Check if the current thread is thread 0 (ID: 0x50520000)
	set 0x50520000, %l2       ! Set the value representing thread 0 in %l2
	subcc %l1, %l2, %g0       ! Compare %l1 (ASR29 value) with thread 0 ID

	bnz NOT_THREAD_0          ! If not thread 0, branch to NOT_THREAD_0
	nop                       

	! Thread 0: Set stack and frame pointers for thread 0
	set 0x40008000, %fp       ! Set frame pointer at high memory for thread 0
	sub %fp, 64, %sp          ! Set stack pointer for thread 0
	ba CONTINUE               ! Continue to common code
	nop

NOT_THREAD_0:
	! Code for all other threads
	set 0x40009000, %fp       ! Set a different frame pointer for other threads
	sub %fp, 128, %sp         ! Set a different stack pointer for other threads

CONTINUE:
	! Common code for all threads

	set 0x1, %l0              ! Window 0 is marked invalid.
	wr %l0, 0x0, %wim

	set trap_table_base, %l0  ! Set trap table base address
	wr %l0, 0x0, %tbr

	call main                 ! Call main function
	nop

	ta 0                      ! Trap to 0 to halt
