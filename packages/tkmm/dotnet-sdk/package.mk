# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet-sdk"
PKG_VERSION="8.0.401"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_LONGDESC=".NET SDK is a set of libraries and tools that developers use to create .NET applications and libraries."
PKG_TOOLCHAIN="manual"
PKG_AUTORECONF="no"

case "${ARCH}" in
  "aarch64")
    PKG_SHA256="4ae045ce1dd681a55613dfafbf3a6f4a27b467ba4718855f163e453f810a73d8"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/14742499-fc32-461e-bdb8-67b147763eee/c14113944f734526153f1aaac38ddfca/${PKG_NAME}-${PKG_VERSION}-linux-arm64.tar.gz"
    ;;
  "arm")
    PKG_SHA256="100a2053e2b27928039b2eb09a873a823c4fe8eeb98a1369f6f25f88feed783e"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/d915a052-b50b-4305-978c-fbf644e71eed/de3ac6fbebd4db705413aac807aa11fe/${PKG_NAME}-${PKG_VERSION}-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_SHA256="6c2ac04cb04f9584fb9cf9db7d1928cbc48bc4c710a1a88c2a132e9329780fbe"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/4a252cd9-d7b7-41bf-a7f0-b2b10b45c068/1aff08f401d0e3980ac29ccba44efb29/${PKG_NAME}-${PKG_VERSION}-linux-x64.tar.gz"
    ;;
esac
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}-${ARCH}.tar.gz"

makeinstall_target() {
        mkdir -p ${INSTALL}/usr/local/share/dotnet && cp -R ${PKG_BUILD}/* ${INSTALL}/usr/local/share/dotnet/
}
