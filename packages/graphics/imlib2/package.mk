# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026 TKMM-Team

PKG_NAME="imlib2"
PKG_VERSION="1.12.3"
PKG_SHA256="96244656576a3e0a6f58b78e514ddc919622ac6806711bc231837eee62c1de34"
PKG_LICENSE="BSD-3-Clause"
PKG_SITE="https://docs.enlightenment.org/api/imlib2/html/"
PKG_URL="https://downloads.sourceforge.net/project/enlightenment/imlib2-src/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain util-macros libX11 libXext freetype libjpeg-turbo libpng zlib"
PKG_LONGDESC="Imlib2 is a library that does image file loading, saving, rendering, and manipulation."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="--disable-static --enable-shared \
                           --without-gif \
                           --without-heif \
                           --without-j2k \
                           --without-jxl \
                           --without-ps \
                           --without-raw \
                           --without-svg \
                           --without-webp \
                           --without-y4m \
                           --without-tiff \
                           --without-lzma \
                           --without-id3"

post_configure_target() {
  libtool_remove_rpath libtool
}

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/bin
}
