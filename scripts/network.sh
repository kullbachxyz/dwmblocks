#!/bin/sh
# dwmblocks module: Network status icon
#
# Left/Middle click (1/2): open nmtui in terminal
#
# Icons:
#   󰖩: wifi connected
#   : ethernet connected
#   󰤯: wifi enabled but not connected
#   󰖪: wifi disabled (rfkill blocked / unavailable)
btn="${BLOCK_BUTTON:-$BUTTON}"
if [ -n "$btn" ]; then
	case "$btn" in
		1|2) setsid -f "$TERMINAL" -e nmtui ;;
	esac
fi
# Get the default route interface
iface=$(ip route show default 2>/dev/null | awk 'NR==1{print $5}')
if [ -n "$iface" ]; then
	# Connected — determine wifi or ethernet
	if [ -d "/sys/class/net/$iface/wireless" ]; then
		printf '%s' ""
	else
		printf '%s' ""
	fi
else
	# Not connected — check wifi radio state via nmcli
	wifi_state=$(nmcli -t -f TYPE,STATE dev 2>/dev/null | grep '^wifi:' | head -1 | cut -d: -f2)
	case "$wifi_state" in
		disconnected) printf '%s' "󰤯" ;;
		*)            printf '%s' "󰖪" ;;
	esac
fi
