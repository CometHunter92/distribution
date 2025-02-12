################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#      Copyright (C) 2020      351ELEC team (https://github.com/fewtarius/351ELEC)
#      Copyright (C) 2022-present Fewtarius
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="common-shaders"
PKG_VERSION="55e401834b732e62c34411321c4ffd82524345d4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/common-shaders"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain glsl-shaders"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Libretro common shaders"
PKG_LONGDESC="Libretro common shaders"

make_target() {
  :
}

makeinstall_target() {
  if [ ! -d "${INSTALL}/usr/share/common-shaders" ]
  then
    mkdir -p ${INSTALL}/usr/share/common-shaders
  fi
  rsync -a ${BUILD}/${PKG_NAME}-${PKG_VERSION}/* ${INSTALL}/usr/share/common-shaders/
  rm -f ${INSTALL}/usr/share/common-shaders/{Makefile,configure}
}
