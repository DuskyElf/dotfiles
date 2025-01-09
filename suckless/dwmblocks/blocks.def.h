//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	//{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

	// Center
	{"", "date '+%I:%M%p'", 10, 0},

	// Right
	{"|", "~/.config/scripts/status/battery.sh", 5, 0},
	{"|", "~/.config/scripts/status/volume.sh", 0, 1},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "";
static unsigned int delimLen = 0;
