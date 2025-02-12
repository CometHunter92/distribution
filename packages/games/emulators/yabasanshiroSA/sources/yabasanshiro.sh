#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2022-present Fewtarius

# Source predefined functions and variables
. /etc/profile

ROM_DIR="/storage/roms/saturn/yabasanshiro"
CONFIG_DIR="/storage/.config/game/configs/yabasanshiro"
SOURCE_DIR="/usr/config/game/configs/yabasanshiro"
BIOS_BACKUP="/storage/roms/bios/yabasanshiro"

if [ ! -d "${ROM_DIR}" ]
then
  mkdir -p "${ROM_DIR}"
fi

if [ ! -d "${BIOS_BACKUP}" ]
then
  mkdir -p "${BIOS_BACKUP}"
fi

if [ ! -e "${ROM_DIR}/${ROM_DIR}/input.cfg" ]
then
  GAMEPAD=$(grep -b4 $(readlink ${DEVICE_CONTROLLER_DEV} | sed "s#^.*/##") /proc/bus/input/devices | awk 'BEGIN {FS="\""}; /Name/ {printf $2}')
  GAMEPADCONFIG=$(xmlstarlet sel -t -c '//inputList/inputConfig[@deviceName="'${GAMEPAD}'"]' -n /storage/.emulationstation/es_input.cfg)

  if [ ! -z "${GAMEPADCONFIG}" ]
  then
    cat <<EOF >${ROM_DIR}/input.cfg
<?xml version="1.0"?>
<inputList>
${GAMEPADCONFIG}
</inputList>
EOF
  fi
fi

BIOS=""
for BIOS in saturn_bios.bin sega_101.bin mpr-17933.bin mpr-18811-mx.ic1 mpr-19367-mx.ic1 stvbios.zip
do
  BIOS=$(find /storage/roms/bios -name ${BIOS} -print 2>/dev/null)
  if [ ! -z "${BIOS}" ]
  then
    BIOS="-b ${BIOS}"
    break
  fi
done

yabasanshiro -r 2 -i "${1}" ${BIOS} >/var/log/exec.log 2>&1 ||:
