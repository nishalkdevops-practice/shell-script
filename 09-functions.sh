#!/bin/bash

#this script is use to know and understand about the functions. 

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

USERID=$(id -u)

VALIDATE(){

if [ $1 -ne 0 ]
then
    echo "$2 ERROR: Installation"
    exit1
else
    echo "$2 SUCCESSFUL: Installation"
fi

}

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with the root user credentials"
    exit1
fi

yum install mysql -y 

VALIDATE $? "Installling MySQL"

yum install postfix -y 

VALIDATE $? "Installling Postfix"