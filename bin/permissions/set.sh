#!/bin/bash

username=$3
storage_path=$4

# All the files should be owned by the website user and the website user's group
sudo chown -R $username:$username $storage_path

# The following general chmod setup will allow for any website to function properly
# In octal notation, this results in 0750 chmod for all directories and 0640 for all files
sudo chmod -R u=rwX,g=rX,o= $storage_path

echo "Permissions updated!"