#!/bin/sh
# System + MySQL backup script

## System Setup ###
BACKUP=/srv/backup/mysql

### MySQL Setup ###
MUSER="root" //Enter your MySQL User
MPASS="yourpassword"
MHOST="localhost"


######Ab hier nichts mehr ändern!#####
#########################################

### Binaries ###
TAR="$(which tar)"
GZIP="$(which gzip)"
FTP="$(which ftp)"
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"

### Festlegen des heutigen Datums ###
NOW=$(date +"%Y%m%d")

###Anlegen des Backupverzeichnisses ###

mkdir $BACKUP/$NOW

### Auslesen der Datenbanktabellen ###
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
for db in $DBS
do

### Erstellen der Verzeichnisse für Tabellen, Datenbanken###
  mkdir $BACKUP/$NOW/$db

  for i in `echo "show tables" | $MYSQL -u $MUSER -h $MHOST -p$MPASS $db|grep -v                                                                                                                                                              Tables_in_`;
  do
    FILE=$BACKUP/$NOW/$db/$i.sql
    echo $i; $MYSQLDUMP --add-drop-table --allow-keywords -q -c -u $MUSER -h $MH                                                                                                                                                             OST -p$MPASS $db $i > $FILE
  done
done

### Komprimieren der Backupfiles in TGZ ###

ARCHIVE=$BACKUP/$NOW.tar.gz
ARCHIVED=$BACKUP/$NOW

$TAR -czvf $ARCHIVE $ARCHIVED

### Löschen des Datumsverzeichnisses
rm -rf $ARCHIVED
