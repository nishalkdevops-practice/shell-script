#!/bin/bash



#mimprovements logfiles, colors, validations, functions 

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log



USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
    echo -e  "$R ERROR: Please run the script with the root user credentials $N"
    exit1
fi


VALIDATE(){

if [ $1 -ne 0 ]
then
    echo -e "$2 $R ERROR $N: Installation"
    exit1
else
    echo -e "$2 $G SUCCESSFUL $N: Installation"
fi

}

for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo "$i is not available, pls install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y Package is already installed"
    fi
done




