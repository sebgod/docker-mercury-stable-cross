# vim: ft=dockerfile tw=78 ts=4 sw=4 et
FROM sebgod/mercury-stable:<VERSION>
MAINTAINER Sebastian Godelet <sebastian.godelet@outlook.com>
ENV MERCURY_STABLE_CROSS_VERSION $MERCURY_STABLE_VERSION-<CROSS_VERSION>
ENV MERCURY_STABLE_CROSS_PREFIX $MERCURY_STABLE_PREFIX-<CROSS_VERSION>
RUN tar --strip 1 -x -v -f $MERCURY_TMP/tarballs/$MERCURY_STABLE_TARGZ \
    && aclocal -I m4    \
    && autoconf         \
    && (sh tools/configure_mingw_cross              \
            --host=<CROSS_VERSION>                  \
            --enable-libgrades=asm_fast.gc          \
            --with-default-grade=asm_fast.gc        \
            --enable-new-mercuryfile-struct         \
            --prefix=$MERCURY_STABLE_CROSS_PREFIX > build.log  \
        && make >> build.log         \
        && make install >> build.log \
        && ln -s $MERCURY_STABLE_PREFIX/bin/mercury_compile \
                 $MERCURY_STABLE_CROSS_PREFIX/bin \
        && rm -fR *         \
        ) || (cat build.log & false)
ENV PATH ${MERCURY_STABLE_CROSS_PREFIX}/bin:$PATH_ORIG
ENTRYPOINT ["mmc"]
