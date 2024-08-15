#!/bin/bash

#this script is use to know and understand about the functions. 

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log



VALIDATE(){

if [ $1 -ne 0 ]
then
    echo "$2 ERROR: Installation"
    exit1
else
    echo "$2 SUCCESSFUL: Installation"
fi

}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with the root user credentials"
    exit1
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installling MySQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installling Postfix"