# vim: ft=make tw=78 sw=4 ts=4 noet
VERSIONS := vlatest v14.01.1
CROSS_VERSIONS := x86_64-w64-mingw32 i686-w64-mingw32
MKDIR := mkdir
SED := sed

.DEFAULT: default

default: $(VERSIONS)

v%: src/Dockerfile $(MAKEFILE)
	@$(foreach CROSS_VERSION,$(CROSS_VERSIONS),                    \
        $(MKDIR) -p $*-$(CROSS_VERSION);                           \
        $(SED) -e s/\<VERSION\>/$*/g                               \
               -e s/\<CROSS_VERSION\>/$(CROSS_VERSION)/g           \
               < $< > $*-$(CROSS_VERSION)/Dockerfile;              \
	)

