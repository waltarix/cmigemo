# vim:set ts=8 sts=8 sw=8 tw=0:
#
# Visual C++�p Makefile
#
# Last Change:	16-May-2002.
# Written By:	MURAOKA Taro <koron@tka.att.ne.jp>

default: release

!include config.mk
!include compile/clean_dos.mak
!include compile/clean.mak
!include dict/dict.mak

release:
	$(MAKE) /nologo /f compile\migemo.mak CFG="migemo - Win32 Release"

debug:
	$(MAKE) /nologo /f compile\migemo.mak CFG="migemo - Win32 Debug"

dictionary: cd-dict msvc
	cd ..

cd-dict:
	cd dict
