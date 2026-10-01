# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet-sdk"
PKG_VERSION="10.0.401"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_LONGDESC=".NET SDK is a set of libraries and tools that developers use to create .NET applications and libraries."
PKG_TOOLCHAIN="manual"
PKG_AUTORECONF="no"
PKG_SHA256="91d3d67f2ed065909bd2e1ba50a37192aff6df15178304939d5b55634d72da6a"
PKG_URL="https://builds.dotnet.microsoft.com/dotnet/Sdk/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}-linux-arm64.tar.gz"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}-${ARCH}.tar.gz"

makeinstall_target() {
        mkdir -p ${INSTALL}/usr/local/share/dotnet && cp -R ${PKG_BUILD}/* ${INSTALL}/usr/local/share/dotnet/
}
