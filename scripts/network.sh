#!/bin/sh

# Outputs: wifi= ethernet= disconnected= disabled=

btn="${BLOCK_BUTTON:-$BUTTON}"
if [ -n "$btn" ]; then
	case "$btn" in
		1|2) setsid -f "$TERMINAL" -e nmtui ;;
	esac
fi

if command -v rfkill >/dev/null 2>&1; then
	if rfkill list wifi 2>/dev/null | grep -q 'Soft blocked: yes'; then
		printf '%s' ""
		exit 0
	fi
fi

iface=$(ip route show default 2>/dev/null | awk 'NR==1{print $5}')
if [ -z "$iface" ]; then
	printf '%s' ""
	exit 0
fi

if [ -d "/sys/class/net/$iface/wireless" ]; then
	printf '%s' ""
else
	printf '%s' ""
fi
