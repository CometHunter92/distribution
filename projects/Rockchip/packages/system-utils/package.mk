# Copyright (C) 2021-present Fewtarius

PKG_NAME="system-utils"
PKG_VERSION=""
PKG_SHA256=""
PKG_ARCH="any"
PKG_LICENSE="mix"
PKG_DEPENDS_TARGET="toolchain sleep"
PKG_SITE=""
PKG_URL=""
PKG_LONGDESC="Support scripts for Rockchip/Anbernic devices"
PKG_TOOLCHAIN="manual"

makeinstall_target() {

  mkdir -p ${INSTALL}/usr/lib/autostart/common
  cp ${PKG_DIR}/sources/autostart/common/* ${INSTALL}/usr/lib/autostart/common

  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/fancontrol ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/headphone_sense ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/system_utils ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/volume_sense ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/battery ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/overclock ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/scripts/internalwifi ${INSTALL}/usr/bin
  chmod 0755 ${INSTALL}/usr/bin/*

  mkdir -p ${INSTALL}/usr/config
  cp ${PKG_DIR}/sources/config/fancontrol.conf ${INSTALL}/usr/config/fancontrol.conf.sample
}
