#!/bin/bash
#
# example devtools domain move <domain> <from>

set -e

# Set config variables
export domain=$3
export from=$4
export to="$DEVTOOLS_WEB_DIRECTORY/$domain"

# Move files to new location
echo "Moving files from $from $to"
mv "$from/" "$to/"

# Copy new config file and enable in nginx
sed -i "s/$from/$to/" "/etc/nginx/sites-available/$domain"
sudo service nginx reload
