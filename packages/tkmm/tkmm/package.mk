PKG_NAME="tkmm"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/TKMM-Team/Tkmm"
PKG_DEPENDS_TARGET="libICE libSM libXcursor icu fontconfig xf86-input-joystick ffmpegx 7-zip"
PKG_LONGDESC="TKMM is an easy to use mod manager and file merger for Tears of the Kingdom"
PKG_URL="${PKG_SITE}.git"
PKG_TOOLCHAIN="manual"

: ${TKMM_VERSION:=0.0.0}

case "${TKMM_VERSION}" in
  "0.0.0")
    PKG_VERSION="104b63d7ef0acf6bf6e64cb6f260f90c122b0909"
    ;;
  *)
    PKG_VERSION="${TKMM_VERSION}"
    ;;
esac

PKG_BUILD_FLAGS=" -c Release \
                  -r linux-arm64 \
                  --sc false \
                  --version-suffix ${TKMM_VERSION} \
                  -p:DebugType=embedded \
                  -p:IncludeNativeLibrariesForSelfExtract=true \
                  -p:PublishSingleFile=true \
                  -p:Version=${TKMM_VERSION#v} \
                  -p:IsSwitch=true"

pre_make_target() {
  mkdir -p ${INSTALL}/tkmm/tmp
  mkdir -p ${INSTALL}/usr/bin
  cp -v ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/tkmm/
  chmod +x ${INSTALL}/usr/bin/*
  cp -r ${PKG_DIR}/fonts ${INSTALL}/usr/share/tkmm/fonts
  cp -r ${PKG_DIR}/audio ${INSTALL}/usr/share/tkmm/audio
  dotnet publish src/Tkmm ${PKG_BUILD_FLAGS} -o ${INSTALL}/tkmm/tmp
  tar -cvf ${INSTALL}/tkmm/tkmm.tar.gz -C ${INSTALL}/tkmm/tmp .
  rm -rf ${INSTALL}/tkmm/tmp
}

post_makeinstall_target() {
  mkdir -p ${INSTALL}/etc/fonts/conf.d
  cp -v ${PKG_DIR}/conf.d/*.conf ${INSTALL}/etc/fonts/conf.d
  cp -v ${PKG_DIR}/config.ini ${INSTALL}/usr/share/tkmm/
}

post_install() {
  enable_service tkmm.target
  enable_service tkmm-autostart.service
  enable_service tkmm.service
  enable_service tkmm-wake-config.service
}
