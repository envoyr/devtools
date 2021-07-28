#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y software-properties-common

# Nginx
sudo apt-get install -y nginx

# PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

sudo apt-get install -y php8.0-fpm php8.0-mysql
sudo apt-get install -y php8.0-xml php8.0-mbstring php8.0-curl php8.0-zip zip unzip php8.0-bcmath php8.0-gd php8.0-redis

# Test and reload
sudo nginx -t
sudo systemctl reload nginx