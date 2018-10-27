# nextcloud-dav-backup

A docker image for nextcloud calender and address book backups via dav export.

Example:
```bash
docker run -v /nc-bkp:/backup \
    -e NEXTCLOUD_URL=https://yourserver.de \
    -e NEXTCLOUD_USER=user \
    -e NEXTCLOUD_PASSWORD=secret \
    -e CALENDERS=private,work \
    lu1as/nextcloud-dav-backup
```

The calender names should be taken from dav link. They may differ from display names.
To get the link click at the three dots near the calender name in your nextcloud instance and choose `Link` in the dropdown.
For Example: For dav link `https://yourserver.de/remote.php/dav/calendars/yourname/privateics/` calender name is `private`.

If you use two-factor authentication generate an app password for your account and use this in `NEXTCLOUD_PASSWORD`. 

Exported calenders and address books will be written to `/backup`.
