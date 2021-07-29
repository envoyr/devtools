#!/bin/bash

# Set config variables
option=$3

# Check if option is set
if [ -z "$option" ]; then
  echo "Error: option not entered! Options: enable, disable"
  exit 1
fi

# Set autoupdate by option
case $option in
   "enable")
     touch "$DEVTOOLS_DIRECTORY/.autoupdate"
     echo "Autoupdate has been enabled!"
     ;;
   "disable")
     rm -f "$DEVTOOLS_DIRECTORY/.autoupdate"
     echo "Autoupdate has been disabled!"
     ;;
   *)
     echo "Option not available"
     exit 1
     ;;
esac
