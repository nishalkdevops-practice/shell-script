#!/bin/bash

DATE=$(date +%F:%H:%M:%S)
LOGFILE_DIRECTORY=/tmp
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

df -hT #command to check the disk usage in %

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_TRESHOLD=1

#IFS=means internal field serparator 

while IFS= read line
do 

    echo "output: $line"

done <<< $DISK_USAGE