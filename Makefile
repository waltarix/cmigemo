# vi:set ts=8 sts=8 sw=8 tw=0:
#
# C/Migemo Makefile
#
# Last Change: 16-May-2002.
# Written By:  MURAOKA Taro <koron@tka.att.ne.jp>

default: tags

tags: *.c *.h
	ctags *.c *.h

##############################################################################
# for Borland C 5
#
bc: bc-rel
bc-all: bc-rel bc-dict
bc-rel:
	$(MAKE) -f compile\Make_bc5.mak
bc-dict:
	$(MAKE) -f compile\Make_bc5.mak dictionary
bc-clean:
	$(MAKE) -f compile\Make_bc5.mak clean
bc-distclean:
	$(MAKE) -f compile\Make_bc5.mak distclean

##############################################################################
# for Cygwin
#
cyg: cyg-rel
cyg-all: cyg-rel cyg-dict
cyg-rel:
	$(MAKE) -f compile/Make_cyg.mak
cyg-dict:
	$(MAKE) -f compile/Make_cyg.mak dictionary
cyg-install: cyg-all
	$(MAKE) -f compile/Make_cyg.mak install
cyg-uninstall:
	$(MAKE) -f compile/Make_cyg.mak uninstall
cyg-clean:
	$(MAKE) -f compile/Make_cyg.mak clean
cyg-distclean:
	$(MAKE) -f compile/Make_cyg.mak distclean

##############################################################################
# for Linux (Tested on Vine Linux 2.1.5)
#
linux: linux-rel
linux-all: linux-rel linux-dict
linux-rel:
	$(MAKE) -f compile/Make_linux.mak
linux-dict:
	$(MAKE) -f compile/Make_linux.mak dictionary
linux-install: linux-all
	$(MAKE) -f compile/Make_linux.mak install
linux-uninstall:
	$(MAKE) -f compile/Make_linux.mak uninstall
linux-clean:
	$(MAKE) -f compile/Make_linux.mak clean
linux-distclean:
	$(MAKE) -f compile/Make_linux.mak distclean

##############################################################################
# for Microsoft Visual C
#
msvc: msvc-rel
msvc-all: msvc-rel msvc-dict
msvc-rel:
	$(MAKE) /nologo /f compile\Make_mvc.mak
msvc-dict:
	$(MAKE) /nologo /f compile\Make_mvc.mak dictionary
msvc-clean:
	$(MAKE) /nologo /f compile\Make_mvc.mak clean
msvc-distclean:
	$(MAKE) /nologo /f compile\Make_mvc.mak distclean

##############################################################################
# for MacOS X
#
osx: osx-rel
osx-all: osx-rel osx-dict
osx-rel:
	$(MAKE) -f compile/Make_osx.mak
osx-dict:
	$(MAKE) -f compile/Make_osx.mak dictionary
osx-install: osx-all
	$(MAKE) -f compile/Make_osx.mak install
osx-uninstall:
	$(MAKE) -f compile/Make_osx.mak uninstall
osx-clean:
	$(MAKE) -f compile/Make_osx.mak clean
osx-distclean:
	$(MAKE) -f compile/Make_osx.mak distclean
