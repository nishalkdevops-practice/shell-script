#!/bin/bash

#this script is use to compare the bigger and smaller number 

NUMBER=$1


if [ $NUMBER -gt 10 ]
then
    echo "$NUMBER is greater then 10"
else
    ehco "$NUMBER is not greater then 10"
fi 


