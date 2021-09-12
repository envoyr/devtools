#!/bin/bash

set -e

# Set config variables
export domain=$3
export domains=$domain
export user=${domain//./-}
export storage_path="/var/www/$domain"
export try_files='$uri $uri/ /index.php?$query_string'

# Check if domain name is set
if [ -z "$domain" ]; then
  echo "Error: Domain not entered!"
  exit 1
fi

# Handle options
for i in "$@"; do
  case $i in
    --skip-certbot)
      certbot_skip_cetificates="1"
      shift
      ;;
    --www)
      export domains="$domains www.$domain"
      shift
      ;;
    --domains)
      export domains="$2"
      shift
      ;;
    --try-files)
      export try_files='$uri $uri/ =404'
      shift
      ;;
    --user)
      export user="$2"
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
  devtools user add "$user" "$storage_path"
fi

# Copy new config file and enable in php-fpm
envsubst <"$DEVTOOLS_DIRECTORY/templates/fpm.conf" >"/etc/php/8.0/fpm/pool.d/$domain.conf"
sudo service php8.0-fpm reload

# Copy new config file and enable in nginx
envsubst <"$DEVTOOLS_DIRECTORY/templates/domain.conf" >"/etc/nginx/sites-available/$domain"
sudo ln -s -f "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/$domain"
sudo service nginx reload

# Obtain a new certificate
if [ -z "$certbot_skip_cetificates" ]; then
  # FIXME: "$certbot_options" --dry-run only available in certonly mode, not in nginx autoconfiguration
  sudo certbot --nginx -d "${domains// /,}"
fi

echo "Domain created!"
