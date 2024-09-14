PKG_NAME="tkmm_assets"
PKG_VERSION="be29ffb3339e024810cebdafac14dd6dde1465e9"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/MasterBubbles/libretro-fonts"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="TKMM assets. Required fonts for the UI to be shown properly."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/tkmm/assets
  cp -r ${PKG_BUILD}/pkg ${INSTALL}/usr/share/tkmm/assets/pkg
}

post_makeinstall_target() {
  mkdir -p ${INSTALL}/etc/fonts/conf.d
    cp -v ${PKG_DIR}/conf.d/*.conf ${INSTALL}/etc/fonts/conf.d
}
