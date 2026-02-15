#!/bin/sh
btn="${BLOCK_BUTTON:-$BUTTON}"
if [ -n "$btn" ]; then
    case "$btn" in
        1) setsid -f "$TERMINAL" -e nmtui ;;
        3) 
            if nmcli con show --active | grep -q "^wg0"; then
                nmcli con down wg0 && notify-send "WireGuard" "VPN Disconnected" -i network-vpn-disconnected
            else
                nmcli con up wg0 && notify-send "WireGuard" "VPN Connected" -i network-vpn
            fi
            ;;
    esac
fi
# Check if wg0 connection is active
if nmcli con show --active | grep -q "^wg0"; then
    printf "\uf023"
else
    printf "\uf2fc"
fi
