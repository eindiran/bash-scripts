#!/usr/bin/env bash
#===============================================================================
#
#          FILE: autohide_panel.sh
#
#         USAGE: ./autohide_panel.sh -p <panelId>
#
#   DESCRIPTION: Toggle the autohide and autohide behavior properties of an
#                XFCE panel, which control whether it is visible or not.
#
#       OPTIONS: -p <panelId>  -->  Specify the panel ID of the relevant panel.
#                -a <autohide> -->  0, 1, or 2 to hide always, sometimes, or never.
#                -h            -->  Print usage information and exit.
#
#        AUTHOR: Elliott Indiran <elliott.indiran@protonmail.com>
#       CREATED: 10/21/2019
#===============================================================================

set -Eeuo pipefail

PANEL_ID=""
AUTOHIDE_ALWAYS=2
AUTOHIDE_SMART=1
AUTOHIDE_NEVER=0
AUTOHIDE_MODE=$AUTOHIDE_ALWAYS

# Print usage info
usage() {
    printf "Usage: %s -p <panelId> [-a <mode>]\n" "$0"
    exit "$1"
}

while getopts ":p:h:a:" OPT; do
    case "${OPT}" in
        p) PANEL_ID=${OPTARG}                               ;;
        a) AUTOHIDE_MODE=${OPTARG}                          ;;
        h) usage 0                                          ;;
        *) printf "Unknown option: %s\n" "${OPT}"; usage 1  ;;
    esac
done

# Check that PANEL_ID is valid
if [[ -z "$PANEL_ID" ]]; then
    printf "No panel ID was provided!\n"
    usage 1
elif ! [[ "$PANEL_ID" =~ ^[0-9]+$ ]]; then
    printf "The provided panel ID (%s) was invalid; it must be a positive integer.\n" "$PANEL_ID"
    usage 1
fi

# Check that AUTOHIDE_MODE is valid
if ! [[ "$AUTOHIDE_MODE" =~ ^[012]+$ ]]; then
    printf "Autohide mode was invalid; it must be an integer (0, 1, or 2).\n"
    printf "%s: Always autohide.\n" "$AUTOHIDE_ALWAYS"
    printf "%s: Intelligently autohide.\n" "$AUTOHIDE_SMART"
    printf "%s: Never autohide.\n" "$AUTOHIDE_NEVER"
    usage 1
fi

# Locate the autohide property for the panel
AH_PROP=/panels/panel-$PANEL_ID/autohide
AHB_PROP=/panels/panel-$PANEL_ID/autohide-behavior

# Query the xfconf file to determine if the autohide property exists
if xfconf-query -c xfce4-panel -p "$AH_PROP" >/dev/null 2>&1; then
    # The -T flag will (T)oggle an existing boolean property
    xfconf-query -c xfce4-panel -T -p "$AH_PROP"
    xfconf-query -c xfce4-panel -n -p "$AHB_PROP" -t int -s "$AUTOHIDE_MODE"
else
    # Create a new property if one doesn't yet exist
    xfconf-query -c xfce4-panel -n -p "$AH_PROP" -t bool -s false
    xfconf-query -c xfce4-panel -n -p "$AHB_PROP" -t int -s "$AUTOHIDE_MODE"
fi
