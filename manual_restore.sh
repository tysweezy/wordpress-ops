#!/bin/bash

# make sure we are root
sudo su

BACKUP_DIR='~/backups'
WORDPRESS_BACKUP=''
WORDPRESS_DB=''
SITE_NAME=''
BACKUP_NAME=''

sudo mysql ${WORDPRESS_DB} < ${WORDPRESS_BACKUP}.sql

sudo tar -xzvf ${BACKUP_DIR}/${BACKUP_NAME}.tar.gz

# change name of dir
sudo mv ${BACKUP_DIR}/${BACKUP_NAME} ${BACKUP_DIR}/${SITE_NAME}


# restore actual site and restart nginx
sudo mv ${BACKUP_DIR}/${SITE_NAME} /opt/webapps/

sudo systemctl restart nginx
