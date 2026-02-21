#!/bin/sh
# dwmblocks module: WireGuard VPN control
#
# Left click   (1): toggle VPN on/off (uses wg0-full by default)
# Middle click (2): open nmtui in terminal
# Right click  (3): dmenu prompt to switch between full and split tunnel
#
# Requires: NetworkManager, dmenu, libnotify
# Connections: wg0-full (allowed-ips=0.0.0.0/0)
#              wg0-split (allowed-ips=192.168.188.0/24)

btn="${BLOCK_BUTTON:-$BUTTON}"
if [ -n "$btn" ]; then
    case "$btn" in
        1)
            if nmcli con show --active | grep -q "^wg0"; then
                nmcli con down wg0-full 2>/dev/null; nmcli con down wg0-split 2>/dev/null
                notify-send "WireGuard" "VPN Disconnected" -i network-vpn-disconnected
            else
                nmcli con up wg0-full && notify-send "WireGuard" "VPN Connected (Full)" -i network-vpn
            fi
            ;;
        2) setsid -f "$TERMINAL" -e nmtui ;;
        3)
            choice=$(printf "Split Tunnel (wg0-split)\nFull VPN (wg0-full)" | dmenu -i -p "VPN Mode:")
            case "$choice" in
                "Full VPN (wg0-full)")
                    nmcli con down wg0-split 2>/dev/null
                    nmcli con up wg0-full && notify-send "WireGuard" "Full VPN" -i network-vpn
                    ;;
                "Split Tunnel (wg0-split)")
                    nmcli con down wg0-full 2>/dev/null
                    nmcli con up wg0-split && notify-send "WireGuard" "Split Tunnel" -i network-vpn
                    ;;
            esac
            ;;
    esac
fi

# Status icon based on active connection
if nmcli con show --active | grep -q "^wg0-full"; then
    printf " "
elif nmcli con show --active | grep -q "^wg0-split"; then
    printf " "
else
    printf ""
fi
