	.file	"cortos_traps_init.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global cortos_init_hw_traps
	.type	cortos_init_hw_traps, #function
	.proc	020
cortos_init_hw_traps:
.LFB0:
	.file 1 "cortos_src/cortos_traps_init.c"
	.loc 1 4 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 5 0
	call	ajit_initialize_interrupt_handlers_to_null, 0
	 nop
	.loc 1 10 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	cortos_init_hw_traps, .-cortos_init_hw_traps
	.align 4
	.global cortos_init_sw_traps
	.type	cortos_init_sw_traps, #function
	.proc	020
cortos_init_sw_traps:
.LFB1:
	.loc 1 12 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 13 0
	call	ajit_initialize_sw_trap_handlers_to_null, 0
	 nop
	.loc 1 15 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	cortos_init_sw_traps, .-cortos_init_sw_traps
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x77
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF2
	.byte	0x1
	.uaword	.LASF3
	.uaword	.LASF4
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.uaword	.LASF5
	.byte	0x1
	.byte	0x4
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uaword	0x4e
	.uleb128 0x3
	.byte	0x1
	.uaword	.LASF0
	.byte	0x1
	.byte	0x5
	.uaword	0x4e
	.byte	0x1
	.uleb128 0x4
	.byte	0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x6
	.byte	0x1
	.uaword	.LASF6
	.byte	0x1
	.byte	0xc
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
	.uleb128 0x3
	.byte	0x1
	.uaword	.LASF1
	.byte	0x1
	.byte	0xd
	.uaword	0x4e
	.byte	0x1
	.uleb128 0x4
	.byte	0
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
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x8
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
	.uleb128 0x2116
	.uleb128 0xc
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
.LASF0:
	.asciz	"ajit_initialize_interrupt_handlers_to_null"
.LASF4:
	.asciz	"/Satvik/fft/cortos_build"
.LASF5:
	.asciz	"cortos_init_hw_traps"
.LASF2:
	.asciz	"GNU C 4.7.4"
.LASF1:
	.asciz	"ajit_initialize_sw_trap_handlers_to_null"
.LASF3:
	.asciz	"cortos_src/cortos_traps_init.c"
.LASF6:
	.asciz	"cortos_init_sw_traps"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
