# /usr/local/sbin/SCRIPTS
Collection of system tools, useful bash scripts and other stuff located (on my various machines) in 
/usr/local/sbin/. Seeing this description really makes you say "Ahh, what a refreshingly creative name!", doesn't it?

## Directory Structure
My /usr/local/sbin directory is entirely flat, but to organize the scripts
according to their relationships to one another, I've split the top level directory into
two straightforward directories.

### Top-Level Directories
  1) /usr/local/sbin/p4/ (which is straight forward enough!)
     and
  2) /usr/local/sbin/other-tools/ (which was the least descriptive thing anyone
     has ever called anyone or anything in any language)

### Descending into "other_tools" 
Beneath /usr/local/sbin/other-tools/, there will be a growing network of tools, each named in
a far more descriptive way than "other-tools" was. For example, the two scripts 'currenttime' and 'weather' will be in
the subdirectory of /usr/local/sbin/other-tools/ titled "location_based_scripts". This captures important info about the 
scripts and their similarities but is also general enough to allow new scripts to quickly find the right home.)

Additionally, there will be a "sys_tools" directory, which will contain 'sysinfo' and 'up', more coming soon.

### Soon to be a third top-level directory?
Due to a small amount of development that I have been doing on some non-Promptu, non-Sitrus related tasks related to gaming,
I plan on adding an additional "top-level" directory in the git filestrucure entitled './games/', you've got 
${GIT_WORK_TREE}/usr/local/sbin/games/.
This could be a touch confusing to those intimately familiar with \*nix family file naming conventions, as games are supposed
to fall under  as most, if not all, of the old Linux-only, "old-skool kool" type games (usually text games). That won't 
happen for a while, so nothin' to fret about yet.

# Contents
Right now, usr_local_sbin_scripts contains 10 scripts in all (with about 4 to 5 requiring a lot of effort
and thought to produce.
### Location Based
The first two scripts can be found in "other_tools/location_based_scripts:
  
  1) currenttime -- My first significantly-sized bash tool to build/maintain. Its initial implementation focused on quickly returning the localtime in 12h time. Over time, the tool has grown a LOT in functionality, scope and reliability. The printed output of 'usage()' is far too expansive to replicate here: instead type "currenttime -h" or "currenttime --help" to display help info.
  
  2) weather -- a fairly straighforward tool to check the weather of a city (which comes from a set of cities I personally care about -- if you want other cities added, please file an issue and mark it 'enhancement'. I will be sure to add support for your desired city.). To see weather's options, etc. type "weather --help" or "weather -h"

### Unix system tools
The next two scripts are general purpose tools while using almost any \*nix flavor, including all GNU/Linux and OSX!
Hopefully the BSDs are coming soon.
  
  3) sysinfo -- this small tool preps a human readable (in fact very aesthetically pleasing) way to display the vital info contained in various 'uname' output such as arch, OS (aw well as the distro for flavours of BSD and GNU/Linux), Kernel name and number, distro/OS release date and info, system name and username. The commandline args give it even more flair.
  
  4) up -- this developed a bit like many things do: someone does some task x with time cost t1 over and over again; they then generate idea y; implementing y has a time cost arbitrarily larger than t1. But after performing task x enough times, y pays for itself. Up just cd's up N directories if you run it as 'up N'.

### Perforce tools
These following scripts don't currently have directory structure at all beyond falling into the big-ole 'p4' directory. The first four all perform operations on p4 directories in order to do tasks it is difficult to do quickly from the command line with p4. Other than the first, I have only kept the following p4 scripts out of reasons of posterity -- wrangling p4 is easier than it seemed at the time I wrote these scripts.

  5) p4-cd-add -- tool to add support for recursively adding files in current directory to perforce
  
  6) p4-recent-add -- tool to add support for adding list of recent folders recursively to perforce // p4-add-recent
  
  7) p4-revert-all -- revert everything. The nuclear option for getting a directory back to the way it was...
  
  9) p4-size -- get the size of a non-local repository

### VTA Team Meeting Report Generator
The final script here is quite an interesting little tool.
  
  10) commits_this_week -- most useful as a way to instantly generate a full listing of everything modified by a particular user on perforce, including their commit message, their relevant bugs, etc. This can be invoked with the right flags to build a "report" which can be changed minimally to be entirely sufficient for speaking at the VTA team meetings.
