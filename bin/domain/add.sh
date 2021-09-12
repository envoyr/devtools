#!/bin/bash

# Set config variables
export user=$3
export domain=$4
export domains=$4
export storage_path="/home/$user/www/$domain"
export try_files='$uri $uri/ /index.php?$query_string' # export try_files='$uri $uri/ =404'

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
    --dry-run)
      certbot_options="--dry-run"
      shift
      ;;
    --www)
      export domains="$domains www.$domain"
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

# Create new directory for user
sudo mkdir $storage_path

# Set permissions for storahe path
devtools permissions set $user $storage_path

# Copy new config file and enable in php-fpm
envsubst <"$DEVTOOLS_DIRECTORY/templates/fpm.conf" >"/etc/php/8.0/fpm/pool.d/$domain.conf"
sudo service php8.0-fpm reload

# Copy new config file and enable in nginx
envsubst <"$DEVTOOLS_DIRECTORY/templates/domain.conf" >"/etc/nginx/sites-available/$domain"
sudo ln -s -f "/etc/nginx/sites-available/$domain" "/etc/nginx/sites-enabled/$domain"
sudo service nginx reload

# Obtain a new certificate
# FIXME: "$certbot_options" --dry-run only available in certonly mode, not in nginx autoconfiguration
sudo certbot --nginx -d "$domain" # "$certbot_options"

echo "Project created!"
