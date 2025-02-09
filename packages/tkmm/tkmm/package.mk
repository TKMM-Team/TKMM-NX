PKG_NAME="tkmm"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/TKMM-Team/Tkmm"
#PKG_VERSION="${TKMM_VERSION}"
PKG_VERSION="9f3064aa4c2441264579daf43b08a49c5f69ecd3"
PKG_DEPENDS_TARGET="libICE libSM icu tkmm_assets fontconfig xf86-input-joystick 7-zip"
PKG_LONGDESC="TKMM is an easy to use mod manager and file merger for Tears of the Kingdom"
PKG_URL="${PKG_SITE}.git"
PKG_TOOLCHAIN="manual"

PKG_BUILD_FLAGS=" -c Release \
                  -r linux-arm64 \
                  --sc false \
                  --version-suffix v${TKMM_VERSION} \
                  -o ${INSTALL}/tkmm/tmp \
                  -p:DebugType=embedded \
                  -p:IncludeNativeLibrariesForSelfExtract=true \
                  -p:PublishSingleFile=true \
                  -p:Version=${TKMM_VERSION} \
                  -p:DefineConstants=SWITCH%3BTRACE%3BTARGET_NX%3BRELEASE"

pre_make_target() {
  mkdir -p ${INSTALL}/tkmm/tmp
  cp -v ${PKG_DIR}/scripts/tkmm* ${INSTALL}/tkmm/tmp
}

makeinstall_target() {
  dotnet publish src/Tkmm ${PKG_BUILD_FLAGS}
  tar -cvf ${INSTALL}/tkmm/tkmm.tar.gz -C ${INSTALL}/tkmm/tmp .
  rm -rf ${INSTALL}/tkmm/tmp
}

post_install() {
  enable_service tkmm.target
  enable_service tkmm-autostart.service
  enable_service tkmm.service
}
