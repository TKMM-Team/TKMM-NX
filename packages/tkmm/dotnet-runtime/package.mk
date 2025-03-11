# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet-runtime"
PKG_VERSION="9.0.2"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_LONGDESC=".NET Runtime is a set of libraries to run .NET applications."
PKG_TOOLCHAIN="manual"
PKG_AUTORECONF="no"
PKG_SHA256="63f29ad13759d3bd7e356f148f0f0fcedc9c17f219a519023ceace53d02df3b8"
PKG_URL="https://builds.dotnet.microsoft.com/dotnet/Runtime/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}-linux-arm64.tar.gz"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}-${ARCH}.tar.gz"

makeinstall_target() {
        mkdir -p ${INSTALL}/usr/local/share/dotnet && cp -R ${PKG_BUILD}/* ${INSTALL}/usr/local/share/dotnet/
}
