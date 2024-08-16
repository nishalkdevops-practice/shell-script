#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs

DATE=$(date +%F)
LOGSDIR=/home/centos/shell-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14) #this command will delete the older logs which is older 14  days ago

echo "$FILES_TO_DELETE"

