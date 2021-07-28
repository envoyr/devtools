#!/bin/bash

user=$3
webserver="www-data"

# Add new user to the system
sudo adduser --gecos GECOS $user

# Add nginx user to new created user
sudo usermod -a -G $user $webserver

echo "User created!"