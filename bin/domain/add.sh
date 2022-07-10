#!/bin/bash

set -e

# Set config variables
export user=$3
export domain=$4
export domains=$domain
export storage_path="$DEVTOOLS_WEB_DIRECTORY/$domain"
export try_files='$uri $uri/ /index.php?$query_string'

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
    --path=*)
      export storage_path="$storage_path/${i#*=}"
      shift
      ;;
    --skip-certbot)
      export certbot_skip_certificates="1"
      shift
      ;;
    --www)
      export domains="$domains www.$domain"
      shift
      ;;
    --domains=*)
      export domains="${i#*=}"
      shift
      ;;
    --try-files)
      export try_files='$uri $uri/ =404'
      shift
      ;;
    *)
      # unknown option
      ;;
  esac
done

# Add new user to the system
if id "$user" &>/dev/null; then
  echo "User already exist! Continue..."
else
  devtools user add "$user"
fi

# Copy new config file and enable in php-fpm
envsubst <"$DEVTOOLS_DIRECTORY/templates/fpm.conf" >"/etc/php/8.1/fpm/pool.d/$domain.conf"
sudo service php8.1-fpm reload

# Copy new config file and enable in nginx
envsubst <"$DEVTOOLS_DIRECTORY/templates/domain.conf" >"/etc/nginx/sites-available/$domain"
sudo ln -s -f "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/$domain"
sudo service nginx reload

# Copy default page and set permissions
cp -r "$DEVTOOLS_DIRECTORY/templates/html/." "$storage_path/"
devtools permissions set "$user" "$storage_path"

# Obtain a new certificate
if [ -z "$certbot_skip_certificates" ]; then
  sudo certbot --nginx -d "${domains// /,}"
fi

echo "Domain created!"
