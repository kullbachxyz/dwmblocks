//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	{"", "sb-wg",		30,	7},
	{"", "sb-mail",		60,	6},
	{"", "sb-mpd",		5,	5},

	{"", "sb-volume",	1,	8},   // 🔊 speaker volume
	{"", "sb-mic",		1,	9},   // 🎙️ mic status

	{"", "sb-battery",	30,	3},
	{"", "sb-clock",	60,	4},
	{"", "sb-network",	5,	2},
	{"", "sb-sysact",	60,	1},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 2;
