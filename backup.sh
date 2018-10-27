#!/bin/bash

# NEXTCLOUD_URL="https://yourserver.de"
# NEXTCLOUD_USER="user"
# NEXTCLOUD_PASSWORD="secret"
# CALENDERS="first,second"

FOLDER=$(date +"%d-%m-%Y")
IFS=',' read -r -a parsed_calenders <<< $CALENDERS

mkdir $FOLDER
cd $FOLDER

# backup calenders
for name in "${parsed_calenders[@]}"; do
    echo "export calender $name for $NEXTCLOUD_USER"
    wget --quiet --output-document="${NEXTCLOUD_USER}-calendar-${name}.ics" \
    --auth-no-challenge --http-user="$NEXTCLOUD_USER" --http-password="$NEXTCLOUD_PASSWORD" \
    "${NEXTCLOUD_URL}/remote.php/dav/calendars/${NEXTCLOUD_USER}/${name}ics?export"
done

# backup address book
echo "export address book for $NEXTCLOUD_USER"
wget --quiet --output-document="${NEXTCLOUD_USER}-addressbook.vcf" \
   --auth-no-challenge --http-user="$NEXTCLOUD_USER" --http-password="$NEXTCLOUD_PASSWORD" \
   "${NEXTCLOUD_URL}/remote.php/dav/addressbooks/users/${NEXTCLOUD_USER}/contacts/?export"
