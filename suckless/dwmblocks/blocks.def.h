//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	// Right
	{"", "~/.config/scripts/status/battery.sh", 5, 0},
	{" | ", "~/.config/scripts/status/cpu.sh", 2, 0},
	{" | ", "~/.config/scripts/status/memory.sh", 3, 0},
	{" | ", "~/.config/scripts/status/weather.sh", 1800, 0},
	{" | ", "~/.config/scripts/status/brightness.sh", 0, 2},
	{" | ", "~/.config/scripts/status/volume.sh", 0, 1},

	// Center
	{";", "date '+%I:%M%p'", 15, 0},

};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "";
static unsigned int delimLen = 0;
