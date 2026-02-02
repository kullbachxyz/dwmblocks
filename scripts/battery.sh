#!/bin/sh

btn="${BLOCK_BUTTON:-$BUTTON}"
if [ -n "$btn" ]; then
	case "$btn" in
		1|2) setsid -f "$TERMINAL" -e sh -c 'watch -n 1 acpi -V' ;;
	esac
fi

bat_dir=""
ac_dir=""

for d in /sys/class/power_supply/*; do
	[ -d "$d" ] || continue
	case "$(cat "$d/type" 2>/dev/null)" in
		Battery) bat_dir="$d" ;;
		Mains) ac_dir="$d" ;;
	esac
done

[ -n "$bat_dir" ] || exit 0

capacity=$(cat "$bat_dir/capacity" 2>/dev/null)
status=$(cat "$bat_dir/status" 2>/dev/null)

if [ -z "$capacity" ]; then
	exit 0
fi

ac_online=0
if [ -n "$ac_dir" ] && [ -f "$ac_dir/online" ]; then
	ac_online=$(cat "$ac_dir/online" 2>/dev/null)
fi

# Icons:     
if [ "$capacity" -le 10 ]; then
	icon=" "
elif [ "$capacity" -le 30 ]; then
	icon=" "
elif [ "$capacity" -le 50 ]; then
	icon=" "
elif [ "$capacity" -le 70 ]; then
	icon=" "
else
	icon=" "
fi

printf '%s%s%%' "$icon" "$capacity"
