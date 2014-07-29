################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
FlashTreiber.obj: ../FlashTreiber.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"D:/Programme/CCS6/ccsv6/tools/compiler/msp430_4.3.3/bin/cl430" -vmsp --abi=eabi -O0 --include_path="D:/Programme/CCS6/ccsv6/ccs_base/msp430/include" --include_path="D:/Programme/CCS6/ccsv6/tools/compiler/msp430_4.3.3/include" --advice:power=all -g --define=__MSP430G2553__ --diag_warning=225 --display_error_number --diag_wrap=off --printf_support=minimal --preproc_with_compile --preproc_dependency="FlashTreiber.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

main.obj: ../main.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: MSP430 Compiler'
	"D:/Programme/CCS6/ccsv6/tools/compiler/msp430_4.3.3/bin/cl430" -vmsp --abi=eabi -O0 --include_path="D:/Programme/CCS6/ccsv6/ccs_base/msp430/include" --include_path="D:/Programme/CCS6/ccsv6/tools/compiler/msp430_4.3.3/include" --advice:power=all -g --define=__MSP430G2553__ --diag_warning=225 --display_error_number --diag_wrap=off --printf_support=minimal --preproc_with_compile --preproc_dependency="main.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/linker.cmd: ../main.cfg
	@echo 'Building file: $<'
	@echo 'Invoking: XDCtools'
	"D:/Programme/CCS6/xdctools_3_30_03_47_core/xs" --xdcpath="D:/Programme/CCS6/grace_3_00_01_59/packages;D:/Programme/CCS6/msp430/MSP430ware_1_90_00_30/driverlib/packages;D:/Programme/CCS6/msp430/MSP430ware_1_90_00_30/driverlib;D:/Programme/CCS6/ccsv6/ccs_base;" xdc.tools.configuro -o configPkg -t ti.targets.msp430.elf.MSP430 -p ti.platforms.msp430:MSP430G2553 -r debug -c "D:/Programme/CCS6/ccsv6/tools/compiler/msp430_4.3.3" -Dxdc.cfg.tsort.policy=fast -Dxdc.cfg.gen.metadataFiles=false -Dxdc.cfg.SourceDir.verbose=7 --compileOptions "-vmsp --abi=eabi -O0 --include_path=\"D:/Programme/CCS6/ccsv6/ccs_base/msp430/include\" --include_path=\"D:/Programme/CCS6/ccsv6/tools/compiler/msp430_4.3.3/include\" --advice:power=all -g --define=__MSP430G2553__ --diag_warning=225 --display_error_number --diag_wrap=off --printf_support=minimal  " "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/compiler.opt: | configPkg/linker.cmd
configPkg/: | configPkg/linker.cmd


