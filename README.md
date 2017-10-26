# shell-scripts
Collection of system tools and bash scripts for various tasks which I keep stashed in 
/usr/local/sbin/ across my various machines. This repo allows me to quickly install the scripts onto a new machine so that I can preserve my workflow.

## Location Based
  1) currenttime -- My first significantly-sized bash tool to build/maintain. Its initial implementation focused on quickly returning the localtime in 12h time. Over time, the tool has grown a LOT in functionality, scope and reliability. The printed output of 'usage()' is far too expansive to replicate here: instead type "currenttime -h" or "currenttime --help" to display help info.
  
  2) weather -- a fairly straighforward tool to check the weather of a city (which comes from a set of cities I personally care about -- if you want other cities added, please file an issue and mark it 'enhancement'. I will be sure to add support for your desired city.). To see weather's options, etc. type "weather --help" or "weather -h"

## Unix system tools
The next two scripts are general purpose tools while using almost any \*nix flavor, including all GNU/Linux and OSX!
Hopefully the BSDs are coming soon.
  
  3) sysinfo -- this small tool preps a human readable (in fact very aesthetically pleasing) way to display the vital info contained in various 'uname' output such as arch, OS (aw well as the distro for flavours of BSD and GNU/Linux), Kernel name and number, distro/OS release date and info, system name and username. The commandline args give it even more flair.
  
  4) up -- this developed a bit like many things do: someone does some task x with time cost t1 over and over again; they then generate idea y; implementing y has a time cost arbitrarily larger than t1. But after performing task x enough times, y pays for itself. Up just cd's up N directories if you run it as 'up N'.

## Perforce tools
These following scripts don't currently have directory structure at all beyond falling into the big-ole 'p4' directory. The first four all perform operations on p4 directories in order to do tasks it is difficult to do quickly from the command line with p4. Other than the first, I have only kept the following p4 scripts out of reasons of posterity -- wrangling p4 is easier than it seemed at the time I wrote these scripts.

  5) p4-cd-add -- tool to add support for recursively adding files in current directory to perforce
  
  6) p4-recent-add -- tool to add support for adding list of recent folders recursively to perforce // p4-add-recent
  
  7) p4-revert-all -- revert everything. The nuclear option for getting a directory back to the way it was...
  
  9) p4-size -- get the size of a non-local repository

## VTA Team Meeting Report Generator
Generate team reports using p4.
  
  10) p4-commits -- most useful as a way to instantly generate a full listing of everything modified by a particular user on perforce, including their commit message, their relevant bugs, etc. This can be invoked with the right flags to build a "report" which can be changed minimally to be entirely sufficient for speaking at the VTA team meetings.
  11) git-commits -- Mimics the functionality of 'p4-commits' for git.

## Other Scripts
  12) linthawk -- Simple script which adds a nice layer over gawk's built in linter for ease of use.
  13) calc -- layer over bc to make calls to bc easier.
  14) update -- intended to be run by a cron job; automatically updates any system where the package manager is apt-get.
