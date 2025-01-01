# SPDX-License-Identifier: GPL-2.0
# Git package for LibreELEC

PKG_NAME="git"
PKG_VERSION="2.47.1"
PKG_LICENSE="GPLv2"
PKG_SITE="https://git-scm.com/"
PKG_URL="https://github.com/git/git/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl"
PKG_LONGDESC="Git is a free and open source distributed version control system."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic"

PKG_CONFIGURE_OPTS_TARGET="NO_ICONV=true \
                           ac_cv_fread_reads_directories=true \
                           ac_cv_snprintf_returns_bogus=false"

make_target() {
  cd ${PKG_BUILD}
  autoconf

  ./configure --prefix=/usr \
              --host=aarch64-libreelec-linux-gnu \
              CFLAGS="-I${INSTALL}/usr/include" \
              LDFLAGS="-L${INSTALL}/usr/lib" \
              ${PKG_CONFIGURE_OPTS_TARGET}

  make install DESTDIR="${INSTALL}/usr"
}
