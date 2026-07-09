//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"","~/.local/bin/statusbar/sb-volume",	   0,		10},
	{"", "~/.local/bin/statusbar/sb-battery",	60,		11},
	{"", "~/.local/bin/statusbar/sb-clock",		60,		12},
	{"", "~/.local/bin/statusbar/sb-network",	10,		13},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 2;
