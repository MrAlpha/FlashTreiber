
/*
 * Do not modify this file; it is automatically generated from the template
 * linkcmd.xdt in the ti.platforms.msp430 package and will be overwritten.
 */

/*
 * put '"'s around paths because, without this, the linker
 * considers '-' as minus operator, not a file name character.
 */


-l"D:\Studium\Projekte\Seminararbeit\quelltxt\FlashTreiber\Debug\configPkg\package\cfg\main_pe430.oe430"
-l"D:\Programme\CCS6\grace_3_00_01_59\packages\ti\targets\msp430\rts430\lib\boot.ae430"
-l"D:\Programme\CCS6\grace_3_00_01_59\packages\ti\catalog\msp430\init\lib\ti.catalog.msp430.init.ae430"

--retain="*(xdc.meta)"
--retain="*(xdc.noload)"


/* Elf symbols */
--symbol_map __TI_STACK_BASE=_stack
--symbol_map __TI_STACK_SIZE=_STACK_SIZE
--symbol_map __TI_STATIC_BASE=__bss__
--symbol_map __TI_cleanup_ptr=_cleanup_ptr
--symbol_map __TI_dtors_ptr=_dtors_ptr


--args 0x0
-heap  0x0
-stack 0x40

/*
 * Linker command file contributions from all loaded packages:
 */

/* Content from xdc.services.global (null): */

/* Content from xdc (null): */

/* Content from xdc.corevers (null): */

/* Content from ti.catalog (null): */

/* Content from ti.catalog.msp430.peripherals.interrupt (null): */

/* Content from xdc.rov (null): */

/* Content from xdc.runtime (null): */

/* Content from ti.catalog.msp430.init (null): */

/* Content from ti.catalog.msp430.peripherals.special_function (null): */

/* Content from ti.catalog.msp430.peripherals.clock (null): */

/* Content from ti.catalog.msp430.peripherals.watchdog (null): */

/* Content from ti.catalog.msp430.peripherals.memory (null): */

/* Content from ti.catalog.msp430.peripherals.communication (null): */

/* Content from ti.catalog.msp430.peripherals.timer (null): */

/* Content from ti.catalog.msp430.peripherals.adc (null): */

/* Content from ti.catalog.msp430.peripherals.comparator (null): */

/* Content from ti.catalog.msp430.peripherals.svs (null): */

/* Content from ti.catalog.msp430.peripherals.dac (null): */

/* Content from ti.catalog.msp430.peripherals.gpio (null): */

/* Content from ti.catalog.msp430 (null): */

/* Content from xdc.platform (null): */

/* Content from xdc.cfg (null): */

/* Content from xdc.shelf (null): */

/* Content from xdc.services.spec (null): */

/* Content from xdc.services.intern.xsr (null): */

/* Content from xdc.services.intern.gen (null): */

/* Content from xdc.services.intern.cmd (null): */

/* Content from xdc.bld (null): */

/* Content from ti.targets (null): */

/* Content from ti.targets.msp430.elf (null): */

/* Content from ti.platforms.msp430 (null): */

/* Content from xdc.services.getset (null): */

/* Content from ti.targets.msp430.rts430 (ti/targets/msp430/rts430/link.xdt): */

/* Definitions for ti.targets.msp430.rts430/boot.o* references:             */
/*     - xdc_runtime_System_exit__E */
/*           defined here since we aren't linking with xdc.runtime          */
/*     - ti_targets_msp430_rts430_noexit__I */
/*           defined in case main() returns in noexit variants of _c_int00  */
--symbol_map xdc_runtime_System_exit__E=exit  
--symbol_map ti_targets_msp430_rts430_noexit__I=abort

/* Content from ti.mcu.msp430.csl.interrupt_vectors (null): */

/* Content from ti.mcu.msp430.csl.gpio (null): */

/* Content from ti.mcu.msp430.csl.system (null): */

/* Content from ti.mcu.msp430.csl (ti/mcu/msp430/csl/linker_cmds.xdt): */
/* link with the library generated by MSP430 CSL (D:/Programme/CCS6/grace_3_00_01_59/packages/ti/mcu/msp430/csl/) */
-l"D:\Studium\Projekte\Seminararbeit\quelltxt\FlashTreiber\src\grace/grace.lib"

/* Content from ti.mcu.msp430.csl.communication (null): */

/* Content from ti.mcu.msp430.csl.clock (null): */

/* Content from configPkg (null): */



/*
 * symbolic aliases for static instance objects
 */
xdc_runtime_Startup__RESETFXN__C = 0;
xdc_runtime_Startup_reset__I = 0;
xdc_runtime_Startup__EXECFXN__C = 0;
xdc_runtime_Startup_exec__E = 0;


SECTIONS
{



    xdc.meta: type = COPY
}

