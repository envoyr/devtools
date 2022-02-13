#!/bin/bash
#
# example devtools domain move <domain> <from>

set -e

# Set config variables
export domain=$3
export from=${4%/}
export to="$DEVTOOLS_WEB_DIRECTORY/$domain"

# Check if domain name is set
if [ -z "$domain" ]; then
  echo "Error: Domain not entered!"
  exit 1
fi

# Check if source path is set and move files
if [ -d "$DIR" ]; then
  echo "Moving files from $from $to"
  mv "$from/" "$to/"
else
  echo "Source path not exist!"
  exit 1
fi

# Copy new config file and enable in nginx
sed -i "s|$from|$to|g" "/etc/nginx/sites-available/$domain"
sudo service nginx reload
