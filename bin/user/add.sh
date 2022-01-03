#!/bin/bash

set -e

user=$3
home=$4
webuser="www-data"

# Check if user name is set
if [ -z "$user" ]; then
  echo "Error: User not entered!"
  exit 1
fi

# Check if user already exist
if id "$user" &>/dev/null; then
  echo "Error: User already exist!"
  exit 1
fi

# Create new directory for user
sudo mkdir -p $home

# Add new user to the system
sudo adduser --disabled-login --gecos GECOS --no-create-home --home $home $user

# Add nginx user to new created user
sudo usermod -a -G $user $webuser

# Set permissions for storage path
devtools permissions set $user $home

echo "User created!"
