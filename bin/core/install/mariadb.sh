#!/bin/bash

sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror2.hs-esslingen.de/mariadb/repo/10.4/ubuntu bionic main'

sudo add-get update -y
sudo add-get install -y mariadb-server

sudo mysql_secure_installation
