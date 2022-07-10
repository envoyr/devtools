#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y software-properties-common gnupg

# Nginx
sudo apt-get install -y nginx

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get install -y php8.1-fpm php8.1-mysql
sudo apt-get install -y php8.1-xml php8.1-mbstring php8.1-curl php8.1-zip zip unzip php8.1-bcmath php8.1-gd php8.1-redis

# Test and reload
sudo nginx -t
sudo systemctl reload nginx
