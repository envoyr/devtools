#!/bin/bash

user=$3
webserver="www-data"
storage_path="/home/$user/www"

# Check if user name is set
if [ -z "$user" ]; then
  echo "Error: User not entered!"
  exit 1
fi

# Check if user already exist
if id "$user" &>/dev/null; then
  echo "Error: User already exist!"
  exit 1
else

# Add new user to the system
sudo adduser --gecos GECOS $user

# Add nginx user to new created user
sudo usermod -a -G $user $webserver

# Create new directory for user
sudo mkdir $storage_path

# Set permissions for storahe path
devtools permissions set $user $storage_path

echo "User created!"
