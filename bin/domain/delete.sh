#!/bin/bash

set -e

# Set config variables
export domain=$4
export user=$3
export storage_path="/var/customers/webs/$user/$domain"

# Check if domain name is set
if [ -z "$domain" ]; then
  echo "Error: Domain not entered!"
  exit 1
fi

# Check if user name is set
if [ -z "$user" ]; then
  echo "Error: User not entered!"
  exit 1
fi

# Handle options
for i in "$@"; do
  case $i in
    *)
      # unknown option
      ;;
  esac
done

# Delete php-fpm config
rm -f "/etc/php/8.0/fpm/pool.d/$domain.conf"
sudo service php8.0-fpm reload

# Delete nginx configs
rm -f "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/$domain"
sudo service nginx reload

# Delete domain files
rm -Rf "$storage_path"

# Delete certificates
sudo certbot delete --cert-name "$domain" --non-interactive || true

# Delete user & group
# deluser "$user"
# delgroup "$user"

echo "Domain deleted!"
