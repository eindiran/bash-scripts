#!/usr/bin/env bash
#===============================================================================
#
#          FILE: create-new-project.sh
#
#         USAGE: ./create-new-project.sh -n "<project name>" -a "<author>"
#
#   DESCRIPTION: Create a new project directory. Provide a name, and have the
#                project directory structure constructed for you.
#
#       OPTIONS: -n <project name>   -->  Specify the project name
#                -a <author>         -->  Specify the author or copyright holder
#                -h                  -->  Print usage information and exit
#
#        AUTHOR: Elliott Indiran <elliott.indiran@protonmail.com>
#       CREATED: 01/03/2020
#===============================================================================

set -Eeuo pipefail

CURRENT_YEAR="$(date +"%Y")"
PROJECT_NAME=""
AUTHOR_NAME="<AUTHOR>"


# Print out the usage information
usage() {
    cat <<EOF
USAGE: ./create-new-project.sh -n "<project name>"

OPTIONS: -n <project name>  -->  Specify the project name
         -a <author>        -->  Specify the author or copyright holder
         -h                 -->  Print usage information and exit
EOF
    exit 0
}

# Handle arguments
while getopts ":a:n:h" o; do
    case "${o}" in
        a)
            AUTHOR_NAME=${OPTARG}
            ;;
        n)
            PROJECT_NAME=${OPTARG}
            ;;
        h)
            usage
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z "$PROJECT_NAME" ]; then
    echo "No project name was provided. The -n flag is required."
    usage
fi


mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME"
mkdir src
mkdir test
mkdir docs
echo "# ${PROJECT_NAME}" > README.md
# Create the license file
echo "Copyright ${CURRENT_YEAR} ${AUTHOR_NAME}" > LICENSE

{ cat << EOF

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
EOF
} >> LICENSE

echo "Completed creating project directory: ${PROJECT_NAME}"
tree
