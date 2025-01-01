# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet-sdk"
PKG_VERSION="9.0.101"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_LONGDESC=".NET SDK is a set of libraries and tools that developers use to create .NET applications and libraries."
PKG_TOOLCHAIN="manual"
PKG_AUTORECONF="no"
PKG_SHA256="160411c1531059d6318a52e116f2d7a042fcc29f327eac2a305215c1bcbb2e77"
PKG_URL="https://download.visualstudio.microsoft.com/download/pr/93a7156d-01ef-40a1-b6e9-bbe7602f7e8b/3c93e90c63b494972c44f073e15bfc26/${PKG_NAME}-${PKG_VERSION}-linux-arm64.tar.gz"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}-${ARCH}.tar.gz"

makeinstall_target() {
        mkdir -p ${INSTALL}/usr/local/share/dotnet && cp -R ${PKG_BUILD}/* ${INSTALL}/usr/local/share/dotnet/
}
