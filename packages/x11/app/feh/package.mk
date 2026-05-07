# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2026 TKMM-Team

PKG_NAME="feh"
PKG_VERSION="3.12.1"
PKG_SHA256="6772f48e7956a16736e4c165a8367f357efc413b895f5b04133366e01438f95d"
PKG_LICENSE="MIT"
PKG_SITE="https://feh.finalrewind.org/"
PKG_URL="https://feh.finalrewind.org/feh-${PKG_VERSION}.tar.bz2"
PKG_DEPENDS_TARGET="toolchain zlib libX11 libXt libpng imlib2"
PKG_LONGDESC="feh is a light-weight image viewer."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+pic -sysroot"

pre_make_target() {
  sed -i 's/-lpng -lX11/-lpng -lz -lX11/' ${PKG_BUILD}/config.mk
}

PKG_MAKE_OPTS_TARGET="build-src xinerama=0 curl=0 exif=0 magic=0 VERSION=${PKG_VERSION}"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp -P ${PKG_BUILD}/src/feh ${INSTALL}/usr/bin/
}
