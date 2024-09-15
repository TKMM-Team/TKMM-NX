PKG_NAME="tkmm"
PKG_LICENSE="MIT"
PKG_SITE="https://tkmm.org/"
PKG_DEPENDS_TARGET="dotnet-sdk libICE libSM icu tkmm_assets fontconfig xf86-input-joystick"
PKG_LONGDESC="TKMM is an easy to use mod manager and file merger for Tears of the Kingdom"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp -v ${PKG_DIR}/scripts/tkmm-*.sh ${INSTALL}/usr/bin
}

post_install() {
  enable_service tkmm.target
  enable_service tkmm-autostart.service
  enable_service tkmm.service
}
