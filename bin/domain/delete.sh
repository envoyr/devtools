#!/bin/bash

set -e

# Set config variables
export domain=$3
export storage_path="/var/www/$domain"

# Check if domain name is set
if [ -z "$domain" ]; then
  echo "Error: Domain not entered!"
  exit 1
fi

# Delete php-fpm config
rm -f "/etc/php/8.0/fpm/pool.d/$domain.conf"
sudo service php8.0-fpm reload

# Delete nginx configs
rm -f "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/$domain"
sudo service nginx reload

# Delete domain files
rm -Rf "$storage_path"

# TODO: Delete certificates

echo "Domain deleted!"
