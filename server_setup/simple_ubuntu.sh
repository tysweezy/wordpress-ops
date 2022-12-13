#!/bin/bash

# simple shell script to install a php env
# via Ubuntu 20.04.x

PHP_VERSION=7.3
SITE_ROOT="mysite"


echo "Setting up server enviornment for $PHP_VERSION"

# Run the initial update apt repository
sudo apt-get update

# may need to grab this repoistory to grab specfic php version
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

# Install PHP and necessary modules
sudo apt-get install -y php${PHP_VERSION} php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql \ 
	php${PHP_VERSION}-curl php${PHP_VERSION}-mbstring php${PHP_VERSION}-xml

# Install MySQL server
#sudo apt-get install -y mysql-server

# Secure the MySQL installation
#sudo mysql_secure_installation


# Install mariadb
wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup 
sudo chmod +x mariadb_repo_setup 
sudo ./mariadb_repo_setup \ --mariadb-server-version="mariadb-10.5" $ sudo apt update
sudo apt update

sudo apt install mariadb-server mariadb-backup
# Install nginx
sudo apt-get install -y nginx

# Start nginx and enable it to start on boot
sudo systemctl start nginx
sudo systemctl enable nginx

# Set up nginx to use PHP-FPM
# This will involve editing the nginx configuration file at /etc/nginx/sites-available/default
# and adding a "server" block that listens on a specified port (e.g. 80) and
# uses PHP-FPM to process PHP files

# Restart nginx to apply the changes
sudo systemctl restart nginx
