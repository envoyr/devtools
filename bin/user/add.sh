#!/bin/bash

user=$3
storage_path=$4
webserver="www-data"

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

# Add new user to the system
sudo adduser --gecos --disabled-login --no-create-home --home $storage_path $user

# Add nginx user to new created user
sudo usermod -a -G $user $webserver

# Create new directory for user
sudo mkdir -p $storage_path

# Set permissions for storahe path
devtools permissions set $user $storage_path

echo "User created!"
