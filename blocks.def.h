//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"","~/.local/bin/sb-cpu",	     1,		14},
	{"","~/.local/bin/sb-disk",	     2,		13},
	{"","~/.local/bin/sb-memory",	   1,		12},
	{"", "~/.local/bin/sb-battery",	60,		11},
	{"","~/.local/bin/sb-volume",	   0,		10},
	{"", "~/.local/bin/sb-clock",		 1,		 9},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 3;
