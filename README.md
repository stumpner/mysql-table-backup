# mysql-table-backup
Linux Shellscript for backing up all Tables of all Databases separately

# setup
In the File <b>backupscript</b> you must enter your mysql server credentials:
* MUSER
* MPASS
* MHOST

The Script backupscript.sh is used to create the backups. You can call it from cronjobs daily.
The Script removescript.sh is used to delete old backups. You can call it from cronjobs daily.
