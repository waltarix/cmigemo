# vim:set ts=8 sts=8 sw=8 tw=0:
#
# 辞書ファイルのメンテナンス
# 
# Written By:  MURAOKA Taro <koron.kaoriya@gmail.com>

SKKDIC_BASEURL 	= https://skk-dev.github.io/dict
SKKDIC_FILE	= $(addprefix SKK-JISYO.,ML L)
DICT 		= $(subst SKK-JISYO,migemo-dict,$(SKKDIC_FILE))
DICT_BASE	= $(addsuffix .base,$(SKKDIC_FILE))
EUCJP_DIR	= euc-jp.d
UTF8_DIR	= utf-8.d

##############################################################################
# Dictionary
#
$(DICT): $(DICT_BASE)
	$(FILTER_CP932) < $(subst migemo-dict,SKK-JISYO,$(addsuffix .base,$@)) > $@
$(DICT_BASE): $(SKKDIC_FILE) ../tools/skk2migemo.pl ../tools/optimize-dict.pl
	$(PERL) ../tools/skk2migemo.pl < $(basename $@) | $(PERL) ../tools/optimize-dict.pl > $@
$(SKKDIC_FILE):
	$(HTTP) $(SKKDIC_BASEURL)/$@.gz
	$(GUNZIP) $@.gz

##############################################################################
# Dictionary in cp932
#
cp932:		$(DICT)

##############################################################################
# Dictionary in euc-jp
#
EUC_FILES = $(addprefix $(EUCJP_DIR)/,$(DICT))
euc-jp: 	cp932 euc-jp-files
euc-jp-files: $(EUCJP_DIR) $(EUC_FILES) \
	$(EUCJP_DIR)/zen2han.dat $(EUCJP_DIR)/han2zen.dat \
	$(EUCJP_DIR)/hira2kata.dat $(EUCJP_DIR)/roma2hira.dat
$(EUCJP_DIR):
	$(MKDIR) $(EUCJP_DIR)
$(EUC_FILES): $(DICT)
	$(FILTER_EUCJP) < $(notdir $@) > $@
$(EUCJP_DIR)/zen2han.dat: zen2han.dat
	$(FILTER_EUCJP) < zen2han.dat > $@
$(EUCJP_DIR)/han2zen.dat: han2zen.dat
	$(FILTER_EUCJP) < han2zen.dat > $@
$(EUCJP_DIR)/hira2kata.dat: hira2kata.dat
	$(FILTER_EUCJP) < hira2kata.dat > $@
$(EUCJP_DIR)/roma2hira.dat: roma2hira.dat
	$(FILTER_EUCJP) < roma2hira.dat > $@

##############################################################################
# Dictionary in utf-8
#
UTF8_FILES = $(addprefix $(UTF8_DIR)/,$(DICT))
utf-8: 	cp932 utf-8-files
utf-8-files: $(UTF8_DIR) $(UTF8_FILES) \
	$(UTF8_DIR)/zen2han.dat $(UTF8_DIR)/han2zen.dat \
	$(UTF8_DIR)/hira2kata.dat $(UTF8_DIR)/roma2hira.dat
$(UTF8_DIR):
	$(MKDIR) $(UTF8_DIR)
$(UTF8_FILES): $(DICT)
	$(FILTER_UTF8) < $(notdir $@) > $@
$(UTF8_DIR)/zen2han.dat: zen2han.dat
	$(FILTER_UTF8) < zen2han.dat > $@
$(UTF8_DIR)/han2zen.dat: han2zen.dat
	$(FILTER_UTF8) < han2zen.dat > $@
$(UTF8_DIR)/hira2kata.dat: hira2kata.dat
	$(FILTER_UTF8) < hira2kata.dat > $@
$(UTF8_DIR)/roma2hira.dat: roma2hira.dat
	$(FILTER_UTF8) < roma2hira.dat > $@

##############################################################################
# for Microsoft Visual C
#
msvc:		cp932 utf-8

##############################################################################
# for Borland C 5
#
bc5:		cp932 utf-8

##############################################################################
# for Cygwin
#
cyg:		euc-jp utf-8

##############################################################################
# for MinGW
#
mingw:		cp932 utf-8

##############################################################################
# for GNU/gcc(Linux他)
#
gcc:		euc-jp utf-8

##############################################################################
# for MacOS X
#
osx:		euc-jp utf-8

##############################################################################
# Cleaning
#
dict-clean:
	-$(RM) $(DICT)
	-$(RMDIR) $(EUCJP_DIR)
	-$(RMDIR) $(UTF8_DIR)
dict-distclean: dict-clean
	-$(RM) $(DICT_BASE)
	-$(RM) SKK-JISYO*
