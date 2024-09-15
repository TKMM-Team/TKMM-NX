# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="xf86-input-joystick"
PKG_VERSION="1.6.4"
PKG_SHA256="905ec485fabc699b1cb21518cbd152246776fa83570e09c5822ca0973733ccd2"
PKG_LICENSE="MIT"
PKG_SITE="https://gitlab.freedesktop.org/xorg/driver/xf86-input-joystick"
PKG_URL="https://xorg.freedesktop.org/archive/individual/driver/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain libinput xorg-server xf86-input-libinput"
PKG_LONGDESC="Joystick input driver for the Xorg X server."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--with-xorg-module-dir=${XORG_PATH_MODULES}"

[ "${DEVICE}" = "Switch" -o "${DEVICE}" = "Odin" ] && PKG_DEPENDS_TARGET+=" xorg-server" || true

post_makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/X11/xorg.conf.d
    cp ${PKG_DIR}/config/* ${INSTALL}/usr/share/X11/xorg.conf.d
}
