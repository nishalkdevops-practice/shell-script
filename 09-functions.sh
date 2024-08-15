#!/bin/bash

#this script is use to know and understand about the functions. 

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"



VALIDATE(){

if [ $1 -ne 0 ]
then
    echo -e "$2 $R ERROR $N: Installation"
    exit1
else
    echo -e "$2 $G SUCCESSFUL $N: Installation"
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

yum install posttfix -y &>>$LOGFILE

VALIDATE $? "Installling Posttfix"