PKG_NAME="tkmm"
PKG_VERSION="v1.0.0-beta11"
PKG_LICENSE="MIT"
PKG_SITE="https://tkmm.org/"
PKG_URL="https://github.com/TKMM-Team/Tkmm/releases/download/${PKG_VERSION}/TKMM-linux-arm64.zip"
PKG_DEPENDS_TARGET="dotnet-sdk libICE libSM icu tkmm_assets fontconfig"
PKG_LONGDESC="TKMM is an easy to use mod manager and file merger for Tears of the Kingdom"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
    cp -v ${PKG_BUILD}/tkmm ${INSTALL}/usr/bin
    cp -v ${PKG_DIR}/scripts/tkmm-*.sh ${INSTALL}/usr/bin
}

post_install() {
  enable_service tkmm.target
  enable_service tkmm-autostart.service
  enable_service tkmm.service
}
