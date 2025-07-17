#!/system/bin/sh

[ -z "$MODPATH" ] && MODPATH="${0%/*}"
chmod 755 "$MODPATH/service.sh"
