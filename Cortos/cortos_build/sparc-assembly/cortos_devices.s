	.file	"cortos_devices.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.align 4
	.global __cortos_enable_serial
	.type	__cortos_enable_serial, #function
	.proc	020
__cortos_enable_serial:
.LFB0:
	.file 1 "cortos_src/cortos_devices.c"
	.loc 1 9 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI0:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 10 0
	mov	3, %o0
	call	__ajit_write_serial_control_register_via_vmap__, 0
	 nop
	.loc 1 11 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	__cortos_enable_serial, .-__cortos_enable_serial
	.align 4
	.global __cortos_enable_serial_interrupt
	.type	__cortos_enable_serial_interrupt, #function
	.proc	020
__cortos_enable_serial_interrupt:
.LFB1:
	.loc 1 13 0
	.cfi_startproc
	save	%sp, -96, %sp
.LCFI1:
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 14 0
	mov	7, %o0
	call	__ajit_write_serial_control_register_via_vmap__, 0
	 nop
	.loc 1 15 0
	restore
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE1:
	.size	__cortos_enable_serial_interrupt, .-__cortos_enable_serial_interrupt
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x84
	.uahalf	0x2
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.uaword	.LASF9
	.byte	0x1
	.uaword	.LASF10
	.uaword	.LASF11
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
	.byte	0x8
	.byte	0x7
	.uaword	.LASF6
	.uleb128 0x4
	.byte	0x1
	.uaword	.LASF7
	.byte	0x1
	.byte	0x9
	.uaword	.LFB0
	.uaword	.LFE0
	.uaword	.LLST0
	.byte	0x1
	.uleb128 0x4
	.byte	0x1
	.uaword	.LASF8
	.byte	0x1
	.byte	0xd
	.uaword	.LFB1
	.uaword	.LFE1
	.uaword	.LLST1
	.byte	0x1
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
.LASF5:
	.asciz	"unsigned int"
.LASF9:
	.asciz	"GNU C 4.7.4"
.LASF0:
	.asciz	"signed char"
.LASF8:
	.asciz	"__cortos_enable_serial_interrupt"
.LASF4:
	.asciz	"short unsigned int"
.LASF1:
	.asciz	"short int"
.LASF7:
	.asciz	"__cortos_enable_serial"
.LASF6:
	.asciz	"long long unsigned int"
.LASF11:
	.asciz	"/Satvik/fft/cortos_build"
.LASF3:
	.asciz	"unsigned char"
.LASF10:
	.asciz	"cortos_src/cortos_devices.c"
.LASF2:
	.asciz	"long long int"
	.ident	"GCC: (Buildroot 2014.08) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
