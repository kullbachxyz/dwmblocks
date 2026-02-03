#!/bin/sh

# Outputs: on=󰂯 off=󰂲 connected=󰂱 disabled/absent=""

btn="${BLOCK_BUTTON:-$BUTTON}"
if [ -n "$btn" ]; then
	case "$btn" in
		1|2) setsid -f "$TERMINAL" -e bluetui ;;
	esac
fi

if ! command -v bluetoothctl >/dev/null 2>&1; then
	exit 0
fi

# Fast exit when no Bluetooth adapter exists (common in VMs).
[ -d /sys/class/bluetooth ] || exit 0

powered=$(timeout 1s bluetoothctl show 2>/dev/null | awk -F': ' '/Powered/ {print $2; exit}')
if [ -z "$powered" ]; then
	# No adapter/controller detected; show "off"
	printf '%s' "󰂲"
	exit 0
fi

if [ "$powered" != "yes" ]; then
	printf '%s' "󰂲"
	exit 0
fi

connected=0
if timeout 1s bluetoothctl devices Connected 2>/dev/null | grep -q '^Device '; then
	connected=1
else
	set -- $(timeout 1s bluetoothctl paired-devices 2>/dev/null | awk '{print $2}')
	for dev in "$@"; do
		[ -n "$dev" ] || continue
		if timeout 1s bluetoothctl info "$dev" 2>/dev/null | grep -q 'Connected: yes'; then
			connected=1
			break
		fi
	done
fi

if [ "$connected" -eq 1 ]; then
	printf '%s' "󰂱"
else
	printf '%s' "󰂯"
fi
