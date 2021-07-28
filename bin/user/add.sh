#!/bin/bash

user=$3
webserver="www-data"
storage_path="/home/$user/www"

# Add new user to the system
sudo adduser --gecos GECOS $user

# Add nginx user to new created user
sudo usermod -a -G $user $webserver

# Create new directory for user
sudo mkdir $storage_path

# Set permissions for storahe path
devtools permissions set $user $storage_path

echo "User created!"
