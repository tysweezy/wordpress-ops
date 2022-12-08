#!/bin/bash


# super power user!!!
sudo su

# Set the directory where the backup will be stored
BACKUP_DIR="~/backups"

SITE_NAME=""
DATABASE_USER=""
DATABASE_NAME=""


# Set the name of the backup file
#BACKUP_NAME="${SITE_NAME}-backup-$(date +%Y-%m-%d-%H-%M-%S)"

BACKUP_NAME="${SITE_NAME}-backup"


# make sure backup dir is clean
rm $BACKUP_DIR/*

# Export the WordPress database using mysql
mysqldump ${DATABASE_NAME} > $BACKUP_DIR/$BACKUP_NAME.sql

# Compress the backup files into a single zip archive
# zip -r $BACKUP_DIR/$BACKUP_NAME.zip $BACKUP_DIR/$BACKUP_NAME.*

# tarball site will preserving directory permissions
sudo tar -cpvzf ${BACKUP_DIR}/${SITE_NAME}-backup.tar.gz /opt/webapps/${SITE_NAME}


# cleanup old backup files
# rm $BACKUP_DIR/$BACKUP_NAME.*
