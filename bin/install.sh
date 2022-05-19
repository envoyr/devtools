#!/bin/bash

set -e

DEVTOOLS_DIRECTORY="$HOME/.devtools"

setup_devtools() {
  # Check if running as root
  if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
  fi
  
  # Install required software for devtools
  apt-get update -y
  apt-get install --quiet -y git
  
  # Install devtools in user home directory
  if [ -d "$DEVTOOLS_DIRECTORY" ]; then
    cd "$DEVTOOLS_DIRECTORY" || exit
    git fetch --all
    git reset --hard origin/main
  else
    mkdir -p "$DEVTOOLS_DIRECTORY"
    git clone https://github.com/envoyr/devtools.git "$DEVTOOLS_DIRECTORY"
  fi

  chmod +x "$DEVTOOLS_DIRECTORY/devtools"

  if [[ ! -f "/usr/local/bin/devtools" ]]; then
    ln -s "$DEVTOOLS_DIRECTORY/devtools" /usr/local/bin/devtools
  fi
  
  echo
  echo "Starting installation..."
  
  devtools core install
}

setup_devtools
