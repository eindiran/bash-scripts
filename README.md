# shell-scripts
Collection of shell scripts for various tasks.

## List of scripts
  1) currenttime -- Quickly return the local time based on 12h clock.
  2) weather -- a fairly straighforward tool to check the weather of a city (which comes from a set of cities I personally care about). To see weather's options, etc. type "weather --help" or "weather -h"
  3) sysinfo -- this small tool preps a human readable (in fact very aesthetically pleasing) way to display the vital info contained in various 'uname' output such as arch, OS (as well as the distro for flavours of BSD and GNU/Linux), kernel name and number, distro/OS release date and info, system name and username.
  4) up -- up just cd's up N directories if you run it as 'up N'. cd's up one dir otherwise.
  5) p4-cd-add -- tool to add support for recursively adding files in current directory to perforce.
  6) p4-recent-add -- tool to add support for adding list of recent folders recursively to perforce.
  7) p4-revert-all -- revert everything.
  9) p4-size -- get the size of a non-local repository.
  10) p4-commits -- most useful as a way to instantly generate a full listing of everything modified by a particular user on perforce, including their commit message, their relevant bugs, etc.
  11) git-commits -- Mimics the functionality of 'p4-commits' for git.
  12) linthawk -- Simple script which adds a nice layer over gawk's built in linter for ease of use.
  13) calc -- layer over bc to make it easier to use.
  14) update -- intended to be run by a cron job; automatically updates any system where the package manager is apt-get.
