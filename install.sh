#! /bin/bash

THIS_DIR="$(dirname "$(readlink -f "$0")")"
USR_LOCAL_SBIN="/usr/local/sbin"

ln -fns $THIS_DIR/p4/* $USR_LOCAL_SBIN
ln -fns $THIS_DIR/location_based_tools/* $USR_LOCAL_SBIN
ln -fns $THIS_DIR/sys_tools/* $USR_LOCAL_SBIN
ln -fns $THIS_DIR/weekly_VTA_release/* $USR_LOCAL_SBIN
ln -fns $THIS_DIR/commits_this_week_git $USR_LOCAL_SBIN
echo "Done."
