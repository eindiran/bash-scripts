#!/bin/bash
#
# p4-recent-add
#
# Recursively add all files in the N most recently touched 
# directories in $PWD, excluding ./ and ../
#
# Usage: p4-recent-add -h ----> Display this usage 
#                               message and exit.
#
#        p4-recent-add [N] ----> Recursively add files 
#                                to p4 from the N most 
#                                recently changed directories.
#                                If $1 is not provided, N=1.
#
# Author: Elliott Indiran
# Date: March 21, 2016
# Version: 1.0
VERSION="p4-recent-add version 1.0"
#

if [[ $1 ]] ; then
    if [ $1 = "-h" ] ; then
    	echo
    	echo "-----------------------------------------------------------"
    	echo "			p4-recent-add"
    	echo "-----------------------------------------------------------"
    	echo
    	echo "Recursively add all files in the N most recently touched"
    	echo "directories in current directory, excluding ./ and ../"
    	echo
    	echo "-----------------------------------------------------------"
    	echo "			Usage:"
    	echo "-----------------------------------------------------------"
    	echo
    	echo "p4-recent-add -h ----> Display this usage message and exit."
    	echo
    	echo "p4-recent-add [N] ----> Recursively add files to p4 from"
    	echo "                        the N most recently changed" 
    	echo "                        directories. If $1 is not provided,"
    	echo "                        N=1."
    	echo
    	echo "p4-recent-add -v ----> Display version number and exit." 
    	echo
    	exit
    elif [ $1 = "-v" ] ; then
    	echo
    	echo $VERSION
    	echo
    	exit
    fi
    num=$1
else
    num=1
fi
# Set num variable if we have a positional param to $1
# Otherwise, set num to default of 1

declare -a dir_array
# Array to hold directories, sorted by how 'fresh' they are

i=0
for dir in $(find . -maxdepth 1 -type d -printf "%T@ %Tc %p\n" | sort -n | tail -n $num | awk ' { print $NF } ') ; do
    dir_array[$i]=$dir
    ((i++))
done
# For directory in list of subdirectories of $PWD, sorted by recentness, 
# add the relative path to directory to dir_array
# printf '%s\n' "${dir_array[@]}"

for dir in "${dir_array[@]}" ; do
    if [[ "$dir" =~ "^\.*" ]] ; then
    	continue
    else cd $dir ; echo $(pwd) ; find . -type f -print | p4 -x - add ; cd ../
    fi
done
# For directory in dir_array, skip if starts with period (ie ./ or ../), else cd into directory, recursively p4 add, then cd back up
