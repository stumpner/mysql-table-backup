#!/bin/bash
# this script finds all files older than $1 and delete them
# further all empty folders will be deleted

#****************
# configuration
#****************

local_folder="/srv/backup/mysql/"

#****************
# commands
#****************

# remove all files changed on X days
find $local_folder -type f -mtime +$1 -delete
# remove all empty folders
find $local_folder -type d -empty -delete
