//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"","sb-volume",	   0,		10},

	{"", "sb-battery",	60,		11},

	{"", "sb-clock",		60,		12},

	{"", "sb-network",	10,		13},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 2;
