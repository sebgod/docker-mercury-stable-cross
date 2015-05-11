# vim: ft=Dockerfile tw=78 ts=4 sw=4 et
FROM sebgod/mercury-stable:latest
MAINTAINER Sebastian Godelet <sebastian.godelet@outlook.com>
ENV MERCURY_STABLE_CROSS_VERSION $MERCURY_STABLE_VERSION-i686-w64-mingw32
ENV MERCURY_STABLE_CROSS_PREFIX $MERCURY_STABLE_PREFIX-i686-w64-mingw32
RUN tar --strip 1 -x -v -f $MERCURY_TMP/tarballs/$MERCURY_STABLE_TARGZ \
    && aclocal -I m4    \
    && autoconf         \
    && sh tools/configure_mingw_cross           \
        --host=i686-w64-mingw32                  \
        --enable-libgrades=asm_fast.gc          \
        --with-default-grade=asm_fast.gc        \
        --enable-new-mercuryfile-struct         \
        --prefix=$MERCURY_STABLE_CROSS_PREFIX   \
    && make             \
    && make install     \
    && rm -fR *         \
    && ln -s $MERCURY_STABLE_PREFIX/bin/mercury_compile \
             $MERCURY_STABLE_CROSS_PREFIX/bin
ENV PATH ${MERCURY_STABLE_CROSS_PREFIX}/bin:$PATH_ORIG
ENTRYPOINT ["mmc"]
