# invoke SourceDir generated makefile for main.pe430
main.pe430: .libraries,main.pe430
.libraries,main.pe430: package/cfg/main_pe430.xdl
	$(MAKE) -f D:\Studium\Projekte\Seminararbeit\quelltxt\FlashTreiber/src/makefile.libs

clean::
	$(MAKE) -f D:\Studium\Projekte\Seminararbeit\quelltxt\FlashTreiber/src/makefile.libs clean

