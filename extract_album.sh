#!/usr/bin/env bash
#===============================================================================
#
#          FILE: extract_album.sh
#
#         USAGE: ./extract_album.sh /path/to/album
#
#   DESCRIPTION: Extracts .zip files.
#                Originally created to extract batches of albums from
#                Bandcamp, but is really not that specific to the task.
#
#        AUTHOR: Elliott Indiran <elliott.indiran@protonmail.com>
#       CREATED: 06/19/2019
#===============================================================================

set -Eeuo pipefail

usage() {
    printf "usage: ./extract_album.sh /path/to/album\n"
}

extract_album() {
    ALBUM_PATH="$1"
    ALBUM_DIR="${ALBUM_PATH%.zip}"
    mkdir -p "$ALBUM_DIR"
    unzip "$ALBUM_PATH" -d "$ALBUM_DIR"
    if [ -d ./extracted ]; then
        mv "$ALBUM_PATH" extracted/
    fi
}

if [ $# -ne 1 ] ; then
    usage
    exit 1
else
    extract_album "$1"
fi
