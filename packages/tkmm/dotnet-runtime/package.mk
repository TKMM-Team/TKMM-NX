# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2022-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet-runtime"
PKG_VERSION="9.0.0"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_LONGDESC=".NET Runtime is a set of libraries to run .NET applications."
PKG_TOOLCHAIN="manual"
PKG_AUTORECONF="no"
PKG_SHA256="96ab6bbe5fe4fc6cce4c24edd96e6333bd92be548f0c73f4357ff9f45e5a36b1"
PKG_URL="https://download.visualstudio.microsoft.com/download/pr/3ae34de0-5928-47c4-9abb-e0b8f795c256/1ea2ed5a50af003121ebf32cb218258e/${PKG_NAME}-${PKG_VERSION}-linux-arm64.tar.gz"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}-${ARCH}.tar.gz"

makeinstall_target() {
        mkdir -p ${INSTALL}/usr/local/share/dotnet && cp -R ${PKG_BUILD}/* ${INSTALL}/usr/local/share/dotnet/
}
