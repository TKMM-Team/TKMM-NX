PKG_NAME="tkmm"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/TKMM-Team/Tkmm"
PKG_VERSION="60f9e096c88ed67ab2263ed04fb9a7d45f96223a"
VERSION_NAME="0.0.1-test"
PKG_GIT_CLONE_BRANCH="refactor-1.0.0"
PKG_DEPENDS_TARGET="libICE libSM icu tkmm_assets fontconfig xf86-input-joystick 7-zip"
PKG_LONGDESC="TKMM is an easy to use mod manager and file merger for Tears of the Kingdom"
PKG_URL="${PKG_SITE}.git"
PKG_TOOLCHAIN="manual"

PKG_BUILD_FLAGS=" -c Release \
                  -r linux-arm64 \
                  --sc false \
                  --version-suffix v${VERSION_NAME} \
                  -p:DebugType=embedded \
                  -p:IncludeNativeLibrariesForSelfExtract=true \
                  -p:PublishSingleFile=true \
                  -p:Version=${VERSION_NAME} \
                  -p:DefineConstants=SWITCH%3BTRACE%3BTARGET_NX%3BRELEASE"

pre_make_target() {
  mkdir -p ${INSTALL}/usr/bin/tkmm
  cp -v ${PKG_DIR}/scripts/tkmm* ${INSTALL}/usr/bin
}

makeinstall_target() {
  dotnet publish src/Tkmm ${PKG_BUILD_FLAGS} -o ${INSTALL}/usr/bin/tkmm
  mv ${INSTALL}/usr/bin/tkmm/Tkmm ${INSTALL}/usr/bin/tkmm/tkmm
  tar -cvf ${INSTALL}/usr/bin/tkmm.tar.gz -C ${INSTALL}/usr/bin/tkmm .
  rm -rf ${INSTALL}/usr/bin/tkmm
}

post_install() {
  enable_service tkmm.target
  enable_service tkmm-autostart.service
  enable_service tkmm.service
}
