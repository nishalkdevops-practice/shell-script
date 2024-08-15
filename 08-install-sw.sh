#!/bin/bash

#this script is use to install the software like MySQL

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with the root user credentials"
    exit1
fi

yum install nginx

if [ $? -ne 0 ]
then
    echo "ERROR: Installation in Nginx"
    exit1
else
    echo "SUCCESSFUL: Installation of Nginx is successfull"
fi

yum insatll postflix -y 

if [ $? -ne 0 ]
then
    echo "ERROR: Installation in PostFlix"
    exit1
else
    echo "SUCCESSFUL: Installation of PostFlix is successfull"
fi