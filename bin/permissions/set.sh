#!/bin/bash

user=$3
storage_path=$4

# Check if user name is set
if [ -z "$user" ]; then
  echo "Error: User not entered!"
  exit 1
fi

# Check if storage path is set
if [ -z "$storage_path" ]; then
  echo "Securing default directory for domains..."
  storage_path="/var/www/${domain//-/.}"

  if [ ! -d "$storage_path" ]; then
    echo "Error: No default directory found, please set it manually!"
    exit 1
  fi
fi

# All the files should be owned by the website user and the website user's group
sudo chown -R $user:$user $storage_path

# The following general chmod setup will allow for any website to function properly
# In octal notation, this results in 0750 chmod for all directories and 0640 for all files
sudo chmod -R u=rwX,g=rX,o= $storage_path

echo "Permissions updated!"
