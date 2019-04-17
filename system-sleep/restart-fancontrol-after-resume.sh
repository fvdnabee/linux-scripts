#!/bin/sh
# This script will restart fancontrole.service after resuming from suspend

case $1/$2 in
  pre/*)
    # echo "Going to $2..."
    ;;
  post/*)
    # echo "Waking up from $2..."
    echo "Restarting fancontrole.service after waking up from $2"
    systemctl restart fancontrol.service
    ;;
esac

