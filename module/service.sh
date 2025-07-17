#!/system/bin/sh

[ -z "$MODPATH" ] && MODPATH="${0%/*}"

PACKAGE_NAME="com.fb.fluid"
LOG_FILE="/data/local/tmp/miui-gesture-fix.log"
DIVIDER="================================"

log() {
    echo "$@" >> "$LOG_FILE"
}

clear_old_logs() {
    echo $DIVIDER > "$LOG_FILE"
}

redirect_output() {
    "$@" >> "$LOG_FILE"
    return $?
}

verify_boot_status() {
    log "System: Checking boot status."
    until [ "$(getprop sys.boot_completed)" = "1" ]; do
        sleep 2
    done
    log "System: Boot completed."
    log ""
}

check_and_install_fng() {
    if [ -z "$(pm list packages "$PACKAGE_NAME")" ]; then
        log "FNG: Not installed."
        log "FNG: Installing."
        redirect_output \
            pm install "$MODPATH/fng.apk" \
            && log "FNG: Successfully installed." \
            || log "FNG: Failed to install."
    else
        log "FNG: Is present."
    fi
    log ""
}

check_and_grant_fng_accessibility() {
    accessibility_activity="com.fb.fluid/com.fb.fluid.MainAccessibilityService"
    if ! settings get secure enabled_accessibility_services | grep -q "$accessibility_activity"; then
        log "FNG: Accessibility permission not granted."
        log "FNG: Granting permission."
        redirect_output settings put secure enabled_accessibility_services "$accessibility_activity"
        log "FNG: Permission granted."
    else
        log "FNG: Accessibility permission available."
    fi
    log ""
}

enable_system_gestures() {
    log "Navigation: Enabling Gestures."
    redirect_output cmd overlay enable com.android.internal.systemui.navbar.gestural
    log "Navigation: Done."
    log ""
}

hide_nav_bar() {
    log "Navigation Bar: Hiding bar."
    content insert --uri content://settings/global --bind name:s:force_fsg_nav_bar --bind value:i:1
    sleep 5
    content insert --uri content://settings/global --bind name:s:force_fsg_nav_bar --bind value:i:1
    log "Navigation Bar: Done."
    log ""
}

main() {
    clear_old_logs
    log "Module: Executing Functions."
    log ""

    verify_boot_status

    check_and_install_fng
    check_and_grant_fng_accessibility

    hide_nav_bar
    enable_system_gestures

    log ""
    log "Module: All done."
    log $DIVIDER
}

main
