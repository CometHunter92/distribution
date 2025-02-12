#!/bin/bash

case $1 in
   pre)
    # Store system brightness
    cat /sys/class/backlight/backlight/brightness > /storage/.brightness
    # Store sound state. Try to avoid having max volume after resume
    alsactl store -f /tmp/asound.state
    systemctl stop headphones
 
    # This file is used by ES to determine if we just woke up from sleep
    touch /run/.last_sleep_time

    ;;
   post)
    # Restore pre-sleep sound state
    alsactl restore -f /tmp/asound.state
    VOL=$(get_setting "audio.volume" 2>/dev/null)
    MIXER="Master"
    amixer set "${MIXER}" ${VOL}% 2>&1 >/dev/null
    # Restore system brightness
    cat /storage/.brightness > /sys/class/backlight/backlight/brightness
    # re-detect and reapply sound, brightness and hp state
    systemctl start headphones
	;;
esac
