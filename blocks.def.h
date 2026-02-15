//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "$HOME/.local/src/dwmblocks/scripts/wg.sh",	30,		7},
	{"", "$HOME/.local/src/dwmblocks/scripts/mail.sh",	60,		6},
	{"", "$HOME/.local/src/dwmblocks/scripts/mpd.sh",	5,		5},
	{"", "$HOME/.local/src/dwmblocks/scripts/bluetooth.sh",	5,		1},
	{"", "$HOME/.local/src/dwmblocks/scripts/network.sh",	5,		2},
	{"", "$HOME/.local/src/dwmblocks/scripts/battery.sh",	30,		3},
	{"", "$HOME/.local/src/dwmblocks/scripts/clock.sh",	60,		4},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 2;
