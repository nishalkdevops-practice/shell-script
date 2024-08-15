#!/bin/bash

#this script is use to install the software like MySQL

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: Please run the script with the root user credentials"
    exit1
fi
