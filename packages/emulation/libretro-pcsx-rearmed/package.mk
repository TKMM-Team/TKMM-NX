# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libretro-pcsx-rearmed"
PKG_VERSION="d56340b165b4a7ef25bc3c7509d4f2315843bc31"
PKG_SHA256="5e158b6c98fea71a1dcb2a7392857a5cf6472260473b03f9e1ff0eb44b6670f0"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/pcsx_rearmed"
PKG_URL="https://github.com/libretro/pcsx_rearmed/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_LONGDESC="game.libretro.pcsx-rearmed: PCSX Rearmed for Kodi"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="pcsx_rearmed_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="PCSX-REARMED_LIB"

make_target() {
  cd $PKG_BUILD
  
  if target_has_feature neon; then
    export HAVE_NEON=1
    export BUILTIN_GPU=neon
   else
    export HAVE_NEON=0
  fi

  # check if this flag is still needed when this package is updated
  export CFLAGS="$CFLAGS -fcommon"
  
  case $TARGET_ARCH in
    aarch64)
      make -f Makefile.libretro DYNAREC=lightrec platform=aarch64 GIT_VERSION=$PKG_VERSION
      ;;
    arm)
      make -f Makefile.libretro DYNAREC=ari64 GIT_VERSION=$PKG_VERSION
      ;;
    x86_64)
      make -f Makefile.libretro DYNAREC=lightrec GIT_VERSION=$PKG_VERSION
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME
  cp $PKG_LIBPATH $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $SYSROOT_PREFIX/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/lib/cmake/$PKG_NAME/$PKG_NAME-config.cmake
}
