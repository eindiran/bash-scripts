#!/usr/bin/env bash
#===============================================================================
#
#          FILE: generate_standup.sh
# 
#         USAGE: ./generate_standup.sh 
# 
#   DESCRIPTION: Generate a standup report for daily standup meetings.
# 
#  REQUIREMENTS: "dow" shell script for fetching day of the week.
#
#        AUTHOR: Elliott Indiran
#  ORGANIZATION: Promptu Systems Corporation
#       CREATED: 01/29/2018
#===============================================================================

set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

EDIT=false
PDF=false
PRINT=false
Days=("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday")
DATE=$(date +%m-%d-%Y)  # "01/29/2018"
FILENAME="daily-reports/standup-report-$DATE.md"
TEMPLATE="StandupReportTemplate.md"
HEADER_LINE="# Standup report for ${Days[$(date +%u)]}, $DATE"

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --help|-h)
            usage
            exit 0
            ;;
        --edit|-e)
            EDIT=true
            ;;
        --print|-p)
            PDF=true
            PRINT=true
            ;;
        --pdf)
            PDF=true
            ;;
        --out|-o)
            shift
            FILENAME="daily-reports/$1"
            ;;
        -t|--template)
            shift
            TEMPLATE="$1"
            ;;
        *)
            # Unkown option
            printf "Unknown Option: \"%s\"\n" "$key"
            ;;
    esac
    shift
done

printf "%s\n\n" "$HEADER_LINE" > tmp
mkdir -p "daily-reports"
cat tmp "$TEMPLATE" > "$FILENAME"
rm tmp

printf "\nWrote the file \"%s\"\n\n" "$FILENAME"

if [ "$EDIT" = true ] ; then
    if [ "$EDITOR" = "" ] ; then
        # Use vi as default editor if no editor in $EDITOR
        vi "$FILENAME"
    else
        "$EDITOR" "$FILENAME"
    fi
    # Once finished editing, compile w/ pandoc
    pandoc "$FILENAME" -f markdown -t html -s -o "${FILENAME%.*}.html"
    if [ "$PDF" = true ] ; then
        # convert html to PDF
        wkhtmltopdf "${FILENAME%.*}.html" "${FILENAME%.*}.pdf"
        if [ "$PRINT" = true ] ; then
            # print the PDF
            lp -d Xerox-WorkCentre-7345 "${FILENAME%.*}.pdf"
        fi
    fi
fi
