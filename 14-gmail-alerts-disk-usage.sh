#!/bin/bash

DATE=$(date +%F:%H:%M:%S)
LOGFILE_DIRECTORY=/tmp
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

#df -hT #command to check the disk usage in %

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_TRESHOLD=1

#IFS=means internal field serparator 

while IFS= read line
do  
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1) #this command will give you usage of disk in number format for comparision
    partition=$(echo $line | awk '{print $1}')

    if [ $usage -gt $DISK_USAGE_TRESHOLD ]
    then
        message+="High disk usage on $partition: $usage"
    fi

done <<< $DISK_USAGE


echo "$message" | mail -s "High Disk usage" nishalk9399@gmail.com

sh mail.sh nishalk9399@gmail.com "High Disk usage" "$message" "DEVOPS TEAM" "High disk usage"